import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/model/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserModel with ChangeNotifier {
  User _user;

  User get user => _user;

  void initUser() {

  }

  /// 登录
  Future<User> login(BuildContext context, String phone, String pwd) async {
    User user = await login(context, phone, pwd);
    if (user.code > 299) {
      showToast( '登录失败，请检查账号密码');
      return null;
    }
    showToast( '登录成功');
    _saveUserInfo(user);
    return user;
  }

  /// 保存
  _saveUserInfo(User user) async {
    _user = user;
    SharedPreferences sp;
    sp = await SharedPreferences.getInstance();
    sp.setString('user', json.encode(user.toJson()));
  }
}
