import '../../domain/use_cases/auth_usecase.dart';
import 'package:get/get.dart';

import 'package:loggy/loggy.dart';

class AuthenticationController extends GetxController {
  final logged = false.obs;

  bool get isLogged => logged.value;

  Future<void> login(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    if (await authentication.login(email, password)) {
      logged.value = true;
    } else {
      throw 'Need password';
    }
  }

  Future<void> signUp(form) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Sign Up');
    if (await authentication.signUp(form)) {
    } else {
      throw "user couldn't be created";
    }
  }

  Future<void> logOut() async {
    logged.value = false;
  }
}
