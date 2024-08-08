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
                  'Your password has been changed',
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
