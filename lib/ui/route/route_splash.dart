import 'package:english_quiz/ui/route/route_login.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

BuildContext? contextMain;

class RouteSplash extends StatefulWidget {
  const RouteSplash({super.key});

  @override
  State<RouteSplash> createState() => _RouteSplashState();
}

class _RouteSplashState extends State<RouteSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RouteLogin(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    contextMain = context;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 50.w,
          height: 50.w,
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
