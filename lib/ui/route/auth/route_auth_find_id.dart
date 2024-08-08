import 'package:english_quiz/const/value/colors.dart';
import 'package:english_quiz/ui/component/button/gray_button.dart';
import 'package:english_quiz/ui/component/button/purple_button.dart';
import 'package:english_quiz/ui/component/textfield_border.dart';
import 'package:english_quiz/ui/route/auth/detail/route_auth_find_id_detail.dart';
import 'package:english_quiz/ui/route/auth/detail/route_auth_sign_up_welcome.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';
import '../../component/custom_appbar.dart';
import '../../component/dialog/dialog_confirm.dart';
import '../../component/dialog/dialog_deny.dart';
import '../route_main.dart';

class RouteAuthFindId extends StatefulWidget {
  const RouteAuthFindId({super.key});

  @override
  State<RouteAuthFindId> createState() => _RouteAuthFindIdState();
}

class _RouteAuthFindIdState extends State<RouteAuthFindId> {
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecEmailConfirm = TextEditingController();

  final ValueNotifier<bool> vnSignUpButtonEnabled = ValueNotifier(false);
  final RegExp regExpEmail = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]{2,}$");

  @override
  void initState() {
    super.initState();
    tecEmail.addListener(_updateSignUpButtonState);
    tecEmailConfirm.addListener(_updateSignUpButtonState);
  }

  @override
  void dispose() {
    tecEmail.dispose();
    tecEmailConfirm.dispose();
    super.dispose();
  }

  void _updateSignUpButtonState() {
    vnSignUpButtonEnabled.value =
        tecEmail.text.isNotEmpty &&
            regExpEmail.hasMatch(tecEmail.text) &&
            tecEmailConfirm.text.isNotEmpty;
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
                      // Appbar
                      const CustomAppbar(appTitle: 'Find ID'),

                      Gaps.v36,

                      // 이메일
                      Text('Email', style: TS.s14w500(colorGray900)),
                      Gaps.v10,
                      ValueListenableBuilder(
                        valueListenable: tecEmail,
                        builder: (context, value, child) {
                          final isEmailMatch = regExpEmail.hasMatch(tecEmail.text);
                          return Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFieldBorder(
                                  controller: tecEmail,
                                  hintText: 'Enter Email',
                                  errorText: (tecEmail.text.isEmpty || isEmailMatch) ? null : 'Invalid Email format',
                                ),
                              ),
                              Gaps.h8,
                              Expanded(
                                child: PurpleButton(
                                  title: isEmailMatch ? 'Resend' : 'Send',
                                  colorBg: isEmailMatch ? colorPurple500 : colorPurple100,
                                  onTap: isEmailMatch
                                      ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const DialogConfirm(desc: 'Sent successfully'),
                                    );
                                  }
                                      : null,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Gaps.v10,
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextFieldBorder(
                              controller: tecEmailConfirm,
                              hintText: 'Enter Verification Code',
                            ),
                          ),
                          Gaps.h8,
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: tecEmailConfirm,
                              builder: (context, tecEmailConfirm, child) {
                                return PurpleButton(
                                  title: 'Confirm',
                                  colorBg: tecEmailConfirm.text.isNotEmpty ? colorPurple500 : colorPurple100,
                                  onTap: tecEmailConfirm.text.isNotEmpty
                                      ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const DialogConfirm(desc: 'Confirmed'),
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
                    ],
                  ),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: vnSignUpButtonEnabled,
                builder: (context, vnSignUpButtonEnabled, child) {
                  return GrayButton(
                    title: 'Find ID',
                    titleColorBg: vnSignUpButtonEnabled ? colorWhite : colorGray500,
                    colorBg: vnSignUpButtonEnabled ? colorPurple500 : colorPoint800,
                    onTap: vnSignUpButtonEnabled ? _signUp : null,
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

  void _signUp() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (tecEmail.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(desc: 'Please enter your email.'),
      );
      return;
    }

    if (!regExpEmail.hasMatch(tecEmail.text)) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(desc: 'Invalid email format.'),
      );
      return;
    }

    if (tecEmailConfirm.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(desc: 'Please enter the verification code.'),
      );
      return;
    }

    // 조건이 모두 맞으면 다이얼로그를 보여주지 않고 바로 이동
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RouteAuthFindIdDetail(),
      ),
    );
  }

}
