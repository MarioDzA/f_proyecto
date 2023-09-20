import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:f_elproyecto/pages/TestPagefiles/testpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dificultad {
  final CasoDificultad caso = Get.find();

  lvlEasy() {
    caso.generateCase();
    caso.controller.stopwatch.start();
    Get.to(const TestPage(
      key: Key('TestPage'),
    ));
  }
}
