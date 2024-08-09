import 'package:english_quiz/ui/component/book_card_column.dart';
import 'package:flutter/material.dart';

import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';
import '../../component/custom_appbar.dart';
import '../../component/textfield_border_search.dart';

class BookSearch extends StatelessWidget {
  final TextEditingController tecSearch = TextEditingController();

  BookSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppbar(appTitle: 'Search'),
              Gaps.v16,
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: tecSearch,
                builder: (context, value, child) {
                  return TextFieldBorderSearch(
                    hintText: '책 제목, 저자, 장르 등을 입력하세요',
                    controller: tecSearch,
                    colorBorder: colorGray300,
                    fillColor: colorPoint800,
                    circularNumber: 100,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (value.text.isNotEmpty) {
                          tecSearch.clear();
                        }
                      },
                      child: Transform.scale(
                        scale: 0.5,
                        child: Image.asset(
                          value.text.isNotEmpty
                              ? 'assets/icons/delete.png'
                              : 'assets/icons/search.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Gaps.v20,
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
        ),
      ),
    );
  }
}
