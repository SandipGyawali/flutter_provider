class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

// data fetching error
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error during communication");
}

// bad request exception
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

// authorization error
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, "UnauthorizedException request");
}
