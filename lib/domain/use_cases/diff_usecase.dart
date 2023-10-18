import 'package:f_elproyecto/domain/repo/repository.dart';
import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:get/get.dart';

class Dificultad {
  final CasoDificultad caso = Get.find();
  NumberController controller = Get.find();

  casegenerator() async {
    caso.changeScore(await Repository().getscore());
    controller.setinfotext("");
    caso.generateCase();
    caso.stopwatch.start();
  }
}
