import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'sign_in.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Body();
  }
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("WECLOME"),
      //   backgroundColor: Colors.white70,
      //   elevation: 0,
      // ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  height: 350,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/gi1.gif',
                        scale: 1.5,
                      ),
                    ),
                  ]),
                ),
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 300),
                child: Container(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SigninPage()));
                    },
                    height: 45,
                    minWidth: MediaQuery.of(context).size.width * 0.55,
                    splashColor: const Color(0xFF610094),
                    color: Colors.black,
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: Container(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    height: 45,
                    minWidth: MediaQuery.of(context).size.width * 0.55,
                    splashColor: const Color(0xFF610094),
                    color: Colors.black,
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
