import 'package:flutter_app/utils/index.dart'
    show util;


class UserInfo {
  UserInfo();

  int id;
  String userName;
  String nickName;
  String avatar;
  String phoneNumber;
  DateTime lastLoginTime;

  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userName = json['userName'],
        nickName = json['nickName'],
        avatar = json['avatar'],
        phoneNumber = json['phoneNumber'],
        lastLoginTime = util.toDateTime(json['lastLoginTime'].toString());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'userName': userName,
        'nickName': nickName,
        'avatar': avatar,
        'phoneNumber': phoneNumber,
        'lastLoginTime': lastLoginTime.toString(),
      };
}
