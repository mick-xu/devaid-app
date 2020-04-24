import 'package:flutter_app/models/index.dart'
    show Result, ResultWithToken, Token, SmsResult, UserInfo, MainStateModel;
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart'
    show BaseOptions, L, Response, Dio, Request, host, util;

export "package:flutter_app/models/index.dart"
    show UserInfo, ResultWithToken, Result, Token;

class Account {
  Dio _d;

  Account() {
    _d = new Request().dio;
  }

  Future<Result> signup(
      {String userName, String password, String validateCode}) async {
    Response response = await _d.post("api/accounts/signup", data: {
      'UserName': userName,
      'Password': password,
      'ValidateCode': validateCode
    });
    if (response.statusCode == 200 && response.data['code'] == 'OK') {
      Result<UserInfo> result = new Result<UserInfo>.fromJson(response.data);
      result.data = UserInfo.fromJson(response.data['data']);
      return result;
    } else {
      return Result.fromJson(response.data);
    }
  }

  Future<Response> signin({String userName, String password}) async {
    Response response = await _d.post("api/accounts/signin",
        data: {'UserName': userName, 'Password': password});
    return response;
  }

  Future<void> signout(BuildContext context) async {
    await MainStateModel().of(context).setToken();
    await util.goTo(context, "signInPage");
  }

  Future<SmsResult> sendValidateCode(String phoneNumber) async {
    Response response = await _d.get("api/message/sendvalidatecode",
        queryParameters: {'phoneNumber': phoneNumber});
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SmsResult.fromJson(response.data);
    } else {
      return SmsResult(
          code: response.statusCode.toString(),
          message: response.statusMessage);
    }
  }
}
