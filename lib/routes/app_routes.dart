import 'package:api_example_app/SensorScreen/home/choose_house.dart';
import 'package:api_example_app/SensorScreen/home/list_user.dart';
import 'package:api_example_app/SensorScreen/home/profile_page.dart';
import 'package:api_example_app/SensorScreen/home/user_other_profile.dart';
import 'package:api_example_app/routes/routes_cons.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  /// routes
  static final routes = [
    GetPage(
      name: RoutesCons.chooseHouse,
      page: () => ChooseHouse(),
    ),
    GetPage(
      name: RoutesCons.profilePage,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: RoutesCons.otherUserController,
      page: () => UserProfileOther(),
    ),
    GetPage(
      name: RoutesCons.listUser,
      page: () => ListUser(),
    ),
  ];
}
