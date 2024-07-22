import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopgood/compunent/api_path.dart';
import 'package:shopgood/compunent/hive_database.dart';

class AuthService {
  final dio = new Dio();
  Future<bool> exitApp() async {
    try {
      await HiveDatabase.deleteProfile();
      await HiveDatabase.deleteToken();
      await HiveDatabase.deleteUserId();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> validateToken() async {
    try {
      final result = await HiveDatabase.getToken();
      if (result == null || result['token'].toString().isEmpty) {
        return false;
      }
      print(result);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<dynamic> refreshToken() async {
    try {
      final result = await HiveDatabase.getToken();
      final data = {
        "token": result['token'],
        "refreshToken": result['refreshToken']
      };
      final response = await dio.post(ApiPath.refreshToken, data: data);
      if (response.data['status'] == true) {
        await HiveDatabase.saveToken(
            token: response.data['data']['token'],
            refresh: response.data["data"]["refreshToken"]);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> Login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final data = {
        "phoneNumber": phoneNumber,
        "password": password,
      };
      final response = await dio.post(
        ApiPath.login,
        data: data,
      );
      if (response.statusCode == 200) {
        await HiveDatabase.saveToken(
          token: response.data['data']['token'],
          refresh: response.data['data']['refreshToken'],
        );
        await HiveDatabase.saveProfile(
          profile: jsonEncode(response.data['data']),
        );
        return response.data['data'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }

  Future<dynamic> Register(
      {required String phoneNumber,
      required String password,
      required String firstname,
      required String lastname}) async {
    try {
      final data = {
        "firstName": firstname,
        "lastName": lastname,
        "phoneNumber": phoneNumber,
        "password": password,
      };
      final response = await dio.post(
        ApiPath.register,
        data: data,
      );
      print(response.data);
      if (response.data['status'] == true) {
        return response.data;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }
}
