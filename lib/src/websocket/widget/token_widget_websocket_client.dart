import 'package:tdclient_dart/src/websocket/websocket_constants.dart';
import 'package:tdclient_dart/src/websocket/widget/widget_websocket_client.dart';

class TokenWidgetWebSocketClient extends WidgetWebSocketClient {
  TokenWidgetWebSocketClient({
    String tokenString,
  }) : super(
          url: WebSocketConstants.widgetApiUri.toString(),
          headers: {
            'token': tokenString,
          },
        );
}
