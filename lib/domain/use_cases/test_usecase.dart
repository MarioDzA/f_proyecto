import 'dart:math';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:get/get.dart';

class CasoDificultad {
  late NumberController controller = Get.find();
  int _score = 0;
  int get score => _score;
  changeScore(int newscore) => _score = newscore;

  generateCase() {
    if(score <= 500){
    controller.setOp1(Random().nextInt(100));
    controller.setOp2(Random().nextInt(100));
    controller.setOperator("+");
    }else if(score <= 1000){
    controller.setOp1(Random().nextInt(100));
    controller.setOp2(Random().nextInt(1000));
    controller.setOperator("+");
    }else{
    controller.setOp1(Random().nextInt(1000));
    controller.setOp2(Random().nextInt(1000));
    controller.setOperator("*");
    }
  }
}
