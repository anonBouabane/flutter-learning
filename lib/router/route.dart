import 'package:flutter/material.dart'; 
import 'package:shopgood/view/auth/login.dart';
import 'package:shopgood/view/auth/register.dart';
import 'package:shopgood/compunent/bottomNav.dart';
import 'package:shopgood/view/home/home.dart';

class RouteAPI {
  static const login = "/login";
  static const register = "/register";
  static const bottom = "/bottom";
  static const home = "/home";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => const LogInscreen(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case bottom:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigatorComponent(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        ); 
      default:
        throw const FormatException("Route not found!");
    }
  }
}