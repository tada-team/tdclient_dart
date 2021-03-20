import 'package:tdclient_dart/src/websocket/widget/widget_websocket_client.dart';

class TokenWidgetWebSocketClient extends WidgetWebSocketClient {
  TokenWidgetWebSocketClient._({
    required Uri uri,
    required Map<String, dynamic> headers,
  }) : super(
          uri: uri,
          headers: headers,
        );

  factory TokenWidgetWebSocketClient({
    required String serverDomain,
    required String teamUid,
    required String tokenString,
  }) {
    return TokenWidgetWebSocketClient._(
      headers: {
        'token': tokenString,
      },
      uri: Uri(
        scheme: 'wss',
        host: serverDomain,
        pathSegments: ['messaging', teamUid, 'widget'],
      ),
    );
  }
}
