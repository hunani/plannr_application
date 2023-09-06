import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/core/network/dio/dio_extension.dart';
import 'package:plannr_app/ui/screen/categories/model/cart_model.dart';
import 'package:plannr_app/ui/screen/categories/model/color_model.dart';
import 'package:plannr_app/ui/screen/categories/model/contact_model.dart';
import 'package:plannr_app/ui/screen/categories/model/create_list_model.dart';
import 'package:plannr_app/ui/screen/categories/model/create_model.dart';
import 'package:plannr_app/ui/screen/categories/model/create_submit_data_model.dart';
import 'package:plannr_app/ui/screen/categories/model/invitation_send_list_model.dart';
import 'package:plannr_app/ui/screen/events/model/edit_Invitation_model.dart';
import 'package:plannr_app/ui/screen/events/model/edit_contact_model.dart';
import 'package:plannr_app/ui/screen/events/model/guest_list_yes_no_model.dart';
import 'package:plannr_app/ui/screen/events/model/guest_ny_rsvp_model.dart';
import 'package:plannr_app/ui/screen/events/model/see_all_participants_model.dart';
import 'package:plannr_app/ui/screen/events/model/upcoming_model.dart';
import 'package:plannr_app/ui/screen/events/model/view_invitation_model.dart';
import 'package:plannr_app/ui/screen/home/model/banner_model.dart';
import 'package:plannr_app/ui/screen/home/model/categories_model.dart';
import 'package:plannr_app/ui/screen/home/model/trending_model.dart';
import 'package:plannr_app/ui/screen/login/mode/login_model.dart';
import 'package:plannr_app/ui/screen/login/mode/upgrade_now_model.dart';
import 'package:plannr_app/ui/screen/profile/model/faq_model.dart';
import 'package:plannr_app/ui/screen/profile/model/profile_model.dart';
import 'package:plannr_app/ui/screen/profile/model/terms_of_service_model.dart';
import '../../../ui/screen/categories/model/additional_features_screen.dart';
import '../../../ui/screen/categories/model/create_Invitation_product_model.dart';
import '../../../ui/screen/categories/model/fitter_model.dart';
import '../../../ui/screen/events/model/add_guests_model.dart';
import '../../../ui/screen/events/model/past_model.dart';
import '../../../ui/screen/events/model/rsvp_count_model.dart';
import '../../../ui/screen/home/model/birtday_party_model.dart';
import '../../../ui/screen/home/model/bridal_shower_model.dart';
import '../../../ui/screen/profile/model/contact_us_model.dart';
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
    await _dioClient.postApi(UrlPath.registerApi, map: param);
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
      int userId,
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
    final response = await _dioClient.postApi(UrlPath.createSubmitApi, map: {
      "user_id": userId,
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
  Future<List<CreateDataList>> createList(int userId) async {
    final param = {
      "user_id": userId,
    };
    final response =
        await _dioClient.postApi(UrlPath.createListApi, map: param);
    return List<CreateDataList>.from(
      response.data.map(
        (e) => CreateDataList.fromJson(e),
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
  Future<List<PastList>> pastDataList(int userId) async {
    final response = await _dioClient
        .postApi(UrlPath.eventPastApi, map: {"user_id": userId});
    return List<PastList>.from(
      response.data.map(
        (e) => PastList.fromJson(e),
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

  @override
  Future<EditInvitationData> editInvitation(int id, int userId) async {
    final response = await _dioClient.postApi(UrlPath.editInvitationApi,
        map: {"event_id": id, "user_id": userId});
    return EditInvitationData.fromJson(response.data);
  }

  @override
  Future<FitterModel> fitterClear(String id) async {
    final response = await _dioClient
        .post(UrlPath.fitterClearApi, data: {"category_id": id});
    return FitterModel.fromJson(response.data);
  }

  @override
  Future<void> contactListSubmit(
      int userId, int invitationId, List<int> list) async {
    await _dioClient.postApi(UrlPath.contactListSubmitApi, map: {
      "user_id": userId,
      "invitation_id": invitationId,
      "contact_id": List<dynamic>.from(list.map((x) => x.toString())),
    });
  }

  @override
  Future<ProfileDataModel> profileShow(int userId) async {
    final response = await _dioClient
        .postApi(UrlPath.userProfileApi, map: {"user_id": userId});
    return ProfileDataModel.fromJson(response.data);
  }

  @override
  Future<void> profileEdit(int userId, String firstName, String lastName,
      String email, String number, String image) async {
    final param = {
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": number,
      "photo": File(image).getMultipartFromFile("image", "png"),
    };
    await _dioClient.postMultipartApi(UrlPath.editProfileApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<void> deleteUser(int userId) async {
    await _dioClient.postApi(UrlPath.deleteUserApi, map: {
      "user_id": userId,
    });
  }

  @override
  Future<List<FaqList>> faqData() async {
    final response = await _dioClient.getApi(UrlPath.faqApi);
    return List<FaqList>.from(
      response.data.map(
        (e) => FaqList.fromJson(e),
      ),
    );
  }

  @override
  Future<void> contactSubmit(
      int userId, List<ContactsListNameAndNumber> list) async {
    ContactsModel contactsModel = ContactsModel(userId: userId, lists: list);
    await _dioClient.postMultipartApi(UrlPath.contactSyncApi,
        formData: FormData.fromMap(contactsModel.toJson()));
    print("===========>${contactsModel.toJson()}");
  }

  @override
  Future<List<SubscriptionList>> subscriptionData() async {
    final response = await _dioClient.getApi(UrlPath.subscriptionApi);
    return List<SubscriptionList>.from(
      response.data.map(
        (e) => SubscriptionList.fromJson(e),
      ),
    );
  }

  @override
  Future<void> cancelEvent(int userId, int eventId, String cancel) async {
    await _dioClient.postApi(UrlPath.cancelEventApi, map: {
      "user_id": userId,
      "event_id": eventId,
      "draft": cancel,
    });
  }

  @override
  Future<List<TermsOfServiceData>> termsOfService() async {
    final response = await _dioClient.getApi(UrlPath.tremOfServesApi);
    return List<TermsOfServiceData>.from(
      response.data.map(
        (e) => TermsOfServiceData.fromJson(e),
      ),
    );
  }

  @override
  Future<List<TermsOfServiceData>> privacyPolicy() async {
    final response = await _dioClient.getApi(UrlPath.privacyPolicyApi);
    return List<TermsOfServiceData>.from(
      response.data.map(
        (e) => TermsOfServiceData.fromJson(e),
      ),
    );
  }

  @override
  Future<List<ContactUsData>> contactUs() async {
    final response = await _dioClient.getApi(UrlPath.privacyPolicyApi);
    return List<ContactUsData>.from(
      response.data.map(
        (e) => ContactUsData.fromJson(e),
      ),
    );
  }

  @override
  Future<List<GuestByRsvpList>> guestByRsvp(int invitationId) async {
    final response = await _dioClient
        .postApi(UrlPath.guestByRSVPApi, map: {"invitation_id": invitationId});
    return List<GuestByRsvpList>.from(
      response.data.map(
        (e) => GuestByRsvpList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<InvitationSendList>> invitationSend(
      int userId, int invitationId) async {
    final response = await _dioClient.postApi(UrlPath.invitationSendListUSerApi,
        map: {"user_id": userId, "invitation_id": invitationId});
    return List<InvitationSendList>.from(
      response.data.map(
        (e) => InvitationSendList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<RsvpCountList>> rsvpCount(int invitationId) async {
    final response = await _dioClient
        .postApi(UrlPath.rsvpCountApi, map: {"invitation_id": invitationId});
    return List<RsvpCountList>.from(
      response.data.map(
        (e) => RsvpCountList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<SeeAllParticipantsList>> seeAllParticipants(
      int invitationId, String guest) async {
    final response = await _dioClient.postApi(UrlPath.seeAllParticipantsApi,
        map: {"invitation_id": invitationId, "guest": guest});
    return List<SeeAllParticipantsList>.from(
      response.data.map(
        (e) => SeeAllParticipantsList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<AdditionalFeaturesData>> additionalFeatures() async {
    final response = await _dioClient.getApi(UrlPath.additionalsApi);
    return List<AdditionalFeaturesData>.from(
      response.data.map(
        (e) => AdditionalFeaturesData.fromJson(e),
      ),
    );
  }

  @override
  Future<void> draftDelete(int eventId, int userId) async {
    await _dioClient.postApi(UrlPath.draftDelete,
        map: {"event_id": eventId, "user_id": userId});
  }

  @override
  Future<void> draftContinue(int eventId) async {
    await _dioClient.postApi(UrlPath.continueDraft, map: {"event_id": eventId});
  }

  Future<List<AddGustsList>> addMoreGuests(int eventId, int userId) async {
    final response = await _dioClient.post(UrlPath.addGustsApi,
        data: {"invitation_id": eventId, "user_id": userId});
    return List<AddGustsList>.from(
      response.data.map(
        (e) => AddGustsList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<GuestListYesNoList>> guestListYesNo(
      int eventId, int userId) async {
    final response = await _dioClient.post(UrlPath.guestListYeNoApi,
        data: {"invitation_id": eventId, "user_id": userId});
    return List<GuestListYesNoList>.from(
      response.data.map(
        (e) => GuestListYesNoList.fromJson(e),
      ),
    );
  }
}
