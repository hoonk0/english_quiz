import 'package:english_quiz/const/value/colors.dart';
import 'package:flutter/material.dart';

import '../../const/value/text_style.dart';


class ButtonBottom extends StatelessWidget {
  final String title;
  final Color colorBg;
  final double width;
  final void Function()? onTap;

  const ButtonBottom({
    required this.title,
    this.colorBg = colorPurple500,
    this.width = double.infinity,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: colorBg,
        ),
        child: Center(
          child: Text(
            title,
            style: const TS.s14w600(colorWhite),
          ),
        ),
      ),
    );
  }
}
