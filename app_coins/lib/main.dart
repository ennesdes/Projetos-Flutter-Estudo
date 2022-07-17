import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_coins/ui/theme/app_theme.dart';
import 'package:app_coins/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      getPages: AppPages.routes,
    );
  }
}
