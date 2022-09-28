import 'package:core_infrastructure/core_infrastructure.dart';

class DioAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final newHeaders = Map<String, dynamic>.from(options.headers);

    newHeaders['Authorization'] =
        'Bearer ${CoreInfrastructureConstants.apiToken}';

    final newOptions = options.copyWith(headers: newHeaders);
    super.onRequest(newOptions, handler);
  }
}
