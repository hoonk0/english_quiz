import 'package:english_quiz/ui/component/button/purple_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../const/value/colors.dart';
import '../../../../const/value/gaps.dart';
import '../../../../const/value/text_style.dart';
import '../../route_main.dart';

class RouteAuthSignUpWelcome extends StatelessWidget {
  const RouteAuthSignUpWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gaps.v196,
          Center(
            child: SizedBox(
              width: 60.w,
              height: 60.w,
              child: Image.asset(
                'assets/images/welcome.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Registration Complete!',
              style: TS.s20w700(colorGray900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PurpleButton(
                title: 'Start',
                colorBg: colorPurple500,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RouteMain(),
                    ),
                  );
                }),
          ),
          Gaps.v16
        ],
      ),
    );
  }
}
