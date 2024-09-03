import 'dart:async';

import 'package:flutter/cupertino.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushNamed("home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/splash_background.png"),
     // height: double.infinity,
      //width: double.infinity,
    );
  }
}
