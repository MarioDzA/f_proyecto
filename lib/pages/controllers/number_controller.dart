import 'package:f_elproyecto/data/remote/userdata.dart';
import 'package:f_elproyecto/domain/model/user_model.dart';
import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:f_elproyecto/pages/home.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NumberController extends GetxController {
  final CasoDificultad caso = Get.find();
  CasoDificultad casehandler = Get.find();
  final stopwatch = Stopwatch();
  final _op1 = 0.obs;
  final _op2 = 0.obs;
  final _operator = "+".obs;
  final _result = "".obs;
  int cont = 0;

  int get op1 => _op1.value;
  int get op2 => _op2.value;
  String get operator => _operator.value;
  String get result => _result.value;

  setOp1(newValue) => _op1.value = newValue;
  setOp2(newValue) => _op2.value = newValue;
  setOperator(newValue) => _operator.value = newValue;
  resetResult() => _result.value = "";
  setResult(newValue) => _result.value = _result + newValue;
  goback() {
    if (_result.toString().isNotEmpty) {
      _result.value = _result.value.substring(0, _result.value.length - 1);
    } else {
      null;
    }
  }

  checkOperation() {
    int newScore = 0;
    switch (operator) {
      case "+":
        if (op1 + op2 == int.parse(result)) {
          if (cont < 5) {
            caso.generateCase();
            cont++;
          } else {
            stopwatch.stop();
            newScore = (stopwatch.elapsed.inSeconds);
            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            cont = 0;
            caso.changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4,
                email: 'elemail',
                password: '2315435',
                score: casehandler.score));
            cont = 0;
            stopwatch.reset();
          }
          resetResult();
        } else {
          resetResult();
        }
      case "*":
        if (op1 * op2 == int.parse(result)) {
          if (cont < 5) {
            caso.generateCase();
            cont++;
          } else {
            stopwatch.stop();
            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            cont = 0;
            caso.changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4,
                email: 'elemail',
                password: '2315435',
                score: casehandler.score));
            cont = 0;
            stopwatch.reset();
          }
          resetResult();
        } else {
          resetResult();
        }
      case "-":
        if (op1 - op2 == int.parse(result)) {
          if (cont < 5) {
            caso.generateCase();
            cont++;
          } else {
            stopwatch.stop();

            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            cont = 0;
            caso.changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4,
                email: 'elemail',
                password: '2315435',
                score: casehandler.score));
            cont = 0;
            stopwatch.reset();
          }
          resetResult();
        } else {
          resetResult();
        }
      case "/":
        if (op1 / op2 == int.parse(result)) {
          if (cont < 5) {
            caso.generateCase();
            cont++;
          } else {
            stopwatch.stop();

            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            cont = 0;
            caso.changeScore(newScore);
            UserDataSource().updateUser(User(
                id: 4,
                email: 'elemail',
                password: '2315435',
                score: casehandler.score));
            cont = 0;
            stopwatch.reset();
          }
          resetResult();
        } else {
          resetResult();
        }
      default:
        null;
    }
  }
}
