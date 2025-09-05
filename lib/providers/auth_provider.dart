import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:great_places/data/store.dart';

class AuthProvider with ChangeNotifier {
  String? _name;
  String? _email;
  String? _token;

  bool get isAuth {
    return _token != null && _token!.isNotEmpty;
  }

  String? get email {
    return _email;
  }

  String? get name {
    return _name;
  }

  String _generateToken() {
    const List<String> chars = [
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'abcdefghijklmnopqrstuvwxyz',
      '0123456789',
      '!@#\$%ˆ&*()_+',
    ];
    final rand = Random.secure();
    return List.generate(
      24,
      (_) => chars[rand.nextInt(chars.length)][rand.nextInt(chars.length)],
    ).join();
  }

  Future<void> autoLogin() async {
    if (isAuth) return;
    final String token = await Store.getString('token');
    final String email = await Store.getString('email');
    if (token.isEmpty) return;
    _email = email;
    _token = token;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _email = email;
    _token = _generateToken();
    await Store.saveString('token', _token!);
    await Store.saveString('email', email);
    notifyListeners();
  }

  Future<void> logout() async {
    _name = null;
    _email = null;
    _token = null;
    await Store.removeString('token');
    await Store.removeString('email');
    notifyListeners();
  }
}
