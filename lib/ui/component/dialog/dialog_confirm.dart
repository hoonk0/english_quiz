import 'package:flutter/material.dart';

import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';
import '../button_bottom.dart';


class DialogConfirm extends StatelessWidget {
  final String? title;
  final String desc;
  final void Function()? onTap;

  const DialogConfirm({
    this.title,
    required this.desc,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: colorWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: colorWhite,
          border: Border.fromBorderSide(BorderSide(color: colorWhite.withOpacity(0.1))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v26,
            Builder(
              builder: (context) {
                if (title != null) {
                  return Column(
                    children: [
                      Text(
                        title!,
                        style: const TS.s16w700(colorBlack),
                      ),
                      Gaps.v10,
                    ],
                  );
                } else {
                  return Gaps.v6;
                }
              },
            ),
            Text(
              desc,
              style: const TS.s12w500(colorBlack),
              textAlign: TextAlign.center,
            ),
            Gaps.v30,
            ButtonBottom(
              title: '확인',
              onTap: onTap ??
                  () {
                    Navigator.of(context).pop();
                  },
            ),
            Gaps.v30,
          ],
        ),
      ),
    );
  }
}
