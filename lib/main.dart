import 'package:f_elproyecto/domain/use_cases/diff_usecase.dart';
import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:f_elproyecto/pages/controllers/authcontroller.dart';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/login_page.dart';
import 'pages/home.dart';

import 'package:f_elproyecto/domain/use_cases/user_usecase.dart';
import 'package:f_elproyecto/pages/controllers/user_controller.dart';
import 'package:loggy/loggy.dart';

import 'domain/repo/repository.dart';
import 'domain/use_cases/auth_usecase.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(Repository());
  Get.put(AuthenticationUseCase());
  Get.put(UserUseCase());
  Get.put(AuthenticationController());
  Get.put(UserController());
  Get.put(NumberController());
  Get.put(CasoDificultad());
  Get.put(Dificultad());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    return GetMaterialApp(
        title: 'Math App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Obx(() => authenticationController.isLogged
            ? HomePage()
            : const LoginPage()));
  }
}
