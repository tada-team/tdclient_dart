import 'package:dio/dio.dart' hide Response;

import 'package:tdclient_dart/src/utils/interceptors/token_manager.dart';
import 'package:tdclient_dart/src/utils/api_keys.dart';
import 'package:tdclient_dart/tdclient_dart.dart';
import 'package:tdclient_dart/src/utils/extensions/extensions.dart';

class TokenWidgetHttpClient extends WidgetHttpClient {
  final TokenManager _tokenManager;

  TokenWidgetHttpClient._(
    Dio dio,
    this._tokenManager,
  ) : super(dio);

  factory TokenWidgetHttpClient({
    required String serverDomain,
    String? tokenString,
  }) {
    final tokenManager = TokenManager();

    final dio_ = Dio(
      BaseOptions(
        baseUrl: Uri(
          scheme: 'https',
          host: serverDomain,
          pathSegments: ['api', 'v4', 'widget'],
        ).toDioBaseUrl(),
      ),
    );
    dio_.interceptors.add(tokenManager);

    if (tokenString != null) {
      dio_.options.headers.addAll({
        HeaderKeys.token: tokenString,
      });
    }

    return TokenWidgetHttpClient._(dio_, tokenManager);
  }

  String? get currentToken => _tokenManager.token;

  @override
  Future<Response<void>> login() {
    return dioWrapper.get(
      uri: Uri(
        path: 'token-login',
      ),
      resultFromJson: (json) => null,
    );
  }
}
