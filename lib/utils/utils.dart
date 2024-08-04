import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';

import '../const/static/global.dart';
import '../const/value/colors.dart';
import '../const/value/gaps.dart';
import '../const/value/text_style.dart';
import '../ui/component/custom_toast.dart';

class Utils {
  /// 토스트 메세지
  static final log = Logger(printer: PrettyPrinter(methodCount: 1));

  static void toast({
    required String desc,
    int duration = 1000,
    bool hasIcon = false,
    ToastGravity toastGravity = ToastGravity.CENTER,
  }) {
    FToast fToast = FToast();
    fToast.init(Global.contextSplash!);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: colorGray900,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              if (hasIcon) {
                return const Row(
                  children: [
                    FaIcon(
                      Icons.check,
                      color: colorWhite,
                      size: 20,
                    ),
                    Gaps.h10,
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          Text(
            desc,
            style: const TS.s14w500(colorWhite),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: toastGravity,
      isDismissable: true,
      toastDuration: Duration(milliseconds: duration),
    );
  }

  static String convertLatLongToString({required double lat, required double long}) {
    return '$long,$lat';
  }


  static final regExpPw = RegExp(r'.{6,}');
}
