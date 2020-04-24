import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/account.dart';
import 'package:flutter_app/models/result.dart';
import 'package:flutter_app/utils/index.dart'
    show
        BaseOptions,
        FormData,
        Response,
        MultipartFile,
        aliyunOss,
        Request,
        util;
import 'package:flutter_app/widgets/index.dart'
    show Selector, MenuTile, EditTile, CircleImage;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageSate createState() => _ProfilePageSate();
}

class _ProfilePageSate extends State<ProfilePage> {
  static final UserInfo _userInfo = MainStateModel().userInfo;
  DateTime _dateTime = DateTime(1986, 07, 30);
  TextEditingController _userNameEditingController;
  TextEditingController _nickNameEditingController;
  Map<int, String> _genders = <int, String>{1: '男', 0: '女'};
  int _gender = 1;

  Future _pickImage(BuildContext context, ImageSource source) async {
    util.back(context);
    var image = await ImagePicker.pickImage(source: source);
    var result = await _uploadImage(image);

    setState(() {
      _userInfo.avatar = result.data;
      _updateAccount(context);
    });
  }

  Future<Result> _uploadImage(File image) async {
    Response response = await new Request().dio.post("api/files/upload",
        data: new FormData.from({
          "avatar": MultipartFile.fromFile(image.path,
              filename: image.path.substring(
            image.path.lastIndexOf('/') + 1,
          )),
        }));
    return Result.fromJson(response.data);
  }

  Future _updateAccount(BuildContext context) async {
    await Request().dio.put("api/accounts/putaccount/${_userInfo.id}",
        data: _userInfo.toJson());
    await MainStateModel().of(context).setUserInfo(_userInfo);
  }

  @override
  void initState() {
    _userNameEditingController =
        new TextEditingController(text: _userInfo.userName);
    _nickNameEditingController =
        new TextEditingController(text: _userInfo.nickName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人资料"),
        actions: <Widget>[
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 0),
            onPressed: () async {
              _userInfo.nickName = _nickNameEditingController.text;
              FocusScope.of(context).requestFocus(FocusNode());
              _updateAccount(context);
            },
            child: Text(
              '保存',
              style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.title.color),
            ),
          )
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: <Widget>[
                MenuTile(
                  title: Text("头像"),
                  trailing: CircleImage(
                    _userInfo.avatar,
                    radius: 22,
                  ),
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 148.0,
                          padding: EdgeInsets.only(top: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "选择头像",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .color),
                                ),
                              ),
                              MenuTile(
                                title: Text("拍照"),
                                editable: false,
                                onTap: () async => await _pickImage(
                                    context, ImageSource.camera),
                              ),
                              Divider(height: 1.0, indent: 16.0),
                              MenuTile(
                                title: Text("相册"),
                                editable: false,
                                onTap: () async => await _pickImage(
                                    context, ImageSource.gallery),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                Divider(height: 1.0, indent: 16.0),
                EditTile(
                  title: Text("用户名"),
                  controller: _userNameEditingController,
                ),
                Divider(height: 1.0, indent: 16.0),
                EditTile(
                  title: Text("昵称"),
                  controller: _nickNameEditingController,
                ),
                Divider(height: 1.0, indent: 16.0),
                MenuTile(
                  title: Text("手机号"),
                  editable: false,
                  trailing: Text(
                    _userInfo.phoneNumber,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                ),
                Divider(height: 1.0, indent: 16.0),
                MenuTile(
                  title: Text("生日"),
                  trailing: Text(
                    '${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')}',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                  onTap: () => DatePicker.showDatePicker(context,
                      locale: DateTimePickerLocale.zh_cn,
                      dateFormat: "yyyy-MM-dd",
                      onConfirm: (dateTime, List<int> index) {
                    setState(() {
                      _dateTime = dateTime;
                    });
                  }),
                ),
                Divider(height: 1.0, indent: 16.0),
                MenuTile(
                  title: Text("性别"),
                  trailing: Text(
                    _genders[_gender],
                    style: TextStyle(
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext contxt) {
                        return Selector(
                          _genders,
                          title: '选择性别',
                          value: _gender,
                          onChange: (value) => setState(() {
                            _gender = value;
                            util.back(context);
                          }),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
