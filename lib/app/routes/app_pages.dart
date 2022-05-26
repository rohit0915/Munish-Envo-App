import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:envo_safe/app/modules/account/bindings/account_binding.dart';
import 'package:envo_safe/app/modules/account/views/account_view.dart';
import 'package:envo_safe/app/modules/add_vehicle/bindings/add_vehicle_binding.dart';
import 'package:envo_safe/app/modules/add_vehicle/views/add_vehicle_view.dart';
import 'package:envo_safe/app/modules/bottom_navbar/bindings/bottom_navbar_binding.dart';
import 'package:envo_safe/app/modules/bottom_navbar/views/bottom_navbar_view.dart';
import 'package:envo_safe/app/modules/cancel_request/bindings/cancel_request_binding.dart';
import 'package:envo_safe/app/modules/cancel_request/views/cancel_request_view.dart';
import 'package:envo_safe/app/modules/carpool/bindings/carpool_binding.dart';
import 'package:envo_safe/app/modules/carpool/views/carpool_view.dart';
import 'package:envo_safe/app/modules/chat/bindings/chat_binding.dart';
import 'package:envo_safe/app/modules/chat/views/chat_view.dart';
import 'package:envo_safe/app/modules/chating/bindings/chating_binding.dart';
import 'package:envo_safe/app/modules/chating/views/chating_view.dart';
import 'package:envo_safe/app/modules/drawer/bindings/drawer_binding.dart';
import 'package:envo_safe/app/modules/drawer/views/drawer_view.dart';
import 'package:envo_safe/app/modules/help_support/bindings/help_support_binding.dart';
import 'package:envo_safe/app/modules/help_support/views/help_support_view.dart';
import 'package:envo_safe/app/modules/history/bindings/history_binding.dart';
import 'package:envo_safe/app/modules/history/views/history_view.dart';
import 'package:envo_safe/app/modules/location_picker/bindings/location_picker_binding.dart';
import 'package:envo_safe/app/modules/location_picker/views/location_picker_view.dart';
import 'package:envo_safe/app/modules/login/bindings/login_binding.dart';
import 'package:envo_safe/app/modules/login/views/login_view.dart';
import 'package:envo_safe/app/modules/manage_profile/bindings/manage_profile_binding.dart';
import 'package:envo_safe/app/modules/manage_profile/views/manage_profile_view.dart';
import 'package:envo_safe/app/modules/matching_rider/bindings/matching_rider_binding.dart';
import 'package:envo_safe/app/modules/matching_rider/views/matching_rider_view.dart';
import 'package:envo_safe/app/modules/my_vehicle/bindings/my_vehicle_binding.dart';
import 'package:envo_safe/app/modules/my_vehicle/views/my_vehicle_view.dart';
import 'package:envo_safe/app/modules/notification/bindings/notification_binding.dart';
import 'package:envo_safe/app/modules/notification/views/notification_view.dart';
import 'package:envo_safe/app/modules/payment/bindings/payment_binding.dart';
import 'package:envo_safe/app/modules/payment/views/payment_view.dart';
import 'package:envo_safe/app/modules/profile_verification/bindings/profile_verification_binding.dart';
import 'package:envo_safe/app/modules/profile_verification/views/profile_verification_view.dart';
import 'package:envo_safe/app/modules/refer_earn/bindings/refer_earn_binding.dart';
import 'package:envo_safe/app/modules/refer_earn/views/refer_earn_view.dart';
import 'package:envo_safe/app/modules/requests/bindings/requests_binding.dart';
import 'package:envo_safe/app/modules/requests/views/requests_view.dart';
import 'package:envo_safe/app/modules/requests_on_ride/bindings/requests_on_ride_binding.dart';
import 'package:envo_safe/app/modules/requests_on_ride/views/requests_on_ride_view.dart';
import 'package:envo_safe/app/modules/riders_pledge/bindings/riders_pledge_binding.dart';
import 'package:envo_safe/app/modules/riders_pledge/views/riders_pledge_view.dart';
import 'package:envo_safe/app/modules/set_office_home_location/bindings/set_office_home_location_binding.dart';
import 'package:envo_safe/app/modules/set_office_home_location/views/set_office_home_location_view.dart';
import 'package:envo_safe/app/modules/signup/bindings/signup_binding.dart';
import 'package:envo_safe/app/modules/signup/views/signup_view.dart';
import 'package:envo_safe/app/modules/splash/bindings/splash_binding.dart';
import 'package:envo_safe/app/modules/splash/views/splash_view.dart';
import 'package:envo_safe/app/modules/verify/bindings/verify_binding.dart';
import 'package:envo_safe/app/modules/verify/views/verify_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY,
      page: () => VerifyView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: _Paths.SET_OFFICE_HOME_LOCATION,
      page: () => SetOfficeHomeLocationView(),
      binding: SetOfficeHomeLocationBinding(),
    ),
    GetPage(
      name: _Paths.RIDERS_PLEDGE,
      page: () => RidersPledgeView(),
      binding: RidersPledgeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVBAR,
      page: () => BottomNavbarView(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.CARPOOL,
      page: () => CarpoolView(),
      binding: CarpoolBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER,
      page: () => DrawerView(),
      binding: DrawerBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.CANCEL_REQUEST,
      page: () => CancelRequestView(),
      binding: CancelRequestBinding(),
    ),
    GetPage(
      name: _Paths.MATCHING_RIDER,
      page: () => MatchingRiderView(),
      binding: MatchingRiderBinding(),
    ),
    GetPage(
      name: _Paths.REFER_EARN,
      page: () => ReferEarnView(),
      binding: ReferEarnBinding(),
    ),
    GetPage(
      name: _Paths.HELP_SUPPORT,
      page: () => HelpSupportView(),
      binding: HelpSupportBinding(),
    ),
    GetPage(
      name: _Paths.MY_VEHICLE,
      page: () => MyVehicleView(),
      binding: MyVehicleBinding(),
    ),
    GetPage(
      name: _Paths.ADD_VEHICLE,
      page: () => AddVehicleView(),
      binding: AddVehicleBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_PICKER,
      page: () => LocationPickerView(),
      binding: LocationPickerBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_PROFILE,
      page: () => ManageProfileView(),
      binding: ManageProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_VERIFICATION,
      page: () => ProfileVerificationView(),
      binding: ProfileVerificationBinding(),
    ),
    GetPage(
      name: _Paths.REQUESTS,
      page: () => RequestsView(),
      binding: RequestsBinding(),
    ),
    GetPage(
      name: _Paths.REQUESTS_ON_RIDE,
      page: () => RequestsOnRideView(),
      binding: RequestsOnRideBinding(),
    ),
    GetPage(
      name: _Paths.CHATING,
      page: () => ChatingView(),
      binding: ChatingBinding(),
    ),
  ];
}
