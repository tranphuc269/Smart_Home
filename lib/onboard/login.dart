// ignore_for_file: sized_box_for_whitespace, deprecated_member_use
import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:api_example_app/LandingScreen/landing_screen.dart';
import 'package:api_example_app/controller/login_controller.dart';
import 'package:api_example_app/onboard/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = Get.put(LoginController());
  int activeIndex = 0;
  var password = true;
  var b = Colors.black;

  @override
  void initState() {
    // Timer.periodic(const Duration(seconds: 5), (timer) {
    //   setState(() {
    //     activeIndex++;
    //     if (activeIndex == 4) {
    //       activeIndex = 0;
    //     }
    //   });
    // });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng nhập",
            style: TextStyle(color: Colors.black, fontSize: 25)),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white38,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: Container(
                  height: 265,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/v.png',
                        scale: 1.5,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: TextField(
                  cursorColor: Colors.black,
                  onChanged: (value){
                    _loginController.email = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    labelText: 'Email',
                    hintText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    suffixIcon: const Icon(
                      Iconsax.user,
                      color: Colors.black,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: TextField(
                  obscureText: password,
                  onChanged: (value){
                    _loginController.password = value;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    labelText: 'Mật khẩu',
                    hintText: 'Mật khẩu',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    // prefixIcon: Icon(Iconsax.key, color: Colors.black, size: 18, ),
                    suffixIcon: IconButton(
                      color: b,
                      icon: Icon(
                        password == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // setState(() {
                        //   password = !password;
                        //   b = b == Colors.black
                        //       ? const Color(0xFFC400C6)
                        //       : Colors.black;
                        // });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Quên mật khẩu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: MaterialButton(
                  onPressed: (){
                    _loginController.login(context);
                  },
                  height: 45,
                  splashColor: const Color(0xFF610094),
                  color: Colors.black,
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 900),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn không có tài khoản?',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SigninPage()));
                      },
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
