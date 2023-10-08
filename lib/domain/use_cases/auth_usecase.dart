import 'package:f_elproyecto/domain/repo/repository.dart';

class AuthenticationUseCase {
  Future<bool> login(String email, String password) async {
    return Repository().login(email, password);
  }

  Future<bool> signUp(form) async {
    return Repository().signUp(form);
  }
}
