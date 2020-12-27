import 'package:dio/dio.dart' hide Response;

import 'package:tdclient_dart/src/http/http_constants.dart';
import 'package:tdclient_dart/src/http/widget/widget_http_client.dart';
import 'package:tdclient_dart/src/utils/extensions.dart';

class TokenWidgetHttpClient extends WidgetHttpClient {
  TokenWidgetHttpClient._(Dio dio) : super(dio);

  factory TokenWidgetHttpClient({
    String tokenString,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: HttpConstants.widgetApiUri.toString(),
      ),
    );

    if (!tokenString.isEmptyOrNull) {
      dio.options.headers.addAll({
        'token': tokenString,
      });
    }

    return TokenWidgetHttpClient._(dio);
  }
}
