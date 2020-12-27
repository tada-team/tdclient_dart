import 'package:meta/meta.dart';

import 'package:tdclient_dart/src/utils/extensions.dart';
import 'package:tdclient_dart/src/websocket/websocket_constants.dart';
import 'package:tdclient_dart/src/websocket/widget/widget_websocket_client.dart';

class TokenWidgetWebSocketClient extends WidgetWebSocketClient {
  TokenWidgetWebSocketClient._({
    @required Uri uri,
    @required Map<String, dynamic> headers,
  }) : super(
          uri: uri,
          headers: headers,
        );

  factory TokenWidgetWebSocketClient({
    @required String teamUid,
    String tokenString,
  }) {
    final headers = tokenString.isEmptyOrNull ? null : {'token': tokenString};
    final uri = WebSocketConstants.serverUri.replace(
      pathSegments: ['messaging', teamUid, 'widget'],
    );
    return TokenWidgetWebSocketClient._(headers: headers, uri: uri);
  }
}
