import 'package:meta/meta.dart';

import 'package:tdclient_dart/src/websocket/websocket_constants.dart';
import 'package:tdclient_dart/src/websocket/widget/widget_websocket_client.dart';

class CookieWidgetWebSocketClient extends WidgetWebSocketClient {
  CookieWidgetWebSocketClient._({
    @required Uri uri,
    @required Map<String, dynamic> headers,
  }) : super(
          uri: uri,
          headers: headers,
        );

  factory CookieWidgetWebSocketClient({
    @required String teamUid,
    @required String cookieString,
  }) {
    final headers = {'cookie': cookieString};
    final uri = WebSocketConstants.serverUri.replace(
      pathSegments: ['messaging', teamUid, 'widget'],
    );
    return CookieWidgetWebSocketClient._(headers: headers, uri: uri);
  }
}
