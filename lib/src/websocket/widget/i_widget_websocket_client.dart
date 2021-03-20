import 'package:tdclient_dart/tdclient_dart.dart';

abstract class IWidgetWebSocketClient {
  void connect();

  Future close();

  Stream<WebSocketEvent<Map<String, dynamic>>> get rawStream;

  Stream<WebSocketEvent<MessageListContainer>> get messagesStream;
}
