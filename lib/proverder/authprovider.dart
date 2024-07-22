import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:shopgood/router/route.dart';
import 'package:shopgood/service/auth_service.dart';
import 'package:shopgood/compunent/message.dart';

class AuthProvider extends ChangeNotifier {
  dynamic _userData;
  bool _loading = false;
  bool _success = false;

  AuthService authService = AuthService();
  dynamic get userData => _userData;
  bool get loading => _loading;
  bool get success => _success;
  Future<void> exitApp() async {
    final result = await authService.exitApp();
    if (result == true) {
      navService.pushNamedAndRemoveUntil(RouteAPI.login);
    }
  }

  Future<void> Login({
    required String phoneNumber,
    required String password,
  }) async {
    _loading = true;
    try {
      final result = await authService.Login(
        phoneNumber: phoneNumber,
        password: password,
      );
      navService.goBack();
      if (result != null) {
        _userData = result;
        _loading = false; 
        MessageHelper.showSnackBarMessage(isSuccess: true,message: "login is true");
        navService.pushNamedAndRemoveUntil(RouteAPI.home);
        notifyListeners();
      }
    } catch (e) {
      navService.goBack();
      MessageHelper.showSnackBarMessage(isSuccess: false,message: "fail to login");
    
      _loading = false;
    }
  }

  Future<void> validateToken() async {
    try {
      final result = await authService.validateToken();
      if (result == true) {
        navService.pushNamedAndRemoveUntil(RouteAPI.home);
      } else {
        refreshToken();
      }
    } catch (e) {}
  }

  Future<void> refreshToken() async {
    final result = await authService.refreshToken();
    if (result == true) {
      navService.pushNamedAndRemoveUntil(RouteAPI.home);
    } else {
      navService.pushNamedAndRemoveUntil(RouteAPI.login);
    }
  }

  Future<void> Register({
    required String phoneNumber,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    _loading = true;
    try {
      final result = await authService.Register(
          phoneNumber: phoneNumber,
          password: password,
          firstname: firstname,
          lastname: lastname);
      navService.goBack();
      if (result != null) {
        _success = true;
        _loading = false; 
        MessageHelper.showSnackBarMessage(isSuccess: true,message: "register is true");
        navService.pushNamedAndRemoveUntil(RouteAPI.login);
        notifyListeners();
      }
    } catch (e) { 
      MessageHelper.showSnackBarMessage(isSuccess: false,message: "register fail !!");
      navService.goBack();
      _loading = false;
    } finally {
      _loading = false;
    }
  }
}
