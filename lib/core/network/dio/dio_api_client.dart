import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/core/network/dio/dio_extension.dart';
import 'package:plannr_app/ui/screen/categories/model/cart_model.dart';
import 'package:plannr_app/ui/screen/categories/model/color_model.dart';
import 'package:plannr_app/ui/screen/home/model/banner_model.dart';
import 'package:plannr_app/ui/screen/home/model/categories_model.dart';
import 'package:plannr_app/ui/screen/login/mode/login_model.dart';
import '../../../ui/screen/categories/model/fitter_model.dart';
import '../../../widget/app_prefs.dart';
import '../../../widget/global.dart';
import '../../utils/base_url.dart';
import '../api_client.dart';

class DioApiClient extends ApiClient {
  static late DioApiClient _service;

  static Dio? _dio;

  static Dio get _dioClient => _dio!;

  DioApiClient._();

  static Future<DioApiClient> getInstance() async {
    if (_dio == null) {
      _dio = _init();
      _service = DioApiClient._();
    }
    return _service;
  }

  static Dio _init() {
    final dio = Dio();
    dio.options.baseUrl = BaseUrl.baseUrl;

    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String? authToken;
          try {
            authToken = GetIt.I.get<AppPrefs>().getUser?.token;
            //log("Auth Token=================> $authToken");
          } catch (e) {
            authToken = null;
          }
          if (authToken != null) {
            options.headers.putIfAbsent("Authorization", () => "$authToken");
            log("user Id========> ${appController.loginModel!.token}");
          }
          if (kDebugMode) {
            if (options.data is FormData) {
              FormData d = options.data;
              d.fields.forEach(((field) =>
                  debugPrint('Fields: ${field.key}: ${field.value}')));
              d.files.forEach(((field) => debugPrint(
                  'Files: ${field.key}: ${field.value.filename} (${field.value.contentType?.mimeType})')));
            }
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: kDebugMode,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
    ));
    return dio;
  }

  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await _dioClient
        .postApi(UrlPath.login, map: {"email": email, "password": password});
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<void> register(String firstName, String lastName, String phone,
      String email, String password, String rePassword) async {
    final param = {
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phone,
      "email": email,
      "password": password,
      "c_password": rePassword
    };
    final response = await _dioClient.postApi(UrlPath.registerApi, map: param);
  }

  @override
  Future<void> otpVerification(String email, String otp) async {
    await _dioClient.postApi(UrlPath.otpApi, map: {"email": email, "otp": otp});
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _dioClient.postApi(UrlPath.forgetApi, map: {"email": email});
  }

  @override
  Future<void> resetPassword(
      String email, String password, String rPassword) async {
    await _dioClient.postApi(UrlPath.resetApi,
        map: {"email": email, "password": password, "c_password": rPassword});
  }

  @override
  Future<List<CategoriesList>> categories() async {
    final response = await _dioClient.getApi(UrlPath.categoryApi);
    return List<CategoriesList>.from(
      response.data.map(
        (e) => CategoriesList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<BannerList>> banner() async {
    final response = await _dioClient.getApi(UrlPath.bannerApi);
    return List<BannerList>.from(
      response.data.map(
        (e) => BannerList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<CartList>> cartData() async {
    final response = await _dioClient.getApi(UrlPath.productApi);
    return List<CartList>.from(
      response.data.map(
        (e) => CartList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<ColorList>> colorData() async {
    final response = await _dioClient.getApi(UrlPath.colorApi);
    return List<ColorList>.from(
      response.data.map(
        (e) => ColorList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<FitterDataList>> fitter(String premium, String colorId) async {
    final response = await _dioClient.postApi(UrlPath.fitterApi,
        map: {"free_or_premium": premium, "color_id": colorId});
    return List<FitterDataList>.from(
      response.data.map(
        (e) => FitterDataList.fromJson(e),
      ),
    );
  }
}
