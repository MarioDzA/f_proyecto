import 'package:f_elproyecto/domain/use_cases/diff_usecase.dart';
import 'package:f_elproyecto/domain/use_cases/hub_usecase.dart';
import 'package:f_elproyecto/pages/controllers/authcontroller.dart';
import 'package:f_elproyecto/pages/controllers/hubcontroller.dart';
import 'package:f_elproyecto/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  final AuthenticationController authenticationController = Get.find();

  _logout() async {
    try {
      await authenticationController.logOut();
      print('saliendo');
      Get.to(const LoginPage(
        key: Key('LoginPage'),
      ));
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Dificultad handler = Get.find();
    Hubdata userinfo = Get.find();
    Hubusecase hubcontroller = Get.find();
    hubcontroller.setuser();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Math test, Welcome back'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              tooltip: 'logout',
              onPressed: () {
                _logout();
              },
            ),
          ],
        ),
        body: Center(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(userinfo.username.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20))),
              Obx(() => Text("last score: ${userinfo.userscore}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20))),
              Padding(
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                    key: const Key("TestStartButton"),
                    onPressed: () async {
                      try {
                        //Gens base case
                        handler.casegenerator();
                        Get.offNamed("/Test");
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text("Begin test")),
              ),
            ],
          ),
        )));
  }
}
