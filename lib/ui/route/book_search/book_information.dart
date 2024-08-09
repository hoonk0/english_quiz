import 'package:english_quiz/ui/route/english_quiz/english_quiz_single_page.dart';
import 'package:english_quiz/ui/route/english_quiz/english_word_list.dart';
import 'package:flutter/material.dart';

import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';
import '../../component/custom_appbar.dart';

class BookInformation extends StatelessWidget {
  const BookInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppbar(
                        appTitle: '',
                      ),

                      Gaps.v16,

                      Image.asset(
                        'assets/images/image0.png',
                      ),

                      Gaps.v20,

                      Text(
                        'Henrich, Joseph',
                        style: TS.s16w500(colorGray700),
                      ),

                      Gaps.v10,

                      Text(
                        'merlin missions : shadow of shark',
                        style: TS.s20w600(colorGray900),
                      ),

                      Gaps.v4,

                      Text(
                        '책소개',
                      style: TS.s18w600(colorGray900),
                      ),

                      Gaps.v30,

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorGray300,
                          ),
                          color: colorPoint900,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '“merlin missions : shadow of shark”는 mary Pope Osbirne의 인기 시리즈 Merlin Missions 중 25번째 책으로, 어린 독자들을 위한 흥미진진한 모험 이야기입니다. Jack과 Annie라는 형제가 마법의 나무집을 타고 고대 마야 문명으로 시간 여행을 떠나는 내용을 담고 있습니다. 이 책은 역사, 문화, 해양 생태계, 그리고 성평등에 대한 페이지를 재미있게 전달하며, 어린이들의 상상력과 호기심을 자극합니다. AR 레벨 4.0 Lexile 지수 602L로, 7-11세 아이들에게 적합한 독서 수준을 제공하며, 교육적 가치와 재미를 동시에 선사합니다.',
                            style: TS.s14w400(colorGray900),
                          ),
                        ),
                      ),

                      Gaps.v20,

                      Row(
                        children: [
                          BookLevel(title: 'AR Level', desc: '4.0'),
                          Gaps.h10,
                          BookLevel(title: 'Lexile 지수', desc: '620L'),
                          Gaps.h10,
                          BookLevel(title: '적정 연령', desc: '7-11세'),
                        ],
                      ),

                      Gaps.v24,
                    ],
                  ),
                ),

                Divider(
                  color: colorGray100,
                  thickness: 10,
                ),

                Gaps.v20,

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      EnglishQuizList(title: '영어 단어 리스트', onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => EnglishWordList()));
                      },),
                      Gaps.v16,
                      EnglishQuizList(title: '영어 단어 퀴즈'),
                      Gaps.v16,
                      EnglishQuizList(title: '퀴즈',onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EnglishQuizSinglePage()));
                      },),

                    ],
                  ),
                ),

                Gaps.v16
              ],
            ),

          ),
      ),
    );
  }

}

class BookLevel extends StatelessWidget {
  final String title;
  final String desc;

  const BookLevel({
    required this.title,
    required this.desc,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colorPurple50,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: colorPurple500,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
          child: Column(
            children: [
              Text(
                title,
                style: TS.s12w500(colorGray900),
              ),
              Gaps.v10,
              Text(
                desc,
                style: TS.s18w600(colorPurple500),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EnglishQuizList extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const EnglishQuizList({
    required this.title,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: colorPoint900,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: colorGray300,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TS.s18w600(colorGray900),
                    ),
                    Image.asset(
                      'assets/icons/rightarrow.png',
                      width: 24, // 이미지 너비 (옵션)
                      height: 24, // 이미지 높이 (옵션)
                      fit: BoxFit.cover,
                      color: colorGray600, // 이미지 맞춤 방식 (옵션)
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}