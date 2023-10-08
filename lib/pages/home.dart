import 'package:f_elproyecto/domain/repo/repository.dart';
import 'package:f_elproyecto/domain/use_cases/diff_usecase.dart';
import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:f_elproyecto/pages/TestPagefiles/testpage.dart';
import 'package:f_elproyecto/pages/controllers/authcontroller.dart';
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
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Dificultad handler = Get.find();
    CasoDificultad casehandler = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math test"),
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
          child: ElevatedButton(
              key: const Key("TestStartButton"),
              onPressed: () async {
                try {
                  //Gens base case
                  //solve this shit...
                  print(Repository().getscore());
                  // int score = ;
                  // if (score != 0) {
                  //   casehandler.changeScore(score);
                  // } else {
                  //   casehandler.changeScore(100);
                  // }
                  // handler.casegenerator();
                  // Get.to(const TestPage(
                  //   key: Key('TestPage'),
                  // ));
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Begin test"))),
    );
  }
}
