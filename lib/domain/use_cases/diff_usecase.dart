import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:get/get.dart';

class Dificultad {
  final CasoDificultad caso = Get.find();

  casegenerator() {
    caso.generateCase();
    caso.stopwatch.start();
  }
}
