import 'dart:math';
import 'package:f_elproyecto/data/local/localstorage.dart';
import 'package:f_elproyecto/domain/repo/repository.dart';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:get/get.dart';

class CasoDificultad {
  final sharedPreferences = LocalPreferences();
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
      controller.setOp1(Random().nextInt(1000));
      controller.setOp2(Random().nextInt(100));
      controller.setOperator("-");
    } else {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(1000));
      controller.setOperator("+");
    }
    print((controller.op1 + controller.op2).round());
    print((controller.op1 - controller.op2).round());
    print((controller.op1 * controller.op2).round());
  }

  updateuserafter(score) async {
    Repository().updateUser(score);
  }

  checkOperation(op1, op2, result, operator, cont) {
    int newScore = 0;
      switch (operator) {
        case "+":
          if (op1 + op2 == int.parse(result)) {
            if (cont < 5) {
              generateCase();
              controller.resetinfotext();
            } else {
              controller
                  .setinfotext("You're Done!, press send again to continue.");
              stopwatch.stop();
              newScore = (stopwatch.elapsed.inSeconds);
              changeScore(newScore);
              updateuserafter(score);
              stopwatch.reset();
            }
            controller.resetResult();
          } else {
            controller.setinfotext("Incorrect Answerd, try again.");
            controller.resetResult();
          }
        case "-":
          if (op1 - op2 == int.parse(result)) {
            if (cont < 5) {
              generateCase();
              controller.resetinfotext();
            } else {
              controller
                  .setinfotext("You're Done!, press send again to continue.");
              stopwatch.stop();
              newScore = (stopwatch.elapsed.inSeconds);
              changeScore(newScore);
              updateuserafter(score);
              stopwatch.reset();
            }
            controller.resetResult();
          } else {
            controller.setinfotext("Incorrect Answerd, try again.");
            controller.resetResult();
          }
        case "*":
          if (op1 * op2 == int.parse(result)) {
            if (cont < 5) {
              generateCase();
              controller.resetinfotext();
            } else {
              controller
                  .setinfotext("You're Done!, press send again to continue.");
              stopwatch.stop();
              newScore = (stopwatch.elapsed.inSeconds);
              changeScore(newScore);
              updateuserafter(score);
              stopwatch.reset();
            }
            controller.resetResult();
          } else {
            controller.setinfotext("Incorrect Answerd, try again");
            controller.resetResult();
          }
        case "/":
          if (op1 / op2 == int.parse(result)) {
            if (cont < 5) {
              generateCase();
              controller.resetinfotext();
            } else {
              controller
                  .setinfotext("You're Done!, press send again to continue.");
              stopwatch.stop();
              newScore = (stopwatch.elapsed.inSeconds);
              changeScore(newScore);
              updateuserafter(score);
              stopwatch.reset();
            }
            controller.resetResult();
          } else {
            controller.setinfotext("Incorrect Answerd, try again.");
            controller.resetResult();
          }
        default:
          null;
      }
  }
}
