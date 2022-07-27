import 'package:todo_app/core/infrastructure/infrastructure.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final newHeaders = Map<String, dynamic>.from(options.headers);

    newHeaders['Authorization'] =
        'Bearer ${CoreInfrastructureConstants.apiToken}';

    final newOptions = options.copyWith(headers: newHeaders);
    super.onRequest(newOptions, handler);
  }
}
