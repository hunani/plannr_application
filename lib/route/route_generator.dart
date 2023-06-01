import 'package:get/get.dart';
import 'package:plannr_app/ui/screen/categories/categories_screen.dart';
import 'package:plannr_app/ui/screen/events/events_screen.dart';
import 'package:plannr_app/ui/screen/forget/forgot_verification.dart';
import 'package:plannr_app/ui/screen/home/home_screen.dart';
import 'package:plannr_app/ui/screen/profile/profile_screen.dart';
import '../ui/screen/categories/add_guest_screen.dart';
import '../ui/screen/categories/card_screen.dart';
import '../ui/screen/categories/contact_select_screen.dart';
import '../ui/screen/categories/create_contact_page.dart';
import '../ui/screen/categories/create_invitation_screen.dart';
import '../ui/screen/categories/select_filter.dart';
import '../ui/screen/categories/sync_contact_page.dart';
import '../ui/screen/categories/upload_screen.dart';
import '../ui/screen/dashboad/dashboad_screen.dart';
import '../ui/screen/events/edit_contact_screen.dart';
import '../ui/screen/events/events_overview.dart';
import '../ui/screen/events/gues_list.dart';
import '../ui/screen/events/gues_messages_screen.dart';
import '../ui/screen/events/menu_screen.dart';
import '../ui/screen/events/messages_screen.dart';
import '../ui/screen/events/preview_screen.dart';
import '../ui/screen/forget/change_password.dart';
import '../ui/screen/forget/forgot_screen.dart';
import '../ui/screen/forget/password_done.dart';
import '../ui/screen/login/login_screen.dart';
import '../ui/screen/login/login_verification.dart';
import '../ui/screen/login/properties_screen.dart';
import '../ui/screen/onBoarding_and_splash/onBoarding_screen.dart';
import '../ui/screen/onBoarding_and_splash/splash_screen.dart';
import '../ui/screen/profile/contact_screen.dart';
import '../ui/screen/profile/edit_profile.dart';
import '../ui/screen/profile/faq_screen.dart';
import '../ui/screen/sign_up/sign_up_done.dart';
import '../ui/screen/sign_up/sign_up_verification.dart';
import '../ui/screen/sign_up/signup_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: Splash.routeName, page: () => const Splash()),
  GetPage(name: OnBoardingScreen.routeName, page: () => const OnBoardingScreen()),
  GetPage(name: SignUpScreen.routeName, page: () => const SignUpScreen()),
  GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
  GetPage(name: SignUpDone.routeName, page: () => const SignUpDone()),
  GetPage(
      name: SignUpVerificationScreen.routeName,
      page: () => const SignUpVerificationScreen()),
  GetPage(
      name: LoginVerificationScreen.routeName,
      page: () => const LoginVerificationScreen()),
  GetPage(name: ForgotScreen.routeName, page: () => const ForgotScreen()),
  GetPage(name: ChangePassword.routeName, page: () => const ChangePassword()),
  GetPage(name: PasswordDone.routeName, page: () => const PasswordDone()),
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  GetPage(
      name: CategoriesScreen.routeName, page: () => const CategoriesScreen()),
  GetPage(name: EventsScreen.routeName, page: () => const EventsScreen()),
  GetPage(name: ProfileScreen.routeName, page: () => const ProfileScreen()),
  GetPage(name: DashboadScreen.routeName, page: () => const DashboadScreen()),
  GetPage(name: CardScreen.routeName, page: () => const CardScreen()),
  GetPage(
      name: EditProfileScreen.routeName, page: () => const EditProfileScreen()),
  GetPage(name: FaqScreen.routeName, page: () => const FaqScreen()),
  GetPage(name: ContactScreen.routeName, page: () => const ContactScreen()),
  GetPage(name: PreviewScreen.routeName, page: () => const PreviewScreen()),
  GetPage(name: SelectFilter.routeName, page: () => const SelectFilter()),
  GetPage(name: UploadScreen.routeName, page: () => const UploadScreen()),
  GetPage(name: GuesListScreen.routeName, page: () => const GuesListScreen()),
  GetPage(name: MessagesScreen.routeName, page: () => const MessagesScreen()),
  GetPage(name: AddGuestScreen.routeName, page: () => const AddGuestScreen()),
  GetPage(
      name: PropertiesScreen.routeName, page: () => const PropertiesScreen()),
  GetPage(
      name: CreateContactPage.routeName, page: () => const CreateContactPage()),
  GetPage(name: MenuScreen.routeName, page: () => const MenuScreen()),
  GetPage(name: SyncContactPage.routeName, page: () => const SyncContactPage()),
  GetPage(
      name: ContactSelectScreen.routeName,
      page: () => const ContactSelectScreen()),
  GetPage(
      name: GuesMessagesScreen.routeName,
      page: () => const GuesMessagesScreen()),
  GetPage(
      name: EditContactScreen.routeName, page: () => const EditContactScreen()),
  GetPage(
      name: CreateInvitationScreen.routeName,
      page: () => const CreateInvitationScreen()),
  GetPage(
      name: EventOverviewScreen.routeName,
      page: () => const EventOverviewScreen()),
  GetPage(
      name: ForgotVerificationScreen.routeName,
      page: () => const ForgotVerificationScreen()),
];
