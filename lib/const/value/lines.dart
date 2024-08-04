import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../ui/component/widget_container.dart';

class Lines extends WidgetContainer {
  const Lines.h1(Color coloBorder) : super(height: 1, colorBorder: coloBorder);

  const Lines.h2(Color coloBorder) : super(height: 2, colorBorder: coloBorder);

  const Lines.h3(Color coloBorder) : super(height: 3, colorBorder: coloBorder);

  const Lines.h4(Color coloBorder) : super(height: 4, colorBorder: coloBorder);

}
