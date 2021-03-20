import 'package:dio/dio.dart' hide Response;
import 'package:tdproto_dart/tdproto_dart.dart';

import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';

typedef ResultFromJson<T> = T Function(dynamic data);

class DioWrapper {
  final _dio;

  const DioWrapper(this._dio);

  Future<Response<T>> post<T>({
    required Uri uri,
    required ResultFromJson<T> resultFromJson,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dioResponse = await _dio.postUri(
      uri,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return Response.fromJson(dioResponse.data, resultFromJson);
  }

  Future<Response<T>> get<T>({
    required Uri uri,
    required ResultFromJson<T> resultFromJson,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dioResponse = await _dio.getUri(
      uri,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return Response.fromJson(dioResponse.data, resultFromJson);
  }
}
