import 'dart:convert';

import 'package:batterylevel/util/user.dart';
import 'package:batterylevel/util/constant.dart';
import 'package:batterylevel/util/shared_preferences.dart';

class UserManager {
  User _user;
  static UserManager _instance;

  static UserManager getInstance() => _getInstance();

  factory UserManager() => _getInstance();

  UserManager._internal();

  static UserManager _getInstance() {
    if (_instance == null) {
      _instance = new UserManager._internal();
    }
    return _instance;
  }

  Future<User> getUser() async {
    if (_user == null) {
      SpUtil sp = await SpUtil.getInstance();
      String info = sp.getString(Constant.AccountInfo);
      if (info != null) {
        _user = User.fromJson(json.decode(info));
      }
    }
    return _user;
  }

  void saveOrUpdate(User user) async {
    _user = user;
    SpUtil sp = await SpUtil.getInstance();
    sp.putString(Constant.AccountInfo, json.encode(user.toJson()));
  }
}
