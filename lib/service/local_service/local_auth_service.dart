import 'package:flutter_app/model/user.dart';
import 'package:hive/hive.dart';

class LocalAuthService {
  late Box<User> _userBox;
  late Box<String> _tokenBox;

  Future<void> init() async {
    _userBox = await Hive.openBox<User>('user');
    _tokenBox = await Hive.openBox<String>('token');
  }

  Future<void> addToken({required String token}) async {
    await _tokenBox.put('token', token);
  }

  Future<void> addUser({required User user}) async {
    await _userBox.put('user', user);
  }

  Future<void> clear() async {
    await _userBox.clear();
    await _tokenBox.clear();
  }

  String? getToken() => _tokenBox.get('token');
  User? getUser() => _userBox.get('user');
}
