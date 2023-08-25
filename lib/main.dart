import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:re_exam/Screen/view/BookMark_screen.dart';
import 'package:re_exam/Screen/view/search_screen.dart';
import 'package:sizer/sizer.dart';

import 'Screen/view/Home_screen.dart';
import 'Screen/view/view_screen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (p0) => Home_screen(),
          'view': (p0) => View_screen(),
          'search': (p0) => Search_screen(),
          'book': (p0) => BookMark_screen(),
        },
      ),
    ),
  );
}
