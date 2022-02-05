// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'body.dart';
class MyHomePage_1 extends StatefulWidget {
  const MyHomePage_1({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage_1> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  Body()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_8erih9tu.json')),
          ],
        ),
      ),
    );
  }
}
