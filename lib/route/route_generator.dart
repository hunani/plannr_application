import 'package:get/get.dart';
import 'package:plannr_app/ui/screen/categories/screen/categories_screen.dart';
import 'package:plannr_app/ui/screen/events/events_page.dart';
import 'package:plannr_app/ui/screen/forget/forgot_verification.dart';
import 'package:plannr_app/ui/screen/home/home_screen.dart';
import 'package:plannr_app/ui/screen/profile/profile_screen.dart';
import '../ui/screen/categories/add_guest_screen.dart';
import '../ui/screen/categories/screen/view_categories_screen.dart';
import '../ui/screen/categories/contact_select_screen.dart';
import '../ui/screen/categories/create_contact_page.dart';
import '../ui/screen/categories/screen/create_invitation_screen.dart';
import '../ui/screen/categories/create_submit_details_screen.dart';
import '../ui/screen/categories/select_filter.dart';
import '../ui/screen/categories/sync_contact_page.dart';
import '../ui/screen/categories/screen/upload_screen.dart';
import '../ui/screen/dashboad/dashboad_screen.dart';
import '../ui/screen/events/add_more_guests_screen.dart';
import '../ui/screen/events/all_guests_screen.dart';
import '../ui/screen/events/create_invitation_screen.dart';
import '../ui/screen/events/edit_contact_screen.dart';
import '../ui/screen/events/event_cancel_screen.dart';
import '../ui/screen/events/events_overview.dart';
import '../ui/screen/events/gues_list.dart';
import '../ui/screen/events/gues_messages_screen.dart';
import '../ui/screen/events/menu_screen.dart';
import '../ui/screen/events/messages_screen.dart';
import '../ui/screen/events/preview_screen.dart';
import '../ui/screen/events/see_all_participants_screen.dart';
import '../ui/screen/events/send_chat_screen.dart';
import '../ui/screen/forget/change_password.dart';
import '../ui/screen/forget/forgot_screen.dart';
import '../ui/screen/forget/password_done.dart';
import '../ui/screen/categories/screen/additional_features_screen.dart';
import '../ui/screen/categories/screen/show_select_contacts.dart';
import '../ui/screen/home/birtdayParty_view_screen.dart';
import '../ui/screen/home/bridalShower_view_screen.dart';
import '../ui/screen/home/categories_view_screen.dart';
import '../ui/screen/categories/screen/confirm_payment_sendInvite.dart';
import '../ui/screen/categories/screen/contacts_select_screen.dart';
import '../ui/screen/categories/screen/preview_payment_screen.dart';
import '../ui/screen/categories/screen/pay_screen.dart';
import '../ui/screen/events/preview_details_screen.dart';
import '../ui/screen/categories/screen/preview_screen.dart';
import '../ui/screen/home/trending_now_view_screen.dart';
import '../ui/screen/categories/screen/invitation_sent_screen.dart';
import '../ui/screen/login/login_screen.dart';
import '../ui/screen/login/login_verification.dart';
import '../ui/screen/login/properties_screen.dart';
import '../ui/screen/onBoarding_and_splash/onBoarding_screen.dart';
import '../ui/screen/onBoarding_and_splash/splash_screen.dart';
import '../ui/screen/profile/contact_screen.dart';
import '../ui/screen/profile/contact_us_screen.dart';
import '../ui/screen/profile/edit_profile.dart';
import '../ui/screen/profile/faq_screen.dart';
import '../ui/screen/profile/privacy_policy_screen.dart';
import '../ui/screen/profile/trems_of_service_screen.dart';
import '../ui/screen/sign_up/sign_up_done.dart';
import '../ui/screen/sign_up/sign_up_verification.dart';
import '../ui/screen/sign_up/signup_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: Splash.routeName, page: () => const Splash()),
  GetPage(
      name: OnBoardingScreen.routeName, page: () => const OnBoardingScreen()),
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
  GetPage(
      name: ViewCategoriesScreen.routeName,
      page: () => const ViewCategoriesScreen()),
  GetPage(
      name: EditProfileScreen.routeName, page: () => const EditProfileScreen()),
  GetPage(name: FaqScreen.routeName, page: () => const FaqScreen()),
  GetPage(name: ContactUsScreen.routeName, page: () => const ContactUsScreen()),
  GetPage(name: PreviewScreen.routeName, page: () => const PreviewScreen()),
  GetPage(name: SelectFilter.routeName, page: () => const SelectFilter()),
  GetPage(name: UploadScreen.routeName, page: () => const UploadScreen()),
  GetPage(name: GuesListScreen.routeName, page: () => const GuesListScreen()),
  GetPage(name: MessagesScreen.routeName, page: () => const MessagesScreen()),
  // GetPage(name: AddGuestScreen.routeName, page: () => const AddGuestScreen()),
  GetPage(
      name: PropertiesScreen.routeName, page: () => const PropertiesScreen()),
  GetPage(
      name: CreateContactPage.routeName, page: () => const CreateContactPage()),
  GetPage(name: MenuScreen.routeName, page: () => const MenuScreen()),
  GetPage(name: SyncContactPage.routeName, page: () => const SyncContactPage()),
  // GetPage(
  //     name: CreateSubmitDetailsScreen.routeName,
  //     page: () => const CreateSubmitDetailsScreen()),
  GetPage(
      name: BridalViewScreen.routeName, page: () => const BridalViewScreen()),
  GetPage(
      name: BirtDayPartyViewScreen.routeName,
      page: () => const BirtDayPartyViewScreen()),
  GetPage(
      name: CategoriesViewScreen.routeName,
      page: () => const CategoriesViewScreen()),
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
  GetPage(
      name: TrendingNowViewScreen.routeName,
      page: () => const TrendingNowViewScreen()),
  GetPage(
      name: EventsCreateScreen.routeName,
      page: () => const EventsCreateScreen()),
  GetPage(
      name: TermsOfServiceScreen.routeName,
      page: () => const TermsOfServiceScreen()),
  GetPage(
      name: PrivacyPolicyScreen.routeName,
      page: () => const PrivacyPolicyScreen()),
  GetPage(name: ContactsScreen.routeName, page: () => const ContactsScreen()),
  GetPage(
      name: AdditionalFeaturesScreen.routeName,
      page: () => const AdditionalFeaturesScreen()),
  GetPage(
      name: ContactsSelectScreen.routeName,
      page: () => const ContactsSelectScreen()),
  GetPage(
      name: ShowSelectContactsScreen.routeName,
      page: () => const ShowSelectContactsScreen()),
  GetPage(
      name: PreviewDataScreen.routeName, page: () => const PreviewDataScreen()),
  GetPage(
      name: PreviewPaymentScreen.routeName,
      page: () => const PreviewPaymentScreen()),
  GetPage(name: PaymentScreen.routeName, page: () => const PaymentScreen()),
  GetPage(name: SendChatScreen.routeName, page: () => const SendChatScreen()),
  GetPage(
      name: PreviewViewScreen.routeName, page: () => const PreviewViewScreen()),
  GetPage(
      name: ConfirmPaymentSendInvitePage.routeName,
      page: () => const ConfirmPaymentSendInvitePage()),
  GetPage(name: AllGuestsScreen.routeName, page: () => const AllGuestsScreen()),
  GetPage(
      name: EventCancelScreen.routeName, page: () => const EventCancelScreen()),
  GetPage(
      name: AddMoreGuestsScreen.routeName,
      page: () => const AddMoreGuestsScreen()),
  GetPage(
      name: YourInvitationSentScreen.routeName,
      page: () => const YourInvitationSentScreen()),
  GetPage(
      name: SeeAllParticipantsScreen.routeName,
      page: () => const SeeAllParticipantsScreen()),
];
