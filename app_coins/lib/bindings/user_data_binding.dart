import 'package:get/get.dart';

import 'package:app_coins/controllers/user_data_controller.dart';

class UserDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDataController>(
      () => UserDataController(),
    );
  }
}
