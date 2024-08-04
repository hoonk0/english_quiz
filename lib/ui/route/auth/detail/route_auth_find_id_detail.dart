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
              '홍길동님의 아이디는\nasd123**@naver.com입니다.',
              style: TS.s20w600(colorGray900),
            ),

            Gaps.v50,

            PurpleButton(
                title: '로그인',
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
              onTap: (){
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
                    'PW찾기',
                    style: TS.s14w600(colorGray600),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: colorGray600, // 아이콘 색상을 설정합니다 (원하는 색상으로 변경 가능)
                  ),

                ],
              ),
            ),
            Gaps.v20,

            Text(
              'SNS로 가입하신 계정은 비밀번호를 재설정할 수 없습니다.\n로그인 화면에서 SNS계정으로 로그인 하신 후 이용해주세요.',
              style: TS.s13w500(colorPoint700),
            )

          ],
        ),
      ),
    );
  }
}
