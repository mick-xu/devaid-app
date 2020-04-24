import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app/models/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin userInfoModel on Model {
  final String userInfoKey = "userInfo";
  final String tokenKey = "token";

  static UserInfo _userInfo;
  static String _token;

  UserInfo get userInfo => _userInfo;

  String get token => _token;

  Future<void> setUserInfo(UserInfo user) async {
    _userInfo = user;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(userInfoKey, <String>[
      _userInfo.id.toString(),
      _userInfo.userName,
      _userInfo.nickName,
      _userInfo.phoneNumber,
      _userInfo.avatar,
      _userInfo.lastLoginTime.toString()
    ]);
    notifyListeners();
  }

  Future<void> setToken({String token}) async {
    _token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_token == null || _token.isEmpty) {
      await prefs.remove(tokenKey);
      //await prefs.remove(userInfoKey);
    } else {
      await prefs.setString(tokenKey, _token);
      notifyListeners();
    }
  }

  Future<void> initUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = await prefs.getString(tokenKey);

    List<String> userInfoList = await prefs.getStringList(userInfoKey);

    _userInfo = userInfoList == null
        ? new UserInfo()
        : new UserInfo.fromJson({
            'id': int.parse(userInfoList.elementAt(0)),
            'userName': userInfoList.elementAt(1),
            'nickName': userInfoList.elementAt(2),
            'phoneNumber': userInfoList.elementAt(3),
            'avatar': userInfoList.elementAt(4),
            'lastLoginTime': DateTime.parse(userInfoList.elementAt(5))
          });
  }
}
