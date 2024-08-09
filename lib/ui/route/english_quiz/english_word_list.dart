import 'package:flutter/material.dart';
import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';
import '../../component/custom_appbar.dart';

class EnglishWordList extends StatelessWidget {
  const EnglishWordList({super.key});

  @override
  Widget build(BuildContext context) {
    // 단어 목록 리스트
    final List<String> words = [
      'Solstice (하지)',
      'Cove (작은 만)',
      'Pebbly (자갈이 많은)',
      'Craggy (울퉁불퉁한)',
      'Blubber (고래 기름)',
      'Selkie (바다표범 인간) ',
      'Thrilling (흥분되는)',
      'Murky (흐릿한, 탁한)',
      'Pulsed (맥박 뛰듯이 움직이는)'
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const CustomAppbar(
                  appTitle: 'English Word List',
                ),
                Gaps.v16,
                Text(
                  'merlin missions : shadow of shark',
                  style: TS.s24w600(colorGray900),
                ),
                Gaps.v20,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorPoint900,
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: colorGray300,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              words.length,
                                  (index) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  '• ${words[index]}',
                                  style: TS.s18w500(colorGray900),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
