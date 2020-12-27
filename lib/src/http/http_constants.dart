import 'package:tdclient_dart/src/core/core_constants.dart';

abstract class HttpConstants {
  static final serverUri = Uri(scheme: 'https', host: CoreConstants.serverDomain);
  static final widgetApiUri = serverUri.replace(path: '/api/v4/widget/');
}
