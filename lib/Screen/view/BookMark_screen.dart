import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../controller/Covid_controller.dart';

class BookMark_screen extends StatefulWidget {
  const BookMark_screen({super.key});

  @override
  State<BookMark_screen> createState() => _BookMark_screenState();
}

class _BookMark_screenState extends State<BookMark_screen> {
  Covid_controller controller = Get.put(Covid_controller());

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "BOOKMARK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            centerTitle: true,
            backgroundColor: Colors.red.shade700,

          ),
          body: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  height: 7.h,
                  width: 10.w,
                  child: Image.network(
                      "${controller.dataList[index].countryInfo!.flag}")),
              const SizedBox(
                width: 20,
              ),
              Text(
                "${controller.list[index].country}",
                style: GoogleFonts.alice(
                    color: Colors.black, fontSize: 15.sp),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
