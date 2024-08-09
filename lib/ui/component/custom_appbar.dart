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
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  'assets/icons/leftarrow.png',
                  width: 24, // 이미지 너비
                  height: 24, // 이미지 높이
                  fit: BoxFit.cover,

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
