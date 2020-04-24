class result {
  result({this.code, this.message});

  final String code;
  final String message;

  result.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];
}

class Result<T> {
  Result(this.code, {this.message, this.data = null});

  final String code;
  final String message;
  T data;

  Result.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];
}

class ResultWithToken<T> extends Result<T> {
  ResultWithToken(code, {this.token, String message, T data})
      : super(code, message: message, data: data);
  final Token token;

  ResultWithToken.fromJson(Map<String, dynamic> json)
      : token = Token.fromJson(json['token']),
        super.fromJson(json);
}

class Token {
  String access_token;
  String refresh_token;
  int expires_in;

  Token.fromJson(Map<String, dynamic> json)
      : access_token = json['access_token'],
        expires_in = json['expires_in'],
        refresh_token = json['refresh_token'];
}

class SmsResult {
  SmsResult({this.code, this.message});

  String code;
  String message;
  String requestId;
  String bizId;

  SmsResult.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        requestId = json['requestId'],
        bizId = json['bizId'];
}
