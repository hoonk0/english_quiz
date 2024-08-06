import 'package:english_quiz/const/value/colors.dart';
import 'package:english_quiz/ui/component/button/gray_button.dart';
import 'package:english_quiz/ui/component/button/purple_button.dart';
import 'package:english_quiz/ui/component/textfield_border.dart';
import 'package:english_quiz/ui/route/auth/detail/route_auth_sign_up_welcome.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';
import '../../component/custom_appbar.dart';
import '../../component/dialog/dialog_confirm.dart';
import '../../component/dialog/dialog_deny.dart';
import '../route_main.dart';

class RouteAuthSignUp extends StatefulWidget {
  const RouteAuthSignUp({super.key});

  @override
  State<RouteAuthSignUp> createState() => _RouteAuthSignUpState();
}

class _RouteAuthSignUpState extends State<RouteAuthSignUp> {
  final TextEditingController tecNickName = TextEditingController();
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecEmailConfirm = TextEditingController();
  final TextEditingController tecPw = TextEditingController();
  final TextEditingController tecPwConfirm = TextEditingController();

  final ValueNotifier<bool> vnEmailCheck = ValueNotifier(false);
  final ValueNotifier<bool> vnEmailConfirmCheck = ValueNotifier(false);
  final ValueNotifier<bool> vnNickNameCheck = ValueNotifier(false);
  final ValueNotifier<bool> vnSignUpButtonEnabled = ValueNotifier(false);

  final ValueNotifier<bool> _obscurePwNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscurePwConfirmNotifier = ValueNotifier<bool>(
      true);

  bool isPasswordMatch = false;

  @override
  void initState() {
    super.initState();
    tecEmail.addListener(_onEmailChanged);
    tecEmailConfirm.addListener(_onEmailConfirmChanged);
    tecNickName.addListener(_onNickNameChanged);
    tecPw.addListener(_onPasswordChanged);
    tecPwConfirm.addListener(_onPasswordConfirmChanged);
  }

  void _onEmailChanged() {
    final email = tecEmail.text;
    vnEmailCheck.value = email.isNotEmpty;
    _updateSignUpButtonState();
  }

  void _onEmailConfirmChanged() {
    final emailConfirm = tecEmailConfirm.text;
    vnEmailConfirmCheck.value = emailConfirm.isNotEmpty;
    _updateSignUpButtonState();
  }

  void _onNickNameChanged() {
    final nickName = tecNickName.text;
    vnNickNameCheck.value = nickName.isNotEmpty;
    _updateSignUpButtonState();
  }

  void _onPasswordChanged() {
    _updateSignUpButtonState();
  }

  void _onPasswordConfirmChanged() {
    _updateSignUpButtonState();
  }

  void _updateSignUpButtonState() {
    vnSignUpButtonEnabled.value = tecNickName.text.isNotEmpty &&
        tecEmail.text.isNotEmpty &&
        tecEmailConfirm.text.isNotEmpty &&
        tecPw.text.isNotEmpty &&
        tecPwConfirm.text.isNotEmpty;
  }

  @override
  void dispose() {
    tecNickName.dispose();
    tecEmail.dispose();
    tecEmailConfirm.dispose();
    tecPw.dispose();
    tecPwConfirm.dispose();

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
                      const CustomAppbar(appTitle: 'Sign up',),

                      Gaps.v36,

                      /// 이메일
                      Text(
                        'Email',
                        style: TS.s14w500(colorGray900),
                      ),
                      Gaps.v10,
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextFieldBorder(
                              controller: tecEmail,
                              hintText: 'Enter Email',
                            ),
                          ),
                          Gaps.h8,
                          Expanded(
                            child: ValueListenableBuilder<bool>(
                              valueListenable: vnEmailCheck,
                              builder: (context, vnEmailCheck, child) {
                                return PurpleButton(
                                  title: vnEmailCheck ? 'Resend' : 'send',
                                  colorBg: vnEmailCheck
                                      ? colorPurple500
                                      : colorPurple100,
                                  onTap: vnEmailCheck
                                      ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                      const DialogConfirm(
                                        desc: 'Sent Successfully',
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
                              hintText: 'Enter Verification Code',
                            ),
                          ),
                          Gaps.h8,
                          Expanded(
                            child: ValueListenableBuilder<bool>(
                              valueListenable: vnEmailConfirmCheck,
                              builder: (context, vnEmailConfirmCheck, child) {
                                return PurpleButton(
                                  title: 'Confirm',
                                  colorBg: vnEmailConfirmCheck
                                      ? colorPurple500
                                      : colorPurple100,
                                  onTap: vnEmailConfirmCheck
                                      ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                      const DialogConfirm(
                                        desc: 'Confirmed',
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

                      ///닉네임
                      Text(
                        'Nickname',
                        style: TS.s14w500(colorGray900),
                      ),
                      Gaps.v10,
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextFieldBorder(
                              controller: tecNickName,
                              hintText: 'Enter Nickname',
                            ),
                          ),
                          Gaps.h8,
                          Expanded(
                            child: ValueListenableBuilder<bool>(
                              valueListenable: vnNickNameCheck,
                              builder: (context, vnNickNameCheck, child) {
                                return PurpleButton(
                                  title: 'Check',
                                  colorBg: vnNickNameCheck
                                      ? colorPurple500
                                      : colorPurple100,
                                  onTap: vnNickNameCheck
                                      ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                      const DialogConfirm(
                                        desc: 'Available',
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

                      Gaps.v22,

                      ///비밀번호
                      Text(
                        'Password',
                        style: TS.s14w500(colorGray900),
                      ),
                      Gaps.v10,
                      ValueListenableBuilder(
                        valueListenable: tecPw,
                        builder: (context, isCheck, child) {
                          return ValueListenableBuilder<bool>(
                            valueListenable: _obscurePwNotifier,
                            builder: (context, _obscurePw, child) {
                              return TextFieldBorder(
                                controller: tecPw,
                                obscureText: _obscurePw,
                                // colorBorder: isPasswordOverSix || tecPw.text.isEmpty ? colorGray500 : colorRed,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 17.0, horizontal: 16.0),
                                hintText: 'Enter Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePw ? Icons.visibility_off : Icons
                                        .visibility,
                                  ),
                                  onPressed: () {
                                    _obscurePwNotifier.value =
                                    !_obscurePwNotifier.value;
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Gaps.v10,
                      ValueListenableBuilder(
                        valueListenable: tecPwConfirm,
                        builder: (context, isCheck, child) {
                          return ValueListenableBuilder<bool>(
                            valueListenable: _obscurePwConfirmNotifier,
                            builder: (context, _obscurePwConfirm, child) {
                              return TextFieldBorder(
                                controller: tecPwConfirm,
                                obscureText: _obscurePwConfirm,
                                // colorBorder: isPasswordOverSix || tecPw.text.isEmpty ? colorGray500 : colorRed,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 17.0, horizontal: 16.0),
                                hintText: 'Re-enter Password',
                                errorText: _isPassConfirmValid(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePwConfirm
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    _obscurePwConfirmNotifier.value =
                                    !_obscurePwConfirmNotifier.value;
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),

                      Gaps.v10,
                    ],
                  ),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: vnSignUpButtonEnabled,
                builder: (context, vnSignUpButtonEnabled, child) {
                  return GrayButton(
                    title: 'Done',
                    titleColorBg: vnSignUpButtonEnabled
                        ? colorWhite
                        : colorGray500,
                    colorBg: vnSignUpButtonEnabled
                        ? colorPurple500
                        : colorPoint800,
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


  /// 비밀번호 검사
  bool _isValidPassword() {
    RegExp regex = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,15}$');
    return regex.hasMatch(tecPw.text);
  }

  ///비밀번호 확인 검사
  String? _isPassConfirmValid() {
    if (tecPwConfirm.text.isEmpty) return null;

    if (tecPw.text != tecPwConfirm.text) {
      isPasswordMatch = false;
      return 'Passwords do not match.';
    } else {
      isPasswordMatch = true;
    }
    return null;
  }

  /// Sign Up
  void _signUp() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (tecEmail.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Please enter your email.',
        ),
      );
      return;
    }

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(tecEmail.text)) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Invalid email format.',
        ),
      );
      return;
    }

    if (tecEmailConfirm.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Please enter the verification code.',
        ),
      );
      return;
    }

    if (tecNickName.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Please enter a nickname.',
        ),
      );
      return;
    }

    if (tecPw.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Please enter your password.',
        ),
      );
      return;
    }

    if (!_isValidPassword()) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Invalid password.',
        ),
      );
      return;
    }

    if (tecPwConfirm.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Please confirm your password.',
        ),
      );
      return;
    }

    if (!isPasswordMatch) {
      showDialog(
        context: context,
        builder: (context) =>
        const DialogConfirm(
          desc: 'Passwords do not match.',
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) =>
          DialogConfirm(
            desc: 'Registration complete.',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RouteAuthSignUpWelcome(),
                ),
              );
            },
          ),
    );
  }
}