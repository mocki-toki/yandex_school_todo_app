// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_task_backend.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _NetworkTaskBackend implements NetworkTaskBackend {
  _NetworkTaskBackend(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://beta.mrdekk.ru/todobackend';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TaskListResponse> getTaskList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/list/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskListResponse> updateTaskList(revision, request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Last-Known-Revision': revision};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskListResponse>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/list/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskResponse> getTask(taskId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/list/${taskId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskResponse> createTask(revision, request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Last-Known-Revision': revision};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/list/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskResponse> editTask(revision, taskId, request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Last-Known-Revision': revision};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskResponse>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/list/${taskId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskResponse> deleteTask(revision, taskId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'X-Last-Known-Revision': revision};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskResponse>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/list/${taskId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
