import 'dart:io';
import 'package:dio/dio.dart';
import 'constant.dart';
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter/material.dart';

export 'package:dio/dio.dart';
export 'constant.dart';

class Request {
  Dio _dio;

  Request() {
    var token = MainStateModel().token;
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: host,
        //connectTimeout: 6000,
        //receiveTimeout: 120000,
        contentType: Headers.jsonContentType,
        headers: {"Authorization": "$token"},
        extra: {'refresh_token': ''});
    _dio = new Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        // Do something before request is sent

        return options; //continue
        // If you want to resolve the request with some custom data，
        // you can return a `Response` object or return `dio.resolve(data)`.
        // If you want to reject the request with a error message,
        // you can return a `DioError` object or return `dio.reject(errMsg)`
      },
      onResponse: (Response response) {
        // Do something with response data
        return response; // continue
      },
      onError: (DioError e) {
        // Do something with response error
        debugPrint("Error: ${e.message}");
        return e; //continue
      },
    ));
  }

  Dio get dio => _dio;
}
