import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testdemo/bloc/home_page_bloc.dart';
import 'package:testdemo/get_user_model.dart';
import 'package:testdemo/model/resource_model.dart';
import 'package:testdemo/network/network.dart';

/* class ApiServices {
  Future<List<GetUserResponseModel>> getUserData() async {
    List<GetUserResponseModel> userList = [];
    String baseUrl = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      log("Get user response : $result");
      userList = result.map((e) => GetUserResponseModel.fromJson(e)).toList();
    }
    return userList;
  }
} */

class HomeScreenRepository {
  static final HomeScreenRepository _homeScreenPhase2PageRepository =
      HomeScreenRepository._init();

  factory HomeScreenRepository() {
    return _homeScreenPhase2PageRepository;
  }

  HomeScreenRepository._init();

  Future getUserData(LoadUserEvent event) async {
    Resource? resource;
    try {
      var result = await NetworkAPICall().get(
        'https://jsonplaceholder.typicode.com/users',
      );
      debugPrint("API RESULT : $result");
      List<UserModel> model = getUserResponseModelFromJson(result);
      debugPrint('API RESULT : 1 $model');
      resource = Resource(
        error: null,
        data: model,
      );
    } catch (e) {
      var json = jsonDecode(e.toString());
      resource = Resource(
          error: json["message"], data: null, statusCode: json["errorCode"]);
    }
    return resource;
  }
}
