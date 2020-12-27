import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';

abstract class IWidgetWebSocketClient {
  void connect();

  Future close();

  Stream<WebsocketEvent<Map<String, dynamic>>> get rawStream;

  Stream<WebsocketEvent<MessageListContainer>> get messagesStream;
}
