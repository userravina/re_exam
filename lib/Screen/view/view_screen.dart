import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_exam/Screen/model/model.dart';
import 'package:re_exam/utils/Database_helper.dart';
import 'package:sizer/sizer.dart';

import '../controller/Covid_controller.dart';

class View_screen extends StatefulWidget {
  const View_screen({super.key});

  @override
  State<View_screen> createState() => _View_screenState();
}

class _View_screenState extends State<View_screen> {
  Covid_controller controller = Get.put(Covid_controller());

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "${controller.dataList[index].countryInfo}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              centerTitle: true,
              backgroundColor: Colors.red.shade700,
              actions: [
                InkWell(
                  onTap: () {
                   Bookmark model = Bookmark(name: controller.dataList[index].country,image:controller.dataList[index].countryInfo!.flag );
                   DB_helper.db_helper.insertDB(d1: model);
                    Get.toNamed('book',arguments: index);
                  },
                  child: Icon(
                    Icons.book_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            body: FutureBuilder(
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 7.h,
                    width: 90.w,
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(color: Colors.red.shade200),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 7.h,
                              width: 10.w,
                              child: Image.network(
                                  "${controller.dataList[index].countryInfo!.flag}")),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${controller.dataList[index].country}',
                            style: GoogleFonts.alice(
                                color: Colors.white, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("id :- ${controller.dataList[index].countryInfo!.id}"),
                ],
              ),
              Row(
                children: [
                  Text("lat :- ${controller.dataList[index].countryInfo!.lat}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "long :- ${controller.dataList[index].countryInfo!.long}"),
                ],
              ),
              Row(
                children: [
                  Text("cases :- ${controller.dataList[index].cases}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "todayCases :- ${controller.dataList[index].todayCases}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "population :- ${controller.dataList[index].population}"),
                ],
              ),
              Row(
                children: [
                  Text("deaths :-${controller.dataList[index].deaths}"),
                ],
              ),
              Row(
                children: [
                  Text("active :-${controller.dataList[index].active}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "oneTestPerPeople :-${controller.dataList[index].oneTestPerPeople}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "casesPerOneMillion :-${controller.dataList[index].casesPerOneMillion}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "oneDeathPerPeople :-${controller.dataList[index].oneDeathPerPeople}"),
                ],
              ),
              Row(
                children: [
                  Text("critical :-${controller.dataList[index].critical}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "todayRecovered :-${controller.dataList[index].todayRecovered}"),
                ],
              ),
              Row(
                children: [
                  Text(
                      "criticalPerOneMillion :-${controller.dataList[index].criticalPerOneMillion}"),
                ],
              ),
            ],
          ),
        );
      },
      future: controller.apiCovid(),
    )));
  }
}
