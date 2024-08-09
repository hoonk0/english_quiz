import 'package:flutter/material.dart';

import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';

class EnglishQuizBox extends StatelessWidget {
  final String question;
  final List<String> words;

  const EnglishQuizBox({
    required this.question,
    required this.words,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> options = ['a', 'b', 'c', 'd'];
    final ValueNotifier<int> selectedOption = ValueNotifier<int>(-1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TS.s18w500(colorGray900),
        ),
        Gaps.v20,
        Container(
          decoration: BoxDecoration(
            color: colorPoint900,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: colorGray300,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                words.length,
                    (index) => ValueListenableBuilder<int>(
                  valueListenable: selectedOption,
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: index,
                            groupValue: value,
                            onChanged: (int? newValue) {
                              selectedOption.value = newValue!;
                            },
                            activeColor: colorPurple500, // 라디오 버튼 색상
                          ),
                          Expanded(
                            child: Text(
                              '${options[index]}) ${words[index]}',
                              style: TS.s18w600(colorGray900),
                              softWrap: true, // 자동 줄바꿈
                              overflow: TextOverflow.visible, // 오버플로우가 발생해도 생략하지 않음
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
