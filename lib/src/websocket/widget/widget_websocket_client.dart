import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/io.dart';

import 'package:tdclient_dart/src/websocket/widget/i_widget_websocket_client.dart';
import 'package:tdclient_dart/src/websocket/websocket_dtos/websocket_dtos.dart';
import 'package:tdclient_dart/src/websocket/websocket_event_names.dart';
import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';
import 'package:tdclient_dart/src/utils/extensions.dart';

class WidgetWebSocketClient implements IWidgetWebSocketClient {
  final Uri uri;
  final Iterable<String> protocols;
  final Map<String, dynamic> headers;
  final Duration pingInterval;

  IOWebSocketChannel _channel;

  @override
  Stream<WebsocketEvent<Map<String, dynamic>>> rawStream;

  @override
  Stream<WebsocketEvent<MessageListContainer>> messagesStream;

  WidgetWebSocketClient({
    @required this.uri,
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

  Stream<WebsocketEvent<Map<String, dynamic>>> _getRawStream(
    Stream<dynamic> channelStream,
  ) async* {
    await for (final stringEvent in channelStream) {
      final jsonEvent = jsonDecode(stringEvent);
      final serializedEvent = WebsocketEvent<Map<String, dynamic>>.fromJson(jsonEvent, (json) => json);

      if (!serializedEvent.confirmId.isEmptyOrNull) {
        final confirmEvent = WebsocketEvent(
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

  Stream<WebsocketEvent<MessageListContainer>> _getMessagesStream(
    Stream<WebsocketEvent<Map<String, dynamic>>> eventStream,
  ) async* {
    await for (final event in eventStream) {
      if (event.event == WebSocketEventNames.serverMessageUpdated) {
        yield WebsocketEvent(
          event: event.event,
          params: MessageListContainer.fromJson(event.params),
          confirmId: event.confirmId,
        );
      }
    }
  }
}
