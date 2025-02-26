import 'package:hcricket/data/response/enum.dart';

class ApiResponse<T> {
  final ApiStatus status;
  final T? data;
  final String? message;

  const ApiResponse._({required this.status, this.data, this.message});

  const ApiResponse.loading() : this._(status: ApiStatus.loading);

  const ApiResponse.completed(T data)
      : this._(status: ApiStatus.completed, data: data);

  // const ApiResponse.error(String message)
  //     : this._(status: ApiStatus.error, message: message);

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}