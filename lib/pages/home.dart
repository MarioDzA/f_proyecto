import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage(
    {Key? key,})
    : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math text"),
    ),
    body:  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(key: const Key('TextHomeHello'), "Hello "),
        ],
      ),
    ),
    );}
}