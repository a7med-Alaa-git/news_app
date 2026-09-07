import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_interceptor.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/error/error_model.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/unexpected_exception.dart';

class DioConsumer {
  final Dio dio;
  late Map<String, dynamic> response;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseurl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queries,
    bool isFormData = false,
  }) async {
    await dio
        .get(
          path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queries,
        )
        .then((value) {
          value.data = response;
        })
        .catchError((error) {
          if (error is DioException) {
            handleDioException(error);
          } else {
            throw UnexpectedException('Unexpected error occurred: $error');
          }
        });
  }
}
