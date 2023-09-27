import 'dart:math';
import 'package:f_elproyecto/pages/home.dart';
import 'package:flutter/widgets.dart';
import 'package:f_elproyecto/data/remote/userdata.dart';
import 'package:f_elproyecto/domain/model/user_model.dart';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:get/get.dart';

class CasoDificultad {
  late NumberController controller = Get.find();
  final stopwatch = Stopwatch();
  int _score = 0;
  int get score => _score;
  changeScore(int newscore) => _score = newscore;
  generateCase() {
    if (score <= 10) {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(10));
      controller.setOperator("/");
    } else if (score <= 30) {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(100));
      controller.setOperator("*");
    } else if (score <= 60) {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(1000));
      controller.setOperator("-");
    } else if (score <= 100) {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(1000));
      controller.setOperator("+");
    }
    print((controller.op1 + controller.op2).round());
  }

  checkOperation() {
    int newScore = 0;
    switch (controller.operator) {
      case "+":
        if (controller.op1 + controller.op2 == int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();
            newScore = (stopwatch.elapsed.inSeconds);
            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4, email: 'elemail', password: '2315435', score: score));
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "*":
        if (controller.op1 * controller.op2 == int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();
            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4, email: 'elemail', password: '2315435', score: score));
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "-":
        if (controller.op1 - controller.op2 == int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();

            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4, email: 'elemail', password: '2315435', score: score));
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "/":
        if ((controller.op1 / controller.op2).round() == int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();

            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4, email: 'elemail', password: '2315435', score: score));
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      default:
        null;
    }
  }
}
