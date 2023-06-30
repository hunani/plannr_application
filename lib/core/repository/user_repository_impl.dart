import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/login/mode/login_model.dart';
import '../../ui/screen/categories/model/cart_model.dart';
import '../../ui/screen/categories/model/color_model.dart';
import '../../ui/screen/categories/model/create_Invitation_product_model.dart';
import '../../ui/screen/categories/model/create_list_model.dart';
import '../../ui/screen/categories/model/create_model.dart';
import '../../ui/screen/categories/model/create_submit_data_model.dart';
import '../../ui/screen/categories/model/fitter_model.dart';
import '../../ui/screen/events/model/edit_Invitation_model.dart';
import '../../ui/screen/events/model/edit_contact_model.dart';
import '../../ui/screen/events/model/invitation_model.dart';
import '../../ui/screen/events/model/upcoming_model.dart';
import '../../ui/screen/events/model/view_invitation_model.dart';
import '../../ui/screen/home/model/banner_model.dart';
import '../../ui/screen/home/model/birtday_party_model.dart';
import '../../ui/screen/home/model/bridal_shower_model.dart';
import '../../ui/screen/home/model/categories_model.dart';
import '../../ui/screen/home/model/trending_model.dart';
import '../../ui/screen/profile/model/profile_model.dart';
import '../../ui/screen/sign_up/model/signup_model.dart';
import '../network/api_client.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final repo = GetIt.I.get<ApiClient>();

  @override
  Future<LoginModel> login(String email, String password) async {
    return await repo.login(email, password);
  }

  @override
  Future<void> register(String firstName, String lastName, String phone,
      String email, String password, String rePassword) async {
    return await repo.register(
        firstName, lastName, phone, email, password, rePassword);
  }

  @override
  Future<void> otpVerification(String email, String otp) async {
    return await repo.otpVerification(email, otp);
  }

  @override
  Future<void> resend(String email) async {
    return await repo.resend(email);
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await repo.forgotPassword(email);
  }

  @override
  Future<void> resetPassword(
      String email, String password, String rPassword) async {
    return await repo.resetPassword(email, password, rPassword);
  }

  @override
  Future<List<CategoriesList>> categories() async {
    return await repo.categories();
  }

  @override
  Future<List<BannerList>> banner() async {
    return await repo.banner();
  }

  @override
  Future<CartList> cartData(int id) async {
    return await repo.cartData(id);
  }

  @override
  Future<List<ColorList>> colorData() async {
    return await repo.colorData();
  }

  @override
  Future<FitterModel> fitter(String premium, String colorId) async {
    return await repo.fitter(premium, colorId);
  }

  @override
  Future<List<BirtdayPartyList>> birtdayParty() async {
    return await repo.birtdayParty();
  }

  @override
  Future<List<BirdalShowerList>> bridalShower() async {
    return await repo.bridalShower();
  }

  @override
  Future<CreateList> create(int id) async {
    return await repo.create(id);
  }

  @override
  Future<CreateInvitationProductList> createInvitationProduct(
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
    return await repo.createInvitationProduct(
        userId,
        id,
        name,
        date,
        time,
        timeZone,
        hostedBy,
        location,
        phone,
        message,
        typeEvents,
        dressCode,
        food,
        addInfo,
        addAdmin,
        addChatRoom,
        inviteMore,
        draft);
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
    String inviteMore,
  ) async {
    return await repo.createInvitationProduct2(
        image,
        name,
        date,
        time,
        timeZone,
        hostedBy,
        location,
        phone,
        message,
        typeEvents,
        dressCode,
        food,
        addInfo,
        addAdmin,
        addChatRoom,
        inviteMore);
  }

  @override
  Future<CreateInvitationSubmitData> createInvitationSubmitData(int id) async {
    return repo.createInvitationSubmitData(id);
  }

  @override
  Future<List<TrendingBannerList>> trendingBanner() async {
    return repo.trendingBanner();
  }

  @override
  Future<void> createContact(
      int userId, String name, String email, String number) async {
    return repo.createContact(userId, name, email, number);
  }

  @override
  Future<List<CreateListData>> createList(int userId) async {
    return await repo.createList(userId);
  }

  @override
  Future<List<UpcomingList>> upcomingDataList(int userId) async {
    return await repo.upcomingDataList(userId);
  }

  @override
  Future<List<UpcomingList>> pastDataList(int userId) async {
    return await repo.pastDataList(userId);
  }

  @override
  Future<List<EventOverviewList>> editOverview(int id) async {
    return await repo.editOverview(id);
  }

  @override
  Future<ViewInvitatioData> viewInvitation(int id, int userId) async {
    return await repo.viewInvitation(id, userId);
  }

  @override
  Future<EditInvitationData> editInvitation(int id, int userId) async {
    return await repo.editInvitation(id, userId);
  }

  @override
  Future<FitterModel> fitterClear(String id) async {
    return await repo.fitterClear(id);
  }

  @override
  Future<void> contactListSubmit(
      int userId, int invitationId, List<int> list) async {
    return await repo.contactListSubmit(userId, invitationId, list);
  }

  @override
  Future<ProfileDataModel> profileShow(int userId) async {
    return await repo.profileShow(userId);
  }

  @override
  Future<void> profileEdit(
      int userId, String email, String number, String image) async {
    return await repo.profileEdit(userId, email, number, image);
  }

  @override
  Future<void> deleteUser(int userId) async {
    return await repo.deleteUser(userId);
  }
}
