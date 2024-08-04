import 'package:flutter/material.dart';
import '../../../const/value/colors.dart';
import '../../../const/value/text_style.dart';

class DialogBlack extends StatelessWidget {
  const DialogBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: colorBlack,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  '비밀번호가 변경되었습니다.',
                  style: TS.s14w500(colorWhite),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
