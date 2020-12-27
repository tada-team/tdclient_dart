import 'package:tdclient_dart/src/core/core_constants.dart';

abstract class WebSocketConstants {
  static final serverUri = Uri(scheme: 'wss', host: CoreConstants.serverDomain);
}
