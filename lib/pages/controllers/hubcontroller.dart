import 'package:get/get.dart';

class Hubdata extends GetxController{
  final _username = "".obs;
  final _userscore = 0.obs;

  String get username => _username.value;
  int get userscore => _userscore.value;

  setusername(newValue) => _username.value = newValue;
  setuserscore(newValue) => _userscore.value = newValue;
}