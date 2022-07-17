import 'package:get/get.dart';

import 'package:app_coins/bindings/user_data_binding.dart';
import 'package:app_coins/ui/pages/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.HOME_PAGE,
        page: () => HomePage(),
        binding: UserDataBinding()),
  ];
}
