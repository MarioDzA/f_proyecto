import 'package:f_elproyecto/data/remote/authdata.dart';

import '../../data/remote/userdata.dart';
import '../model/user_model.dart';

class Repository {
  late AuthenticationDatasource _authenticationDataSource;
  late UserDataSource _userDatatasource;
  String token = "";

  // the base url of the API should end without the /
  final String _baseUrl =
      "http://ip172-19-0-50-ck50bkcsnmng009j8hp0-8000.direct.labs.play-with-docker.com";

  Repository() {
    _authenticationDataSource = AuthenticationDatasource();
    _userDatatasource = UserDataSource();
  }

  Future<bool> login(String email, String password) async {
    token = await _authenticationDataSource.login(_baseUrl, email, password);
    return true;
  }

  Future<bool> signUp(String email, String password) async =>
      await _authenticationDataSource.signUp(_baseUrl, email, password);

  Future<bool> logOut() async => await _authenticationDataSource.logOut();

  Future<List<User>> getUsers() async => await _userDatatasource.getUsers();

  Future<bool> addUser(User user) async =>
      await _userDatatasource.addUser(user);

  Future<bool> updateUser(User user) async =>
      await _userDatatasource.updateUser(user);

  Future<bool> deleteUser(int id) async =>
      await _userDatatasource.deleteUser(id);

  Future<bool> simulateProcess() async =>
      await _userDatatasource.simulateProcess(_baseUrl, token);
}