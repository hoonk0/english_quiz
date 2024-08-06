
import 'package:english_quiz/ui/route/auth/route_auth_find_id.dart';
import 'package:english_quiz/ui/route/route_main.dart';
import 'package:flutter/material.dart';
import '../../const/value/colors.dart';
import '../../const/value/gaps.dart';
import '../../const/value/lines.dart';
import '../../const/value/text_style.dart';
import '../../utils/utils.dart';
import '../component/button/blue_button.dart';
import '../component/dialog/dialog_deny.dart';
import '../component/textfield_border.dart';
import 'auth/route_auth_find_pw.dart';
import 'auth/route_auth_sign_up.dart';


class RouteLogin extends StatefulWidget {
  const RouteLogin({super.key});

  @override
  State<RouteLogin> createState() => _RouteLoginState();
}

class _RouteLoginState extends State<RouteLogin> {
  final TextEditingController tecId = TextEditingController();
  final TextEditingController tecPw = TextEditingController();
  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);
  // final ValueNotifier<bool> vnIsCheck = ValueNotifier(false);
  bool isPasswordOverSix = false;

  @override
  void dispose() {
    tecId.dispose();
    tecPw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  Gaps.v198,
                  Text(
                    'Login',
                    style: TS.s32w700(colorGray900),
                  ),

                  Gaps.v74,

                  TextFieldBorder(
                    controller: tecId,
                    hintText: 'ID',
                  ),
                  Gaps.v10,

                  ValueListenableBuilder(
                    valueListenable: tecPw,
                    builder: (context, isCheck, child) {
                      return ValueListenableBuilder<bool>(
                        valueListenable: _obscureTextNotifier,
                        builder: (context, _obscureText, child) {
                          return TextFieldBorder(
                            controller: tecPw,
                            obscureText: _obscureText,
                           // colorBorder: isPasswordOverSix || tecPw.text.isEmpty ? colorGray500 : colorRed,
                            contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                color: colorGray400,
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                _obscureTextNotifier.value = !_obscureTextNotifier.value;
                              },
                            ),
                            onChanged: (value) {
                              setState(() {
                                isPasswordOverSix = Utils.regExpPw.hasMatch(value);
                              });
                            },
                          );
                        },
                      );

                    },
                  ),
                  
                  Gaps.v35,
                  BlueButton(
                    title: 'Sign in',
                    onTap: () {
                      LoginCheck(context);
                    },
                  ),
                  Gaps.v16,

                  ///회원가입, 아이디, 비밀번호 찾기

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// 회원가입
                      _WidgetText(
                        title: 'Sign up',
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RouteAuthSignUp(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        '|',
                        style: TS.s13w400(colorGray400),
                      ),

                      /// 아이디 찾기
                      _WidgetText(
                        title: 'Find ID',
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RouteAuthFindId(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        '|',
                        style: TS.s13w400(colorGray400),
                      ),

                      /// 비밀번호 찾기
                      _WidgetText(
                        title: 'Find PW',
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RouteAuthFindPw(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  Gaps.v98,

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Expanded(
                            child: Divider(
                              color: colorGray400, // colorGray400
                              thickness: 1,
                            ),
                          ),
                        ),
                        Gaps.h20,
                        Text(
                          'or',
                          style: TS.s13w500(colorGray600)
                        ),
                        Gaps.h20,
                        Container(
                          child: Expanded(
                            child: Divider(
                              color: colorGray400, // colorGray400
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Gaps.v30,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(
                    width: 56,
                    height: 56,
                    child: Image.asset(
                      'assets/images/google.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                      Gaps.h20,

                      SizedBox(
                        width: 56,
                        height: 56,
                        child: Image.asset(
                          'assets/images/kakao.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      Gaps.h20,

                      SizedBox(
                        width: 56,
                        height: 56,
                        child: Image.asset(
                          'assets/images/apple.png',
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    ],
                  ),

                  Gaps.v93,

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

void LoginCheck(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (tecId.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogDeny(
          title: '아이디를 입력해주세요',
        ),
      );
      return;
    }

    if (tecPw.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogDeny(
          title: '비밀번호를 입력해주세요',
        ),
      );
      return;
    }

    if (tecId.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => DialogDeny(
          title: '아이디/비밀번호가 일치하지 않습니다.',
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RouteMain()),
    );
  }
}

class _WidgetText extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const _WidgetText({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.transparent,
          child: Text(
            title,
            style: const TS.s13w400(colorGray600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}