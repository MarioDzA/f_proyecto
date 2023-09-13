import 'package:f_elproyecto/pages/testpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage(
    {Key? key,})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math test"),
    ),
    body: Center(
      child: ElevatedButton(
        key: const Key("TestStartButton") ,
        onPressed: (){
          Get.to(() => const TestPage(
            key: const Key('TestPage')
          ));
        }, child: Text("Begin test"))
    ),
    );}
}