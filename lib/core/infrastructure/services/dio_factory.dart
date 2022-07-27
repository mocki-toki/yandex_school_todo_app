import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:todo_app/core/infrastructure/infrastructure.dart';

class DioFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(baseUrl: CoreInfrastructureConstants.apiUrl),
    );

    (dio.transformer as DefaultTransformer).jsonDecodeCallback = (string) =>
        string.length > 5000 ? _convertToJson : compute(_convertToJson, string);
    dio.interceptors.add(AuthInterceptor());
    return dio;
  }

  static dynamic _convertToJson(String string) => json.decode(string);
}
