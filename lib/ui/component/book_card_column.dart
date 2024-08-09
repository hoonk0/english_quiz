import 'package:english_quiz/const/value/colors.dart';
import 'package:english_quiz/ui/route/book_search/book_series_detail.dart';
import 'package:flutter/material.dart';

import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';

class BookCardColumn extends StatelessWidget {
  final String title;
  final String writer;
  final Color seriesColor;

  const BookCardColumn({
    required this.title,
    required this.writer,
    this.seriesColor = colorPurple500,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ///책 마다 series인 경우 BookSeriesDetail()로 , 아닌 경우 BookInformation()으로 이동 구현 필요
        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookSeriesDetail()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start
        children: [
          Image.asset(
            'assets/images/image0.png',
            width: 65, // 이미지 너비
            height: 80, // 이미지 높이
          ),
          Gaps.h16,
          Column (
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
            children: [

              ///Seies의 경우 색을 seriescolor or white로 해서 구분
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10), // Add padding inside the container
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
        ],
      ),
    );
  }
}
