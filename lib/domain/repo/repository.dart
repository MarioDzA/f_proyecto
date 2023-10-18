import 'package:connectivity_plus/connectivity_plus.dart';
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
    var cr = await (Connectivity().checkConnectivity());
    if (cr == ConnectivityResult.none) {
      String previewemail = await sharedPreferences.retrieveData('email');
      String previewpass = await sharedPreferences.retrieveData('password');
      if (previewemail == email && previewpass == password) {
        return true;
      } else {
        return false;
      }
    } else {
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
  }

  Future<bool> signUp(form) async {
    var cr = await (Connectivity().checkConnectivity());
    if (cr == ConnectivityResult.none) {
      try {
        await sharedPreferences.storeData<String>("email", form.email);
        await sharedPreferences.storeData<String>("name", form.name);
        await sharedPreferences.storeData<String>("firstname", form.firstName!);
        await sharedPreferences.storeData<String>("lastname", form.lastName!);
        await sharedPreferences.storeData<String>("password", form.password);
        await sharedPreferences.storeData<String>("birthday", form.birthday!);
        await sharedPreferences.storeData<String>("grade", form.grade!);
        await sharedPreferences.storeData<String>("school", form.school!);
        await sharedPreferences.storeData<int>("score", 10000);
        return true;
      } catch (e) {
        return false;
      }
    } else {
      if (await dBdata.addUser(form)) {
        print('user created');
        print('saving remote values');
        return true;
      } else {
        return false;
      }
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
