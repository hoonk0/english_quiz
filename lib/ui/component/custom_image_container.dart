import 'package:english_quiz/const/value/colors.dart';
import 'package:flutter/material.dart';

import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';

class CustomImageContainer extends StatelessWidget {
  final String title;
  final String writer;
  final Color seriesColor;

  const CustomImageContainer({
    required this.title,
    required this.writer,
    this.seriesColor = colorPurple500,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start
      children: [
        Expanded(
          flex: 1, // Adjust flex to control space distribution
          child: Image.asset(
            'assets/images/image0.png',
            width: 65, // 이미지 너비
            height: 80, // 이미지 높이
          ),
        ),
        Gaps.h16,
        Expanded(
          flex: 2, // Adjust flex to control space distribution
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
            children: [
              Container(
                padding: const EdgeInsets.all(4.0), // Add padding inside the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: seriesColor, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Text(
                  'Series',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: seriesColor,
                  ),
                ),
              ),

              Gaps.h4,

              Text(
                writer,
                style: TS.s14w500(colorGray700),
              ),

              Gaps.h10,

              Text(
                title,
                style: TS.s14w500(colorGray900),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
