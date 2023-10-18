// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_elproyecto/data/remote/userdata.dart';
import 'package:f_elproyecto/domain/use_cases/diff_usecase.dart';
import 'package:f_elproyecto/domain/use_cases/hub_usecase.dart';
import 'package:f_elproyecto/domain/use_cases/test_usecase.dart';
import 'package:f_elproyecto/pages/controllers/authcontroller.dart';
import 'package:f_elproyecto/pages/controllers/hubcontroller.dart';
import 'package:f_elproyecto/pages/controllers/number_controller.dart';
import 'package:f_elproyecto/domain/repo/repository.dart';
import 'package:f_elproyecto/domain/use_cases/auth_usecase.dart';
import 'package:get/get.dart';
import 'package:f_elproyecto/main.dart';

void main() {
  testWidgets('Login test', (WidgetTester tester) async {
    Get.put(UserDataSource());
    Get.put(Hubdata());
    Get.put(Hubusecase());
    Get.put(Repository());
    Get.put(AuthenticationUseCase());
    Get.put(AuthenticationController());
    Get.put(CasoDificultad());
    Get.put(NumberController());
    Get.put(Dificultad());

    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key('TextFormFieldemail')), findsOneWidget);
    expect(find.byKey(const Key('TextFormFieldpassword')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byKey(const Key('HomePage')), findsOneWidget);
  });
}
