import 'package:tdclient_dart/src/websocket/widget/widget_websocket_client.dart';

class CookieWidgetWebSocketClient extends WidgetWebSocketClient {
  CookieWidgetWebSocketClient._({
    required Uri uri,
    required Map<String, dynamic> headers,
  }) : super(
          uri: uri,
          headers: headers,
        );

  factory CookieWidgetWebSocketClient({
    required String serverDomain,
    required String teamUid,
    required String cookieString,
  }) {
    return CookieWidgetWebSocketClient._(
      headers: {
        'cookie': cookieString,
      },
      uri: Uri(
        scheme: 'wss',
        host: serverDomain,
        pathSegments: ['messaging', teamUid, 'widget'],
      ),
    );
  }
}
