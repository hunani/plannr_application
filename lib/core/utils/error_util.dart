import 'package:flutter/foundation.dart';
import '../ui_failure/ui_result.dart';
import 'base_response.dart';

class ErrorUtil {
  static UiFailure<T> getUiFailureFromException<T>(
      Object error, StackTrace stackTrace) {
    debugPrintStack(stackTrace: stackTrace);

    if (error is ApiError) {
      return UiFailure(error.type, error.message ?? "Something went wrong");
    }
    return const UiFailure(ErrorType.unknown, "Something went wrong");
  }
}
