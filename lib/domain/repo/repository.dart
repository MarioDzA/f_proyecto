import 'package:f_elproyecto/data/local/localstorage.dart';
import 'package:f_elproyecto/data/remote/authdata.dart';
import 'package:f_elproyecto/data/remote/userdata.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';

class Repository {
  late AuthenticationDatasource _authenticationDataSource;
  late UserDataSource _userDatatasource;
  final UserDataSource dBdata = Get.find();
  final sharedPreferences = LocalPreferences();

  Repository() {
    _authenticationDataSource = AuthenticationDatasource();
  }

  Future<bool> login(String email, String password) async {
    var user = await dBdata.getUserbyquery(email);
    if (user.password == password) {
      await sharedPreferences.storeData<String>("email", user.email);
      await sharedPreferences.storeData<String>("name", user.name);
      await sharedPreferences.storeData<String>("firstname", user.firstName!);
      await sharedPreferences.storeData<String>("lastname", user.lastName!);
      await sharedPreferences.storeData<String>("password", user.password);
      await sharedPreferences.storeData<String>("birthday", user.birthday!);
      await sharedPreferences.storeData<String>("grade", user.grade!);
      await sharedPreferences.storeData<String>("school", user.school!);
      await sharedPreferences.storeData<int>("id", user.id as int);
      await sharedPreferences.storeData<int>("score", user.score as int);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(form) async {
    if (await dBdata.addUser(form)) {
      print('user created');
      print('saving local values');
      return true;
    } else {
      return false;
    }
  }

  Future<int> getscore() async {
    int score = await sharedPreferences.retrieveData("score");
    return score;
  }

  Future<String> getusername() async {
    try {
      String name = await sharedPreferences.retrieveData("name");
      return name;
    } catch (e) {
      return "User";
    }
  }

  Future<bool> logOut() async => await _authenticationDataSource.logOut();

  Future<List<User>> getUsers() async => await _userDatatasource.getUsers();

  Future<void> updateUser(score) async {
    User user = User(
        id: await sharedPreferences.retrieveData("id"),
        email: await sharedPreferences.retrieveData('email'),
        password: await sharedPreferences.retrieveData('password'),
        firstName: await sharedPreferences.retrieveData('firstname'),
        lastName: await sharedPreferences.retrieveData('lastname'),
        birthday: await sharedPreferences.retrieveData('birthday'),
        school: await sharedPreferences.retrieveData('school'),
        grade: await sharedPreferences.retrieveData('grade'),
        score: score);
    sharedPreferences.storeData<int>("score", score as int);
    await UserDataSource().updateUser(user);
  }

  Future<bool> deleteUser(int id) async =>
      await _userDatatasource.deleteUser(id);
}
