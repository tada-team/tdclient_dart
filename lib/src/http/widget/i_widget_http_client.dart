import 'package:dio/dio.dart' hide Response;
import 'package:meta/meta.dart';

import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';
import 'package:tdclient_dart/src/http/http_dtos/http_dtos.dart';

abstract class IWidgetHttpClient {
  /// Opened interface for direct access to dio.
  /// For example it can be used to add interceptors.
  Dio get dio;

  Future<Response<void>> login();

  Future<Response<void>> logout();

  Future<Response<MessageListContainer>> getMessages({
    @required String teamUid,
  });

  Future<Response<Message>> sendMessage({
    @required String teamUid,
    @required OutgoingMessage message,
  });

  Future<Response<UserInfo>> getUserInfo();
}
