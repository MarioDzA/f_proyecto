import 'package:f_elproyecto/pages/TestPagefiles/keypad.dart';
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

  void inputNumber(int value) {
    numberPad.text += value.toString();
  }

  void clearLastInput() {
    if (numberPad.text.isNotEmpty) {
      numberPad.text = numberPad.text.substring(
        0,
        numberPad.text.length - 1,
      );
    }
  }
  void sendInput() {
    Get.to(HomePage( key: const Key('HomePage'), result: numberPad.text,));
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
          const Expanded(
              child: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                key: Key("ExcerciseText"),
                child: Text('Excercise here')),
          )),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: numberPad,
                  autofocus: true,
                  showCursor: true,
                  keyboardType: TextInputType.none,
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
