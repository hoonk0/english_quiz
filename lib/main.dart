import 'package:english_quiz/ui/route/route_splash.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'const/value/colors.dart';
import 'const/value/text_style.dart';

void main() {
  runApp(const EnglishQuiz());
}

class EnglishQuiz extends StatelessWidget {
  const EnglishQuiz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          navigatorObservers: [RouteObserver()],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Pretendard',
            scaffoldBackgroundColor: colorGray50,
            appBarTheme: const AppBarTheme(
              backgroundColor: colorGray50,
              shadowColor: null,
              scrolledUnderElevation: 0,
              foregroundColor: colorGray900,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TS.s18w600(colorGray900),
              iconTheme: IconThemeData(color: colorGray900),
            ),
          ),
          home: const RouteSplash(),
        );
      },
    );
  }
}