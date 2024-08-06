import 'package:english_quiz/ui/component/button/purple_button.dart';
import 'package:english_quiz/ui/route/auth/route_auth_find_pw.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../const/value/colors.dart';
import '../../../../const/value/gaps.dart';
import '../../../../const/value/text_style.dart';
import '../../route_login.dart';
import '../../route_main.dart';
import '../../route_splash.dart';

class RouteAuthFindIdDetail extends StatelessWidget {
  const RouteAuthFindIdDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gaps.v188,

            Text(
              'Your ID is\nasd123**@naver.com.',
              style: TS.s20w600(colorGray900),
              textAlign: TextAlign.center,
            ),

            Gaps.v50,

            PurpleButton(
                title: 'Login',
                colorBg: colorPurple500,
                onTap: () {
                  Navigator.of(contextMain!).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const RouteLogin(),
                    ),
                        (route) => false,
                  );
                }
            ),
            Gaps.v16,

            GestureDetector(
              onTap: () {
                Navigator.of(contextMain!).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const RouteAuthFindPw(),
                  ),
                      (route) => false,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Find Password',
                    style: TS.s14w600(colorGray600),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: colorGray600,
                  ),
                ],
              ),
            ),
            Gaps.v20,

            Text(
              'Accounts registered via social media cannot reset passwords.Please log in with your social account on the login screen.',
              style: TS.s13w500(colorPoint700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
