import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/constants.dart';

class RemoteApiClient {
  final Dio _dio;

  RemoteApiClient()
      : _dio = Dio(
          baseOptions,
        );

  static BaseOptions baseOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 3),
    receiveTimeout: const Duration(seconds: 3),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    _dio.options.baseUrl = baseUrl;
    return _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
