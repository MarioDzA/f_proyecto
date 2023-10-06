import 'package:f_elproyecto/data/local/localstorage.dart';
import 'package:f_elproyecto/domain/use_cases/diff_usecase.dart';
import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
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
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = LocalPreferences();
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
                //Gens base case
                var score = await sharedPreferences.retrieveData('score');
                if (score != null){
                casehandler.changeScore(score);
                }else{
                casehandler.changeScore(100);
                }
                handler.casegenerator();
              },
              child: const Text("Begin test"))),
    );
  }
}
