import 'package:plannr_app/ui/screen/login/mode/login_model.dart';

import '../../ui/screen/categories/model/cart_model.dart';
import '../../ui/screen/categories/model/color_model.dart';
import '../../ui/screen/categories/model/create_list_model.dart';
import '../../ui/screen/categories/model/create_model.dart';
import '../../ui/screen/categories/model/create_submit_data_model.dart';
import '../../ui/screen/categories/model/fitter_model.dart';
import '../../ui/screen/events/model/upcoming_model.dart';
import '../../ui/screen/home/model/banner_model.dart';
import '../../ui/screen/home/model/birtday_party_model.dart';
import '../../ui/screen/home/model/bridal_shower_model.dart';
import '../../ui/screen/home/model/categories_model.dart';
import '../../ui/screen/home/model/trending_model.dart';
import '../../ui/screen/sign_up/model/signup_model.dart';

abstract class UserRepository {
  Future<LoginModel> login(String email, String password);

  Future<void> register(String firstName, String lastName, String phone,
      String email, String password, String rePassword);

  Future<void> otpVerification(String email, String otp);

  Future<void> resend(String email);

  Future<void> forgotPassword(String email);

  Future<void> resetPassword(String email, String password, String rPassword);

  Future<List<CategoriesList>> categories();

  Future<List<BannerList>> banner();

  Future<CartList> cartData(int id);

  Future<List<ColorList>> colorData();

  Future<FitterModel> fitter(String premium, String colorId);

  Future<List<BirtdayPartyList>> birtdayParty();

  Future<List<BirdalShowerList>> bridalShower();

  Future<CreateList> create(int id);

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
  );

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
  );

  Future<CreateInvitationSubmitData> createInvitationSubmitData(int id);

  Future<List<TrendingBannerList>> trendingBanner();

  Future<void> createContact(
      int userId, String name, String email, String number);

  Future<List<CreateListData>> createList(int userId);

  Future<List<UpcomingList>> upcomingDataList(int userId);

  Future<List<UpcomingList>> pastDataList(int userId);
}
