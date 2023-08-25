import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_exam/Screen/controller/Covid_controller.dart';
import 'package:re_exam/Screen/model/covid_model.dart';
import 'package:sizer/sizer.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  Covid_controller controller = Get.put(Covid_controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
            child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 20.h,
                  width: 84.1.w,
                  decoration: BoxDecoration(color: Colors.red.shade200),
                  child: Center(
                    child: Text(
                      "Ravina Baldaniya",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Row(
                children: [
                  Icon(Icons.person,color: Colors.red.shade200,),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Profile")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Row(
                children: [
                  Icon(Icons.save,color: Colors.red.shade200,),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Save")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Row(
                children: [
                  Icon(Icons.book_rounded,color: Colors.red.shade200,),
                  SizedBox(
                    width: 10,
                  ),
                  Text("BookMark")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Row(
                children: [
                  Icon(Icons.logout,color: Colors.red.shade200,),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Logout")
                ],
              ),
            ),
          ],
        )),
        appBar: AppBar(
          title: Text(
            "Covid_19",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.red.shade700,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed('search');
              },
              child: Icon(
                Icons.search,
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
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              controller.list = controller.dataList;
              controller.list1 = List.from(controller.list);
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('view', arguments: index);
                    },
                    child: Container(
                      height: 7.h,
                      width: 20.w,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.red.shade200),
                      child: Row(
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
                                color: Colors.white, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
          future: controller.apiCovid(),
        ),
      ),
    );
  }
}
