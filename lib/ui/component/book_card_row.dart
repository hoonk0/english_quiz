import 'package:english_quiz/const/value/colors.dart';
import 'package:english_quiz/ui/route/book_search/book_information.dart';
import 'package:english_quiz/ui/route/book_search/book_series_detail.dart';
import 'package:flutter/material.dart';

import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';

class BookCardRow extends StatelessWidget {
  final String title;
  final String writer;
  final Color seriesColor;

  const BookCardRow({
    required this.title,
    required this.writer,
    this.seriesColor = colorPurple500,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookInformation()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start
        children: [
          Image.asset(
            'assets/images/image0.png',
            width: 160, // 이미지 너비
            height: 198, // 이미지 높이
          ),

          Gaps.h10,

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
    );
  }
}
