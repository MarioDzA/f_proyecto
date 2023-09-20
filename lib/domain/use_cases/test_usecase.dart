import 'dart:math';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:get/get.dart';

class CasoDificultad {
  late NumberController controller = Get.find();

  generateCase() {
    controller.setOp1(Random().nextInt(100));
    controller.setOp2(Random().nextInt(100));
    controller.setOperator("+");
    return ;
  }
}
