import 'package:english_quiz/const/value/colors.dart';
import 'package:english_quiz/ui/component/custom_bottom_sheet.dart';
import 'package:english_quiz/ui/component/textfield_border_search.dart';
import 'package:english_quiz/ui/route/book_search/book_search.dart';
import 'package:flutter/material.dart';

import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';
import '../../ui/component/book_card_column.dart';

class TabBookIntroduction extends StatefulWidget {
  @override
  State<TabBookIntroduction> createState() => _TabBookIntroductionState();
}

class _TabBookIntroductionState extends State<TabBookIntroduction> {
  final TextEditingController tecSearch = TextEditingController();

  @override
  void dispose() {
    tecSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ///책검색
          TextFieldBorderSearch(
            hintText: '책 제목, 저자, 장르 등읍 입력하세요',
            controller: tecSearch,
            colorBorder: colorGray300,
            fillColor: colorPoint800,
            circularNumber: 100,
            suffixIcon: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookSearch()));
                },
                child: Icon(Icons.search, size: 24, color: colorGray900,)),
          ),

          Gaps.v10,

          ///검색 필터
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  //내림차순 코드 추가 필요
                },
                child: Row(
                  children: [
                    Text(
                      'ABC순',
                      style: TS.s14w500(colorGray600),
                    ),
                    Gaps.h4,
                    Image.asset(
                      'assets/icons/downarrow.png',
                      width: 14, // 이미지 너비 (옵션)
                      height: 14, // 이미지 높이 (옵션)
                      fit: BoxFit.cover,
                      color: colorGray600, // 이미지 맞춤 방식 (옵션)
                    ),
                  ],
                ),
              ),

              Gaps.h10,

              GestureDetector(
                onTap: (){
                  showCustomBottomSheet(context);
                },
                child: Row(
                  children: [
                    Text(
                      'Filter',
                      style: TS.s14w500(colorGray600),
                    ),
                    Gaps.h4,
                    Image.asset(
                      'assets/icons/downarrow.png',
                      width: 14, // 이미지 너비 (옵션)
                      height: 14, // 이미지 높이 (옵션)
                      fit: BoxFit.cover,
                      color: colorGray600, // 이미지 맞춤 방식 (옵션)
                    ),
                  ],
                ),
              ),
            ],
          ),

          Gaps.v10,

          /// 책 리스트
          Expanded(
            child: ListView.builder(
              itemCount: 10, // BookCard 개수
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    BookCardColumn(
                      title: '책 제목 $index', // 각각의 카드에 번호를 부여
                      writer: '저자 이름 $index',
                    ),
                    Gaps.v10, // 카드들 사이에 간격 추가
                  ],
                );
              },
            ),
          ),


        ],
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const CustomBottomSheet();
      },
    );
  }

}
