import 'package:f_elproyecto/domain/use_cases/diff_usecase.dart';
import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:f_elproyecto/pages/TestPagefiles/keypad.dart';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:f_elproyecto/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TestPage> createState() => _TestPagestate();
}

class _TestPagestate extends State<TestPage> {
  late final TextEditingController numberPad;
  NumberController controller = Get.find();
  CasoDificultad casehandler = Get.find();

  @override
  void initState() {
    super.initState();
    numberPad = TextEditingController();
  }

  @override
  void dispose() {
    numberPad.dispose();
    super.dispose();
  }

  void inputNumber(String value) {
    numberPad.text += value.toString();
    controller.resetResult();
    controller.setResult(numberPad.text);
  }

  void clearLastInput() {
    if (numberPad.text.isNotEmpty) {
      numberPad.text = numberPad.text.substring(
        0,
        numberPad.text.length - 1,
      );
    }
  }

  Dificultad handler = Get.find();
  int cont = 0;
  void sendInput() {
    if (cont <= 5) {
      casehandler.checkOperation(controller.op1, controller.op2,
          controller.result, controller.operator, cont);
      cont++;
      controller.resetResult();
      clearAll();
    } else {
      cont = 0;
      Get.to(HomePage(
        key: const Key('HomePage'),
      ));
    }
  }

  void clearAll() {
    numberPad.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Obx(
                () => Text(controller.infotext.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20)),
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: SizedBox(
                    child: Row(
                  children: [
                    Expanded(
                        child: Obx(() => Text(controller.op1.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 50)))),
                    Expanded(
                        child: Obx(() => Text(controller.operator.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 50)))),
                    Expanded(
                        child: Obx(() => Text(controller.op2.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 50)))),
                  ],
                ))),
          )),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.black),
                  controller: numberPad,
                  autofocus: true,
                  showCursor: true,
                  keyboardType: TextInputType.none,
                  enabled: false,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: KeyPad(
              onInputNumber: inputNumber,
              onClearLastInput: clearLastInput,
              onClearAll: clearAll,
              sendInput: sendInput,
            ),
          ),
        ],
      ),
    );
  }
}
