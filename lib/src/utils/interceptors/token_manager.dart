import 'package:dio/dio.dart';

import 'package:tdclient_dart/src/utils/api_keys.dart';

class TokenManager extends Interceptor {
  String? token;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (token != null) {
      final newOptions = options.copyWith(
        headers: {
          ...options.headers,
          HeaderKeys.token: token,
        },
      );
      handler.next(newOptions);
    }
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final headersMap = response.headers.map;
    if (headersMap.containsKey(HeaderKeys.token)) {
      token = headersMap[HeaderKeys.token]!.first;
      handler.next(response);
    }
  }
}
