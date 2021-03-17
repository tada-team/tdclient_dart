import 'package:dio/dio.dart';

import 'package:tdclient_dart/src/utils/api_keys.dart';

class TokenManager extends Interceptor {
  String token;

  @override
  Future<dynamic> onResponse(Response response) async {
    final headersMap = response.headers.map;
    if (headersMap.containsKey(HeaderKeys.token)) {
      token = headersMap[HeaderKeys.token].first;
      return response;
    }
    return super.onResponse(response);
  }

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    if (token != null) {
      return _copyOptionsWithToken(options, token);
    }
    return super.onRequest(options);
  }

  RequestOptions _copyOptionsWithToken(RequestOptions options, String token) {
    return RequestOptions(
      headers: {
        ...options.headers,
        HeaderKeys.token: token,
      },
      method: options.method,
      sendTimeout: options.sendTimeout,
      receiveTimeout: options.receiveTimeout,
      connectTimeout: options.connectTimeout,
      data: options.data,
      path: options.path,
      queryParameters: options.queryParameters,
      baseUrl: options.baseUrl,
      onReceiveProgress: options.onReceiveProgress,
      onSendProgress: options.onSendProgress,
      cancelToken: options.cancelToken,
      extra: options.extra,
      responseType: options.responseType,
      contentType: options.contentType,
      validateStatus: options.validateStatus,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
      followRedirects: options.followRedirects,
      maxRedirects: options.maxRedirects,
      requestEncoder: options.requestEncoder,
      responseDecoder: options.responseDecoder,
    );
  }
}
