// ignore_for_file: dead_code, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testdemo/log_utils/log_util.dart';
import 'package:testdemo/network/exception.dart';

const API_TIME_OUT = 60; //in seconds

class NetworkAPICall {
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();

  factory NetworkAPICall() {
    return _networkAPICall;
  }

  NetworkAPICall._internal();

  Future<dynamic> get(String url,
      {bool useBaseUrl = true,
      http.Client? apiClient,
      bool isDelete = false}) async {
    var client = http.Client();
    if (apiClient != null) {
      client = apiClient;
    }

    try {
      LogUtils.showLogs(message: url, tag: 'API Url');

      var uri = Uri.parse(url);
      var response =
          await client.get(uri).timeout(const Duration(seconds: API_TIME_OUT));

      LogUtils.showLogs(message: response.body, tag: 'Response Body');
      LogUtils.showLogs(
          message: response.statusCode.toString(), tag: 'Response statusCode');
      return checkResponse(response);
    } catch (exception) {
      client.close();
    }
  }

  dynamic checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        try {
          var json = jsonDecode(response.body);
          return json;
          if (json['success'] ?? false || json['status'] == "created") {
            return json;
          } else {
            throw AppException(
                message: json['message'], errorCode: json['status_code'] ?? 0);
          }
        } catch (e, stackTrace) {
          throw AppException.exceptionHandler(e, stackTrace);
        }
      case 201:
      case 400:
      case 401:
      case 500:
      case 502:
        throw AppException(
          message: "Looks like our server is down for maintenance," +
              r'''\n\n''' +
              "Please try again later.",
          errorCode: response.statusCode,
        );
      default:
        throw AppException(
          message: "Unable to communicate with the server at the moment." +
              r'''\n\n''' +
              "Please try again later",
          errorCode: response.statusCode,
        );
    }
  }
}
