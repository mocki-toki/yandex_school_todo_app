import 'dart:convert';

import 'package:core_infrastructure/core_infrastructure.dart';
import 'package:flutter/foundation.dart';

class DioProvider {
  final Dio dio = _create();

  static Dio _create() {
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
        string.length > 5000
            ? _convertFromJson
            : compute(_convertFromJson, string);
    dio.interceptors.add(DioAuthInterceptor());
    return dio;
  }

  static dynamic _convertFromJson(String string) => json.decode(string);
}
