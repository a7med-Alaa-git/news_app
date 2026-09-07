import 'package:news_app/core/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromjson(dynamic json) {
    return ErrorModel(
      status: json[ApiKeys.status],
      errorMessage: json[ApiKeys.errorMessage],
    );
  }
}
