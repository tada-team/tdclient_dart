import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import 'package:tdclient_dart/src/websocket/widget/i_widget_websocket_client.dart';
import 'package:tdclient_dart/src/websocket/websocket_dtos/websocket_dtos.dart';
import 'package:tdclient_dart/src/websocket/websocket_event_names.dart';
import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';

class WidgetWebSocketClient implements IWidgetWebSocketClient {
  final Uri uri;
  final Iterable<String>? protocols;
  final Map<String, dynamic>? headers;
  final Duration? pingInterval;

  late final IOWebSocketChannel _channel;

  @override
  late final Stream<WebSocketEvent<Map<String, dynamic>>> rawStream;

  @override
  late final Stream<WebSocketEvent<MessageListContainer>> messagesStream;

  WidgetWebSocketClient({
    required this.uri,
    this.protocols,
    this.headers,
    this.pingInterval,
  });

  @override
  void connect() {
    _channel = IOWebSocketChannel.connect(
      uri.toString(),
      protocols: protocols,
      headers: headers,
      pingInterval: pingInterval,
    );
    rawStream = _getRawStream(_channel.stream);
    messagesStream = _getMessagesStream(rawStream);
  }

  @override
  Future close() => _channel.sink.close();

  Stream<WebSocketEvent<Map<String, dynamic>>> _getRawStream(
    Stream<dynamic> channelStream,
  ) async* {
    await for (final stringEvent in channelStream) {
      final jsonEvent = jsonDecode(stringEvent);
      final serializedEvent = WebSocketEvent.fromJson(
        jsonEvent,
        (json) => json as Map<String, dynamic>,
      );

      if (serializedEvent.confirmId != null) {
        final confirmEvent = WebSocketEvent(
          event: WebSocketEventNames.clientConfirm,
          params: ConfirmContainer(
            confirmId: serializedEvent.confirmId,
          ),
        );
        final stringConfirmEvent = jsonEncode(
          confirmEvent.toJson((container) => container.toJson()),
        );
        _channel.sink.add(stringConfirmEvent);
      }

      yield serializedEvent;
    }
  }

  Stream<WebSocketEvent<MessageListContainer>> _getMessagesStream(
    Stream<WebSocketEvent<Map<String, dynamic>>> eventStream,
  ) async* {
    await for (final event in eventStream) {
      if (event.event == WebSocketEventNames.serverMessageUpdated) {
        yield WebSocketEvent(
          event: event.event,
          params: MessageListContainer.fromJson(event.params!),
          confirmId: event.confirmId,
        );
      }
    }
  }
}
