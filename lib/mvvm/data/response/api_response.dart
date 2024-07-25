import 'package:flutter_provider/mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.error() : status = Status.ERROR;

  ApiResponse.success() : status = Status.SUCCESS;

  @override
  String toString() {
    return "Status : $status Message: $message \n Data: $data";
  }
}
