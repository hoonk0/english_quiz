
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../const/value/colors.dart';
import '../../const/value/gaps.dart';

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
          automaticallyImplyLeading: false,
          title: tabIndex == 0
              ? Text('홈')
              : tabIndex == 1
              ? Text('마케팅')
              : Text('내 정보'),
          backgroundColor: tabIndex == 2 ? colorBlue500 : colorWhite, // 내 정보일 때 배경 빨간색
        ),

        backgroundColor: colorWhite,
        body: SafeArea(
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              if (tabIndex == 0) {
                //return TabHome();
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
                        color: vnTabIndex.value == index ? colorBlue500 : colorGray900, // 이미지 맞춤 방식 (옵션)
                      ),
                      Gaps.v5,
                      Text(
                        index == 0
                            ? '홈'
                            : index == 1
                                ? '마케팅'
                                : '사용자 정보',
                        style: TextStyle(
                          color: vnTabIndex.value == index ? Color(0xff0072d6) : Color(0xff000000),
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
