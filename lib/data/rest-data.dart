import 'dart:async';
import '../models/user.dart';
import '../data/database-helper.dart';

class RestData {
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) async {
    String flagLogged = "logged";
    var user = User(null, username, password, null);
    var db = DatabaseHelper();
    var userReturn = User(null, null, null, null);
    userReturn = await db.selectUser(user);
    if (userReturn != null) {
      flagLogged = "logged";
      return Future.value(User(null, username, password, flagLogged));
    } else {
      flagLogged = "not";
      return Future.value(User(null, username, password, flagLogged));
    }
  }
}
