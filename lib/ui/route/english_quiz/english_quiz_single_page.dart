import 'package:english_quiz/ui/component/button/purple_button.dart';
import 'package:english_quiz/ui/route/english_quiz/english_quiz_box.dart';
import 'package:flutter/material.dart';

import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';

class EnglishQuizSinglePage extends StatelessWidget {
  const EnglishQuizSinglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                customAppBar(context),
                Gaps.v16,
                Text(
                  'merlin missions : shadow of shark',
                  style: TS.s24w600(colorGray800),
                ),
                Gaps.v50,
                EnglishQuizBox(
                  question:
                      "1.What was Florence Nightingale's initial reaction to Jack and Annie thinking she was a famous nurse?",
                  words: [
                    'She was flattered',
                    'She was confused',
                    'She was angry',
                    'She was excited',
                  ],
                ),
                Gaps.v35,
                EnglishQuizBox(
                  question:
                      "2. What did Jack and Annie learn about the importance of payment for good deeds from Mustafa?",
                  words: [
                    'Good deeds should always be rewarded with money',
                    'Helping others without expecting payment is noble',
                    'Only rich people can afford to do good deeds',
                    'Good deeds are not important in Egyptian culture'
                  ],
                ),
                Gaps.v35,
                EnglishQuizBox(
                  question:
                  "3. What was Florence Nightingale's initial reaction to Jack and Annie thinking she was a famous nurse?",
                  words: [
                    'Good deeds should always be rewarded with money',
                    'Helping others without expecting payment is noble',
                    'Only rich people can afford to do good deeds',
                    'Good deeds are not important in Egyptian culture'
                  ],
                ),
                Gaps.v35,
                EnglishQuizBox(
                  question:
                  "4. What was Florence Nightingale's initial reaction to Jack and Annie thinking she was a famous nurse?",
                  words: [
                    'Good deeds should always be rewarded with money',
                    'Helping others without expecting payment is noble',
                    'Only rich people can afford to do good deeds',
                    'Good deeds are not important in Egyptian culture'
                  ],
                ),
                Gaps.v16,
                PurpleButton(colorBg: colorPurple500,
                  title: '정답확인', onTap: (){

                },),
                Gaps.v16,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 위젯을 반환하는 메서드로 수정
  Widget customAppBar(BuildContext context) {
    return SizedBox(
      height: 56.0, // AppBar의 높이
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 24,
              height: 24,
              color: Colors.transparent,
              child: Image.asset(
                'assets/icons/leftarrow.png',
                width: 24, // 이미지 너비
                height: 24, // 이미지 높이
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Quiz',
            style: TS.s18w600(colorGray900),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 24,
              height: 24,
              color: Colors.transparent,
              child: Image.asset(
                'assets/icons/multipage.png',
                width: 24, // 이미지 너비
                height: 24, // 이미지 높이
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
