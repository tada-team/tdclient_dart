import 'package:tdclient_dart/src/websocket/websocket_constants.dart';
import 'package:tdclient_dart/src/websocket/widget/widget_websocket_client.dart';

class CookieWidgetWebSocketClient extends WidgetWebSocketClient {
  CookieWidgetWebSocketClient({
    String cookieString,
  }) : super(
          url: WebSocketConstants.widgetApiUri.toString(),
          headers: {
            'cookie': cookieString,
          },
        );
}
