
import 'package:flutter/material.dart';
import '../../const/value/colors.dart';
import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';
import '../../utils/utils.dart';
import '../component/button/blue_button.dart';
import '../component/textfield_border.dart';


class RouteLogin extends StatefulWidget {
  const RouteLogin({super.key});

  @override
  State<RouteLogin> createState() => _RouteLoginState();
}

class _RouteLoginState extends State<RouteLogin> {
  final TextEditingController tecId = TextEditingController();
  final TextEditingController tecPw = TextEditingController();
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
                  Gaps.v145,

                  Gaps.v40,
                  Text(
                    '간편한 통학 버스 시스템',
                    style: TS.s24w800(colorBlue500),
                  ),
                  Gaps.v54,
                  TextFieldBorder(
                    controller: tecId,
                    colorFocused: colorBlue500,
                    colorBorder: colorGray500,
                    contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
                    hintText: '아이디를 입력해주세요',
                  ),
                  Gaps.v10,
                  ValueListenableBuilder(
                    valueListenable: tecPw,
                    builder: (context, isCheck, child) {
                      return TextFieldBorder(
                        // tecPw.value = '입력된 값';
                        controller: tecPw,
                        obscureText: true,
                        colorFocused: isPasswordOverSix || tecPw.text.isEmpty ? colorBlue500 : colorRed,
                        colorBorder: isPasswordOverSix || tecPw.text.isEmpty ? colorGray500 : colorRed,
                        contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
                        colorBorderError: isPasswordOverSix ? colorBlue500 : colorRed,
                        errorText: isPasswordOverSix || tecPw.text.isEmpty ? null : 'ⓘ 비밀번호가 올바르지 않습니다.',
                        hintText: '비밀번호를 입력해주세요',
                        onChanged: (value) {
                          // vnIsCheck.value = !vnIsCheck.value;
                          // debugPrint("onChanged ${vnIsCheck.value}");
                          isPasswordOverSix = Utils.regExpPw.hasMatch(value);
                        },
                      );
                    },
                  ),
                  Gaps.v34,
                  BlueButton(
                    title: '로그인',
                    onTap: () {
                      //LoginCheck(context);
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/*  void LoginCheck(BuildContext context) {
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
  }*/
}
