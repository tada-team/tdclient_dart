import 'package:dio/dio.dart' hide Response;
import 'package:meta/meta.dart';
import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';
import 'package:tdproto_dart/tdproto_dart.dart';

typedef ResultFromJson<T> = T Function(dynamic data);

class DioWrapper {
  final dio;

  const DioWrapper({
    @required this.dio,
  });

  Future<Response<T>> post<T>({
    @required Uri uri,
    @required ResultFromJson<T> resultFromJson,
    data,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final dioResponse = await dio.postUri(
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
    @required Uri uri,
    @required ResultFromJson<T> resultFromJson,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    final dioResponse = await dio.getUri(
      uri,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return Response.fromJson(dioResponse.data, resultFromJson);
  }
}
