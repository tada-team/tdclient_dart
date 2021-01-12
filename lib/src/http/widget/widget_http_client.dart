import 'package:dio/dio.dart' hide Response;
import 'package:meta/meta.dart';
import 'package:tdclient_dart/src/core/core_dtos/core_dtos.dart';
import 'package:tdclient_dart/src/http/dio_wrapper.dart';
import 'package:tdclient_dart/src/http/http_dtos/http_dtos.dart';
import 'package:tdclient_dart/src/http/widget/i_widget_http_client.dart';

class WidgetHttpClient implements IWidgetHttpClient {
  @override
  final Dio dio;

  final DioWrapper _dioWrapper;

  WidgetHttpClient(this.dio) : _dioWrapper = DioWrapper(dio: dio);

  @override
  Future<Response<void>> login() {
    return _dioWrapper.get(
      uri: Uri(
        path: 'login',
      ),
      resultFromJson: (json) => null,
    );
  }

  @override
  Future<Response<void>> logout() {
    return _dioWrapper.get(
      uri: Uri(
        path: 'logout',
      ),
      resultFromJson: (json) => null,
    );
  }

  @override
  Future<Response<MessageListContainer>> getMessages({
    @required String teamUid,
  }) {
    return _dioWrapper.get(
      uri: Uri(
        pathSegments: [teamUid, 'messages'],
      ),
      resultFromJson: (json) => MessageListContainer.fromJson(json),
    );
  }

  @override
  Future<Response<Message>> sendMessage({
    @required teamUid,
    @required OutgoingMessage message,
  }) {
    return _dioWrapper.post(
      uri: Uri(
        pathSegments: [teamUid, 'messages'],
      ),
      data: message.toJson(),
      resultFromJson: (json) => Message.fromJson(json),
    );
  }

  @override
  Future<Response<UserInfo>> getUserInfo() {
    return _dioWrapper.get(
      uri: Uri(
        path: 'userinfo',
      ),
      resultFromJson: (json) => UserInfo.fromJson(json),
    );
  }
}
