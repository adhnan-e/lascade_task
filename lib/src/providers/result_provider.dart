import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../features/resuts/model/result_model.dart';

class ResultProvider with ChangeNotifier {
  ResultModel resultModel = ResultModel();
  Client client = Client();

  init()async{
    resultModel=await getData();
    notifyListeners();
  }

  Future<ResultModel> getData() async {
    try {
      var uri = Uri.parse('https://test.lascade.com/api/test/list');
      final response = await client.get(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      });
      if (response.statusCode == 200) {
        return ResultModel.fromJson(json.decode(response.body));
      } else {
        return ResultModel();
      }
    } catch (e) {
      return ResultModel();
    }
  }
}
