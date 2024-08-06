
import 'package:english_quiz/tab/0_tab_book/tab_book_introduction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../const/value/colors.dart';
import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';

class RouteMain extends StatefulWidget {
  const RouteMain({super.key});

  @override
  State<RouteMain> createState() => _RouteMainState();
}

class _RouteMainState extends State<RouteMain> {
  final ValueNotifier<int> vnTabIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vnTabIndex,
      builder: (context, tabIndex, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: colorWhite,
          automaticallyImplyLeading: false,
          title: Text('Chapter Book Quiz',
          style: TS.s20w700(colorPurple900),)

        ),

        backgroundColor: colorWhite,
        body: SafeArea(
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              if (tabIndex == 0) {
                return TabBookIntroduction();
              }
              if (tabIndex == 1) {
               // return Tab1Marketing();
              }
              //return Tab2MyAccount();
            },
            onPageChanged: (value) {
              vnTabIndex.value = value;
            },
          ),
        ),
        bottomNavigationBar: Row(
          children: List.generate(
            3,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    vnTabIndex.value = index;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        index == 0
                            ? 'assets/icons/home.png'
                            : index == 1
                                ? 'assets/icons/video.png'
                                : 'assets/icons/person.png',
                        width: 28, // 이미지 너비 (옵션)
                        height: 28, // 이미지 높이 (옵션)
                        fit: BoxFit.cover,
                        color: vnTabIndex.value == index ? colorPurple500 : colorPoint700, // 이미지 맞춤 방식 (옵션)
                      ),
                      Gaps.v5,
                      Text(
                        index == 0
                            ? 'Book'
                            : index == 1
                                ? 'Study'
                                : 'Profil',
                        style: TextStyle(
                          color: vnTabIndex.value == index ? colorPurple500 : colorPoint700,
                          fontWeight: FontWeight.w400,
                          fontSize: 11, // 글씨 크기 조정
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
