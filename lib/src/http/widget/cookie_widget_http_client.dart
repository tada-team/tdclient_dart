import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:tdclient_dart/src/http/http_constants.dart';
import 'package:tdclient_dart/src/http/widget/widget_http_client.dart';
import 'package:tdclient_dart/src/utils/utils.dart';

class CookieWidgetHttpClient extends WidgetHttpClient {
  static final _widgetApiUri = HttpConstants.widgetApiUri;
  final CookieJar _cookieJar;

  CookieWidgetHttpClient._(Dio dio, this._cookieJar) : super(dio);

  factory CookieWidgetHttpClient({
    String cookieString,
  }) {
    final widgetApiUri = _widgetApiUri;
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

    return CookieWidgetHttpClient._(dio, cookieJar);
  }

  String get currentCookieString {
    final cookie = _cookieJar.loadForRequest(_widgetApiUri);
    return SerializableCookie(cookie.first).toJson();
  }
}
