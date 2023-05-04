enum ErrorType { timeout, noConnection, apiFailure, localError, unknown }

class ErrorCodesFromApi {
  // static const String INVALID_CREDENTIALS = "invalid-credentials";
}

String getMessageFromErrorType(ErrorType type) {
  switch (type) {
    case ErrorType.timeout:
      return "Timeout error occurred, please try again";
    case ErrorType.noConnection:
      return "Could not connect to the server, please check your network";
    case ErrorType.apiFailure:
      return "Some error occurred, please try again";
    case ErrorType.localError:
      return "Some error occurred, please try again";
    default:
      return "Unknown error occurred, please try again";
  }
}

class ApiError {
  final ErrorType type;
  final String? message;

  ApiError(this.type, [String? message])
      : message = message ?? getMessageFromErrorType(type);
}

class ApiResponse<T> {
  final T data;

  ApiResponse(this.data);
}
