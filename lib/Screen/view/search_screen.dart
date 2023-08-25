import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_exam/Screen/controller/Covid_controller.dart';
import 'package:sizer/sizer.dart';

class Search_screen extends StatefulWidget {
  const Search_screen({super.key});

  @override
  State<Search_screen> createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {
  Covid_controller controller = Get.put(Covid_controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                color: Colors.red.shade200,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 7.h,
                        child: TextField(style:  TextStyle(color: Colors.white,textBaseline: TextBaseline.ideographic),
                          onChanged: (value) {
                           setState(() {
                             controller.searchfiled(value);
                           });
                          },
                          cursorColor: Colors.white,
                          cursorHeight: 3.h,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                              focusColor: Colors.black12,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                   BorderSide(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                   BorderSide(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: "Search",
                              hintStyle:  TextStyle(
                                  color: Colors.white, letterSpacing: 1)),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                     SizedBox(height: 10),
                    Expanded(
                      child:
                     ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'view',arguments: index);
                              },
                              child: ListTile(
                                leading: SizedBox(width: 50,child: Image.network("${controller.list1[index].countryInfo!.flag}",)),
                                title: Text(controller.list1[index].country!,style: GoogleFonts.alice(color: Colors.white),),
                              ),
                            );
                          },
                          itemCount: controller.list1.length,
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
