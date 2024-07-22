import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/proverder/authprovider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Provider.of<AuthProvider>(context,listen: false).validateToken();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/play_store_512.png",
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          Text(
            "shopgood",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
