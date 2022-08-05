import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:todo_app/core/infrastructure/infrastructure.dart';

class DioFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: CoreInfrastructureConstants.apiUrl,
        validateStatus: (status) => status == 200,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    (dio.transformer as DefaultTransformer).jsonDecodeCallback = (string) =>
        string.length > 5000 ? _convertToJson : compute(_convertToJson, string);
    dio.interceptors.add(DioAuthInterceptor());
    return dio;
  }

  static dynamic _convertToJson(String string) => json.decode(string);
}
