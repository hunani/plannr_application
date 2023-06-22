import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/core/network/dio/dio_extension.dart';
import 'package:plannr_app/ui/screen/categories/model/cart_model.dart';
import 'package:plannr_app/ui/screen/categories/model/color_model.dart';
import 'package:plannr_app/ui/screen/categories/model/create_list_model.dart';
import 'package:plannr_app/ui/screen/categories/model/create_model.dart';
import 'package:plannr_app/ui/screen/categories/model/create_submit_data_model.dart';
import 'package:plannr_app/ui/screen/events/model/edit_contact_model.dart';
import 'package:plannr_app/ui/screen/events/model/upcoming_model.dart';
import 'package:plannr_app/ui/screen/events/model/view_invitation_model.dart';
import 'package:plannr_app/ui/screen/home/model/banner_model.dart';
import 'package:plannr_app/ui/screen/home/model/categories_model.dart';
import 'package:plannr_app/ui/screen/home/model/trending_model.dart';
import 'package:plannr_app/ui/screen/login/mode/login_model.dart';
import '../../../ui/screen/categories/model/fitter_model.dart';
import '../../../ui/screen/home/model/birtday_party_model.dart';
import '../../../ui/screen/home/model/bridal_shower_model.dart';
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
  Future<void> resend(String email) async {
    await _dioClient.postApi(UrlPath.resendOtpApi, map: {"email": email});
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _dioClient.postApi(UrlPath.forgetApi, map: {"email": email});
  }

  @override
  Future<void> resetPassword(
      String email, String password, String rPassword) async {
    await _dioClient.postApi(UrlPath.resetPasswordApi,
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
  Future<CartList> cartData(int id) async {
    final response = await _dioClient
        .post(UrlPath.createInvitationApi, data: {"catgeory_id": id});
    return CartList.fromJson(response.data);
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
  Future<FitterModel> fitter(String premium, String colorId) async {
    final response = await _dioClient.post(UrlPath.fitterApi,
        data: {"free_or_premium": premium, "color_id": colorId});
    return FitterModel.fromJson(response.data);
  }

  @override
  Future<List<BirtdayPartyList>> birtdayParty() async {
    final response = await _dioClient.getApi(UrlPath.birtdayApi);
    return List<BirtdayPartyList>.from(
      response.data.map(
        (e) => BirtdayPartyList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<BirdalShowerList>> bridalShower() async {
    final response = await _dioClient.getApi(UrlPath.bridalShowerApi);
    return List<BirdalShowerList>.from(
      response.data.map(
        (e) => BirdalShowerList.fromJson(e),
      ),
    );
  }

  @override
  Future<CreateList> create(int id) async {
    final response =
        await _dioClient.postApi(UrlPath.createApi, map: {"product_id": id});
    return CreateList.fromJson(response.data);
  }

  @override
  Future<void> createInvitationProduct(
      int id,
      String name,
      String date,
      String time,
      String timeZone,
      String hostedBy,
      String location,
      String phone,
      String message,
      String typeEvents,
      String dressCode,
      String food,
      String addInfo,
      String addAdmin,
      String addChatRoom,
      String inviteMore,
      String draft) async {
    await _dioClient.postApi(UrlPath.createSubmitApi, map: {
      "product_id": id,
      "name": name,
      "date": date,
      "time": time,
      "time_zone": timeZone,
      "hosted_by": hostedBy,
      "location": location,
      "phone": phone,
      "message": message,
      "type_events": typeEvents,
      "dress_code": dressCode,
      "food": food,
      "add_info": addInfo,
      "add_admin": addAdmin,
      "add_chat_room": addChatRoom,
      "invite_more": inviteMore,
      "draft": draft
    });
  }

  @override
  Future<void> createInvitationProduct2(
      String image,
      String name,
      String date,
      String time,
      String timeZone,
      String hostedBy,
      String location,
      String phone,
      String message,
      String typeEvents,
      String dressCode,
      String food,
      String addInfo,
      String addAdmin,
      String addChatRoom,
      String inviteMore) async {
    await _dioClient.postApi(UrlPath.createSubmitApi, map: {
      "image": image,
      "name": name,
      "date": date,
      "time": time,
      "time_zone": timeZone,
      "hosted_by": hostedBy,
      "location": location,
      "phone": phone,
      "message": message,
      "type_events": typeEvents,
      "dress_code": dressCode,
      "food": food,
      "add_info": addInfo,
      "add_admin": addAdmin,
      "add_chat_room": addChatRoom,
      "invite_more": inviteMore
    });
  }

  @override
  Future<CreateInvitationSubmitData> createInvitationSubmitData(int id) async {
    final response = await _dioClient
        .postApi(UrlPath.createInvitationSubmitDataApi, map: {"user_id": id});
    return CreateInvitationSubmitData.fromJson(response.data);
  }

  @override
  Future<List<TrendingBannerList>> trendingBanner() async {
    final response = await _dioClient.getApi(UrlPath.trendingApi);
    return List<TrendingBannerList>.from(
      response.data.map(
        (e) => TrendingBannerList.fromJson(e),
      ),
    );
  }

  @override
  Future<void> createContact(
      int userId, String name, String email, String number) async {
    await _dioClient.postApi(UrlPath.createContactApi, map: {
      "user_id": userId,
      "name": name,
      "email": email,
      "number": number
    });
  }

  @override
  Future<List<CreateListData>> createList(int userId) async {
    final response = await _dioClient
        .postApi(UrlPath.createListApi, map: {"user_id": userId});
    return List<CreateListData>.from(
      response.data.map(
        (e) => CreateListData.fromJson(e),
      ),
    );
  }

  @override
  Future<List<UpcomingList>> upcomingDataList(int userId) async {
    final response = await _dioClient
        .postApi(UrlPath.eventUpcomingApi, map: {"user_id": userId});
    return List<UpcomingList>.from(
      response.data.map(
        (e) => UpcomingList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<UpcomingList>> pastDataList(int userId) async {
    final response = await _dioClient
        .postApi(UrlPath.eventPastApi, map: {"user_id": userId});
    return List<UpcomingList>.from(
      response.data.map(
        (e) => UpcomingList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<EventOverviewList>> editOverview(int id) async {
    final response = await _dioClient
        .postApi(UrlPath.eventOverviewApi, map: {"event_id": id});
    return List<EventOverviewList>.from(
      response.data.map(
        (e) => EventOverviewList.fromJson(e),
      ),
    );
  }

  @override
  Future<ViewInvitatioData> viewInvitation(int id, int userId) async {
    final response = await _dioClient.postApi(UrlPath.viewInvitationApi,
        map: {"event_id": id, "user_id": userId});
    return ViewInvitatioData.fromJson(response.data);
  }
}
