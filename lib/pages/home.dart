import 'package:f_elproyecto/pages/TestPagefiles/testpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.result,
  }) : super(key: key);
  final String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Math test " "|| preview test result = $result"),
      ),
      body: Center(
          child: ElevatedButton(
              key: const Key("TestStartButton"),
              onPressed: () {
                Get.to(() => const TestPage(key: Key('TestPage')));
              },
              child: const Text("Begin test"))),
    );
  }
}
