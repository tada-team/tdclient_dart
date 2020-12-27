import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:web_socket_channel/io.dart';

import 'package:tdclient_dart/src/utils/logger.dart';
import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';
import 'package:tdclient_dart/src/widget/constants.dart';
import 'package:tdclient_dart/src/utils/extensions.dart';
import 'package:tdclient_dart/src/widget/widget_websocket_client/websocket_dtos/websocket_dtos.dart';

class WidgetWebsocketClient {
  final _socketEndpoint = Constants.websocketApiUri;
  final Cookie _cookie;

  IOWebSocketChannel _channel;
  Stream<WebsocketEvent<Map<String, dynamic>>> eventStream;
  Stream<WebsocketEvent<MessageListContainer>> messagesStream;

  WidgetWebsocketClient(this._cookie);

  void connect() {
    _channel = IOWebSocketChannel.connect(
      _socketEndpoint,
      headers: {
        'cookie': SerializableCookie(_cookie).toJson(),
      },
    );
    eventStream = _getEventStream(_channel.stream);
    messagesStream = _getMessagesStream(eventStream);
  }

  void close() {
    _channel.sink.close();
  }

  Stream<WebsocketEvent<Map<String, dynamic>>> _getEventStream(
    Stream<dynamic> channelStream,
  ) async* {
    await for (final stringEvent in channelStream) {
      final jsonEvent = jsonDecode(stringEvent);
      logger.wtf(jsonEvent);
      final serializedEvent = WebsocketEvent<Map<String, dynamic>>.fromJson(jsonEvent, (json) => json);

      if (!serializedEvent.confirmId.isEmptyOrNull) {
        final confirmEvent = WebsocketEvent(
          event: EventNames.clientConfirm,
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
      if (event.event == EventNames.serverMessageUpdated) {
        yield WebsocketEvent(
          event: event.event,
          params: MessageListContainer.fromJson(event.params),
          confirmId: event.confirmId,
        );
      }
    }
  }
}
