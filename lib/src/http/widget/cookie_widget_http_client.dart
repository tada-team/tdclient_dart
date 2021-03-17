import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tdclient_dart/src/http/widget/widget_http_client.dart';
import 'package:tdclient_dart/src/utils/utils.dart';

class CookieWidgetHttpClient extends WidgetHttpClient {
  final Uri widgetApiUri;
  final CookieJar cookieJar;

  CookieWidgetHttpClient._({
    @required Dio dio,
    @required this.widgetApiUri,
    @required this.cookieJar,
  }) : super(dio);

  factory CookieWidgetHttpClient({
    @required String serverDomain,
    String cookieString,
  }) {
    final widgetApiUri = Uri(
      scheme: 'https',
      host: serverDomain,
      pathSegments: ['api', 'v4', 'widget'],
    );
    final cookieJar = CookieJar();

    if (!cookieString.isEmptyOrNull) {
      cookieJar.saveFromResponse(
        widgetApiUri,
        [Cookie.fromSetCookieValue(cookieString)],
      );
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: widgetApiUri.toDioBaseUrl(),
      ),
    )..interceptors.add(
        CookieManager(cookieJar),
      );

    return CookieWidgetHttpClient._(
      dio: dio,
      cookieJar: cookieJar,
      widgetApiUri: widgetApiUri,
    );
  }

  String get currentCookieString {
    final cookie = cookieJar.loadForRequest(widgetApiUri);
    return SerializableCookie(cookie.first).toJson();
  }
}
