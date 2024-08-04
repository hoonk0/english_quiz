import 'package:english_quiz/const/value/colors.dart';
import 'package:english_quiz/ui/component/button/gray_button.dart';
import 'package:english_quiz/ui/component/button/purple_button.dart';
import 'package:english_quiz/ui/component/dialog/dialog_black.dart';
import 'package:english_quiz/ui/component/textfield_border.dart';
import 'package:english_quiz/ui/route/auth/detail/route_auth_sign_up_welcome.dart';
import 'package:flutter/material.dart';

import '../../../../const/value/gaps.dart';
import '../../../../const/value/text_style.dart';
import '../../../component/custom_appbar.dart';
import '../../../component/dialog/dialog_confirm.dart';


class RouteAuthFindPwDetail extends StatefulWidget {
  const RouteAuthFindPwDetail({super.key});

  @override
  State<RouteAuthFindPwDetail> createState() => _RouteAuthFindPwDetailState();
}

class _RouteAuthFindPwDetailState extends State<RouteAuthFindPwDetail> {
  final TextEditingController tecPw = TextEditingController();
  final TextEditingController tecPwConfirm = TextEditingController();

  final ValueNotifier<bool> vnSignUpButtonEnabled = ValueNotifier(false);

  final ValueNotifier<bool> _obscurePwNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscurePwConfirmNotifier = ValueNotifier<bool>(true);

  bool isPasswordMatch = false;

  @override
  void initState() {
    super.initState();

    tecPw.addListener(_onPasswordChanged);
    tecPwConfirm.addListener(_onPasswordConfirmChanged);
  }

  void _onPasswordChanged() {
    _updateSignUpButtonState();
  }

  void _onPasswordConfirmChanged() {
    _updateSignUpButtonState();
  }

  void _updateSignUpButtonState() {
    vnSignUpButtonEnabled.value =
        tecPw.text.isNotEmpty &&
        tecPwConfirm.text.isNotEmpty;
  }

  @override
  void dispose() {
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
                      const CustomAppbar(appTitle: '비밀번호 찾기',),

                      Gaps.v36,

                      ///비밀번호
                      Text(
                        '새로운 비밀번호',
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
                                contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
                                hintText: '비밀번호 입력',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePw ? Icons.visibility_off : Icons.visibility,
                                    color: colorGray400,
                                  ),
                                  onPressed: () {
                                    _obscurePwNotifier.value = !_obscurePwNotifier.value;
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
                                contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
                                hintText: '비밀번호 재입력',
                                errorText: _isPassConfirmValid(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    color: colorGray400,
                                    _obscurePwConfirm ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    _obscurePwConfirmNotifier.value = !_obscurePwConfirmNotifier.value;
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
                    title: '변경 완료',
                    titleColorBg: vnSignUpButtonEnabled ? colorWhite : colorGray500,
                    colorBg: vnSignUpButtonEnabled ? colorPurple500 : colorPoint800,
                    onTap: vnSignUpButtonEnabled ? _findPw : null,
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
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,15}$');
    return regex.hasMatch(tecPw.text);
  }

  ///비밀번호 확인 검사
  String? _isPassConfirmValid() {
    if (tecPwConfirm.text.isEmpty) return null;

    if (tecPw.text != tecPwConfirm.text) {
      isPasswordMatch = false;
      return '비밀번호가 일치하지 않습니다.';
    } else {
      isPasswordMatch = true;
    }
    return null;
  }

  /// 회원가입
  void _findPw() {
    FocusManager.instance.primaryFocus?.unfocus();


    if (tecPw.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(
          desc: '비밀번호를 입력해주세요',
        ),
      );
      return;
    }

    if (!_isValidPassword()) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(
          desc: '유효한 비밀번호가 아닙니다',
        ),
      );
      return;
    }

    if (tecPwConfirm.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(
          desc: '비밀번호 재입력을 입력해주세요',
        ),
      );
      return;
    }

    if (!isPasswordMatch) {
      showDialog(
        context: context,
        builder: (context) => const DialogConfirm(
          desc: '비밀번호가 일치하지 않습니다',
        ),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) {
        // Automatically close the dialog after 1 second
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return DialogBlack();
      },
    );

    //showBottomDialog(context, '비밀번호가 변경되었습니다.');
  }


  void showBottomDialog(BuildContext context, String message) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
              color: colorBlack,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
              child: Text(
                '비밀번호가 변경되었습니다.',
                style: TS.s14w500(colorWhite),
                textAlign: TextAlign.center,
              ),
            ),

        );
      },

    );
  }

}
