import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/proverder/authprovider.dart';
import 'package:shopgood/view/auth/register.dart';
import 'package:shopgood/compunent/loading.dart'; 

class LogInscreen extends StatefulWidget {
  const LogInscreen({super.key});

  @override
  State<LogInscreen> createState() => _LogInscreenState();
}

class _LogInscreenState extends State<LogInscreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              Image.asset(
                "assets/images/download.jpeg",
                fit: BoxFit.cover,
                height: 1000,
              ),
              Container(
                height: 900,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Login Page",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "ເບີໂທລະສັບ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: phoneNumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: "209xxxxx",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "ລະຫັດຜ່ານ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: passWord,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: "*****",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Checkbox(
                              value: check == true ? true : false,
                              onChanged: (istrue) {
                                onchage(istrue);
                              }),
                          Text(
                            "ຈຳລະຫັດຜ່ານ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          // print("ok");
                          value.Login(
                              phoneNumber: phoneNumber.text,
                              password: passWord.text);
                              Loading(context);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "ເຂົ້າສູ່ລະບົບ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: 80,
                      indent: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: GestureDetector(
                        onTap: () { 
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.red.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "ລົງທະບຽນ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  bool check = false;
  onchage(istrue) {
    setState(() {
      check = istrue;
    });
  }
}
