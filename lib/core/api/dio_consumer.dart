import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/error/error_model.dart';
import 'package:news_app/core/error/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  late dynamic response;
  DioConsumer({required this.dio});

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queries,
  }) async {
    await dio
        .delete(path, data: data, queryParameters: queries)
        .then((value) {
          value.data = response;
        })
        .catchError((error) {
          if (error is DioException) {
            switch (error.type) {
              case DioExceptionType.connectionTimeout:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );
              case DioExceptionType.sendTimeout:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );
              case DioExceptionType.receiveTimeout:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );
              case DioExceptionType.badCertificate:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );

              case DioExceptionType.cancel:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );

              case DioExceptionType.connectionError:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );

              case DioExceptionType.unknown:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );

              case DioExceptionType.transformTimeout:
                throw ServerException(
                  errorModel: ErrorModel.fromjson(error.response!.data),
                );
              case DioExceptionType.badResponse:
                switch (error.response?.statusCode) {
                  case 400:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 401:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 403:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 404:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 408:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 409:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 422:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 429:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 500:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 502:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 503:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );

                  case 504:
                    throw ServerException(
                      errorModel: ErrorModel.fromjson(error.response!.data),
                    );
                }
            }
          } else {
            throw ServerException(
              errorModel: ErrorModel.fromjson({'message': error.toString()}),
            );
          }
        });
  }
}
