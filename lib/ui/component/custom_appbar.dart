import 'package:flutter/material.dart';
import '../../const/value/colors.dart';
import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';

class CustomAppbar extends StatelessWidget {
  final String appTitle;

  const CustomAppbar({
    required this.appTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0, // AppBar의 높이
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // 여기에 원하는 동작을 추가하세요
            },
            child: Container(
              width: 24,
              height: 24,
              color: Colors.transparent,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black, // 아이콘 색상을 설정합니다 (원하는 색상으로 변경 가능)
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                appTitle,
                style: TS.s18w600(colorGray900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
