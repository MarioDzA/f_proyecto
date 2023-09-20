import 'package:f_elproyecto/domain/use_cases/diff_usecase.dart';
import 'package:f_elproyecto/pages/controllers/authcontroller.dart';
import 'package:f_elproyecto/pages/controllers/user_controller.dart';
import 'package:f_elproyecto/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:loggy/loggy.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final UserController userController = Get.find();
  final AuthenticationController authenticationController = Get.find();

  // _logout() async {
  //   try {
  //     await authenticationController.logOut();
  //   } catch (e) {
  //     logInfo(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Dificultad handler = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math test"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'logout',
            onPressed: () {
              Get.to(const LoginPage(
                key: Key('LoginPage'),
              ));
              // _logout();
            },
          ),
        ],
      ),
      body: Center(
          child: ElevatedButton(
              key: const Key("TestStartButton"),
              onPressed: () {
                handler.lvlEasy();
              },
              child: const Text("Begin test"))),
    );
  }
}
