import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../utils/base_response.dart';

extension DioEx on Dio {
  /// Top level methods
  ///
  /// common GET method
  Future<ApiResponse> getApi(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await get(
        path,
        queryParameters: queryParameters,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  ///common MULTIPART POST method
  Future<ApiResponse> postMultipartApi(String path,
      {FormData? formData,
      void Function(int, int)? onSendProgress,
      Options? options}) async {
    try {
      Response response = await post(
        path,
        options: options,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  ///common MULTIPART POST method
  Future<ApiResponse> putMultipartApi(String path, {FormData? formData}) async {
    try {
      Response response = await put(
        path,
        data: formData,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  /// Common POST method
  Future<ApiResponse> postApi(String path, {dynamic map}) async {
    try {
      Response response = await post(path, data: map);
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  ApiResponse _getResponse(Response response) {
    if (response.data["status"]) {
      return ApiResponse(response.data["data"]);
    } else {
      throw ApiError(ErrorType.apiFailure,
          response.data["message"] ?? "Something went wrong");
    }
  }

  ApiError _getError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ApiError(ErrorType.timeout);
      case DioErrorType.badResponse: //401, 404, 403
        return ApiError(ErrorType.apiFailure);
      case DioErrorType.unknown:
        if (e.error is HttpException || e.error is SocketException) {
          return ApiError(ErrorType.noConnection);
        }
        return ApiError(ErrorType.unknown);
      default:
        return ApiError(ErrorType.unknown);
    }
  }
}

extension FileEx on File {
  MultipartFile getMultipartFromFile(String mediaType, String extension) {
    return MultipartFile.fromFileSync(
      path,
      filename: '${DateTime.now().millisecondsSinceEpoch}.$extension',
      contentType: MediaType(mediaType, extension),
    );
  }
}
