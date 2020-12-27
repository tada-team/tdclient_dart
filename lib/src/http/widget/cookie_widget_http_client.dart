import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'package:tdclient_dart/src/utils/extensions.dart';
import 'package:tdclient_dart/src/http/http_constants.dart';
import 'package:tdclient_dart/src/http/widget/widget_http_client.dart';

class CookieWidgetHttpClient extends WidgetHttpClient {
  const CookieWidgetHttpClient._(Dio dio) : super(dio);

  factory CookieWidgetHttpClient({
    String cookieString,
  }) {
    final widgetApiUri = HttpConstants.widgetApiUri;
    final cookieJar = CookieJar();

    if (!cookieString.isEmptyOrNull) {
      cookieJar.saveFromResponse(
        widgetApiUri,
        [Cookie.fromSetCookieValue(cookieString)],
      );
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: widgetApiUri.toString(),
      ),
    )..interceptors.add(
        CookieManager(cookieJar),
      );

    return CookieWidgetHttpClient._(dio);
  }
}
