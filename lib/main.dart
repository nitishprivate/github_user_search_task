import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/provider/app_binder.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "User Search",
      initialBinding: BinderData(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      transitionDuration: Duration.zero,
      defaultTransition: Transition.noTransition,
      unknownRoute: AppPages.routes[0],
      enableLog: true,
    ),
  );
}
