
import 'package:f_elproyecto/pages/controllers/authcontroller.dart';
import 'package:f_elproyecto/pages/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final UserController userController = Get.find();
  final AuthenticationController authenticationController = Get.find();

  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math test"),
      ),
      body: Center(
          child: ElevatedButton(
              key: const Key("TestStartButton"),
              onPressed: () {
                _logout();
              },
              child: const Text("Begin test"))),
    );
  }
}
