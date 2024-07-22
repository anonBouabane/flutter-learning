import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shopgood/model/category_model.dart';
import 'package:shopgood/compunent/api_path.dart';

class CategoryService {
  final dio = new Dio();
  Future<List<CategoryModel>?> getCategory() async {
    try {
      final response = await dio.get(ApiPath.getallCategory);
      if (response.data['status'] == true) {
        final categories = categoryModelFromeJson(
          jsonEncode(response.data['data']),
        );
        return categories;
      }
    } catch (e) {
      rethrow; // return + print
    }
    return null;
  }

  Future<List<dynamic>?> getProductByHttp(username, password) async {
    try {
      http.post(
        Uri.parse("http://localhost:8000/user/login"),
        body: {
          "username": username,
          "password": password,
        },
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      );
      final response = await http.get(
        Uri.parse("uri"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      }
      http.put(Uri.parse("uri"), body: {
        "username": "user1",
        "password": "12345",
        "email": "example@gmail.com"
      }, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });
      http.delete(Uri.parse("uri"), headers: {}, body: "");
    } catch (e) {}
    return null;
  }

  Future<List<dynamic>?> getProductByDio(username, password) async {
    try {
      Response response = await dio.get(
        "http://localhost:8000/user/login",
        queryParameters: {"id": 1},
      );

      if (response.statusMessage == "success") {
        return response.data;
      }
    } catch (e) {}
    return null;
  }
}
