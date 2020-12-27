import 'package:tdclient_dart/src/core/core_constants.dart';

abstract class WebsocketConstants {
  static final serverUri = Uri(scheme: 'wss', host: CoreConstants.serverDomain);
  static final widgetApiUri = serverUri.replace(
    pathSegments: ['messaging', CoreConstants.teamUid, 'widget'],
  );
}
