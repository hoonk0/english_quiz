import 'package:english_quiz/const/value/colors.dart';
import 'package:english_quiz/ui/component/button/gray_button.dart';
import 'package:english_quiz/ui/component/button/purple_button.dart';
import 'package:english_quiz/ui/component/dialog/dialog_confirm.dart';
import 'package:english_quiz/ui/component/textfield_border.dart';
import 'package:english_quiz/ui/route/auth/detail/route_auth_find_id_detail.dart';
import 'package:english_quiz/ui/route/auth/detail/route_auth_find_pw_detail.dart';
import 'package:english_quiz/ui/route/auth/detail/route_auth_sign_up_welcome.dart';
import 'package:flutter/material.dart';

import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';
import '../../component/custom_appbar.dart';



class RouteAuthFindPw extends StatefulWidget {
  const RouteAuthFindPw({super.key});

  @override
  State<RouteAuthFindPw> createState() => _RouteAuthFindPwState();
}

class _RouteAuthFindPwState extends State<RouteAuthFindPw> {
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecEmailConfirm = TextEditingController();

  final ValueNotifier<bool> vnEmailCheck = ValueNotifier(false);
  final ValueNotifier<bool> vnEmailConfirmCheck = ValueNotifier(false);
  final ValueNotifier<bool> vnFindButtonEnabled = ValueNotifier(false);


  bool isPasswordMatch = false;

  @override
  void initState() {
    super.initState();
    tecEmail.addListener(_onEmailChanged);
    tecEmailConfirm.addListener(_onEmailConfirmChanged);
  }

  void _onEmailChanged() {
    final email = tecEmail.text;
    vnEmailCheck.value = email.isNotEmpty;
    _updateFindButtonState();
  }

  void _onEmailConfirmChanged() {
    final emailConfirm = tecEmailConfirm.text;
    vnEmailConfirmCheck.value = emailConfirm.isNotEmpty;
    _updateFindButtonState();
  }

  void _updateFindButtonState() {
    vnFindButtonEnabled.value =
        tecEmail.text.isNotEmpty &&
        tecEmailConfirm.text.isNotEmpty;
  }

  @override
  void dispose() {
    tecEmail.dispose();
    tecEmailConfirm.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Appbar
                      const CustomAppbar(appTitle: '비밀번호  찾기',),

                      Gaps.v36,

                      /// 이메일
                      Text(
                        '이메일',
                        style: TS.s14w500(colorGray900),
                      ),
                      Gaps.v10,
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextFieldBorder(
                              controller: tecEmail,
                              hintText: '이메일 주소 입력',
                            ),
                          ),
                          Gaps.h8,
                          Expanded(
                            child: ValueListenableBuilder<bool>(
                              valueListenable: vnEmailCheck,
                              builder: (context, vnEmailCheck, child) {
                                return PurpleButton(
                                  title: vnEmailCheck ? '재인증' : '인증요청',
                                  colorBg: vnEmailCheck ? colorPurple500 : colorPurple100,
                                  onTap: vnEmailCheck
                                      ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const DialogConfirm(
                                        desc: '발송이 완료되었습니다.',
                                      ),
                                    );
                                  }
                                      : null,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextFieldBorder(
                              controller: tecEmailConfirm,
                              hintText: '인증번호 입력',
                            ),
                          ),
                          Gaps.h8,
                          Expanded(
                            child: ValueListenableBuilder<bool>(
                              valueListenable: vnEmailConfirmCheck,
                              builder: (context, vnEmailConfirmCheck, child) {
                                return PurpleButton(
                                  title: '확인 ',
                                  colorBg: vnEmailConfirmCheck ? colorPurple500 : colorPurple100,
                                  onTap: vnEmailConfirmCheck
                                      ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const DialogConfirm(
                                        desc: '확인 되었습니다.',
                                      ),
                                    );
                                  }
                                      : null,
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      Gaps.v20,

                      Gaps.v10,
                    ],
                  ),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: vnFindButtonEnabled,
                builder: (context, vnFindButtonEnabled, child) {
                  return GrayButton(
                    title: '비밀번호 찾기',
                    titleColorBg: vnFindButtonEnabled ? colorWhite : colorGray500,
                    colorBg: vnFindButtonEnabled ? colorPurple500 : colorPoint800,
                    onTap: vnFindButtonEnabled ? _Find : null,
                  );
                },
              ),
              Gaps.v10,
            ],
          ),
        ),
      ),
    );
  }


  /// 아이디 찾기
  void _Find() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (tecEmail.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(
          desc: '아이디를 입력해주세요',
        ),
      );
      return;
    }

    final regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(tecEmail.text)) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(
          desc: '올바른 이메일 형식이 아닙니다',
        ),
      );
      return;
    }

    if (tecEmailConfirm.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(
          desc: '인증번호를 입력해주세요',
        ),
      );
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RouteAuthFindPwDetail()));

  }
}
