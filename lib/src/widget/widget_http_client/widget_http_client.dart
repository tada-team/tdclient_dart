import 'package:dio/dio.dart' hide Response;
import 'package:meta/meta.dart';

import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';
import 'package:tdclient_dart/src/widget/widget_http_client/http_dtos/http_dtos.dart';

// ignore: avoid_annotating_with_dynamic
typedef ResultFromJson<T> = T Function(dynamic data);

class WidgetHttpClient {
  final Dio _dio;

  WidgetHttpClient(this._dio);

  Future<Response<T>> _post<T>({
    @required Uri uri,
    @required ResultFromJson<T> resultFromJson,
    data,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
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

  Future<Response<T>> _get<T>({
    @required Uri uri,
    @required ResultFromJson<T> resultFromJson,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    final dioResponse = await _dio.getUri(
      uri,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return Response.fromJson(dioResponse.data, resultFromJson);
  }

  Future<Response<UserInfo>> login() {
    return _get(
      uri: Uri(
        path: 'login',
      ),
      resultFromJson: (json) => UserInfo.fromJson(json),
    );
  }

  Future<Response<void>> logout() {
    return _get(
      uri: Uri(
        path: 'logout',
      ),
      resultFromJson: (json) => null,
    );
  }

  Future<Response<MessageListContainer>> getMessages({
    @required String teamUid,
  }) {
    return _get(
      uri: Uri(
        pathSegments: [teamUid, 'messages'],
      ),
      resultFromJson: (json) => MessageListContainer.fromJson(json),
    );
  }

  Future<Response<Message>> sendMessage({
    @required teamUid,
    @required OutgoingMessage message,
  }) {
    return _post(
      uri: Uri(
        pathSegments: [teamUid, 'messages'],
      ),
      data: message.toJson(),
      resultFromJson: (json) => Message.fromJson(json),
    );
  }

  Future<Response<UserInfo>> getUserInfo() {
    return _get(
      uri: Uri(
        path: 'userinfo',
      ),
      resultFromJson: (json) => UserInfo.fromJson(json),
    );
  }
}
