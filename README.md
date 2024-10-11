https://www.figma.com/design/hCTo7j1xzjuoqOof6rySGi/Travellery?node-id=13-1850&node-type=frame&t=PSeAxPTMAVwlpNmO-0


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'custtom_button.dart';

class AmenitiesPage extends StatefulWidget {
  const AmenitiesPage({super.key});

  @override
  State<AmenitiesPage> createState() => _AmenitiesPageState();
}

class _AmenitiesPageState extends State<AmenitiesPage> {
  final PageController _pageController = PageController();
  int currentPage = 1;

  void nextPage() {
    if (currentPage <= 8) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h),
              Row(crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Icon(Icons.keyboard_arrow_left, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    "homestayTitle",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTitleStep(),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepPurple)),
                      child: Center(
                          child: Text(
                        "+  Add Amenities",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.deepPurple),
                      )),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(Icons.add),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.wifi",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(Icons.add),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.airConditioner",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.check_circle_rounded),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(Icons.add),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.fireAlarm",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                  ],
                ),
              ),

              Text("Strings.newAmenities",style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),),
              // SizedBox(
              //   height: 7.h,
              //   width: 50.w,
              //   child: Image.asset(Assets.imagesHomestayProgres,
              //       fit: BoxFit.contain),
              // ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 110.w,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.grey.shade500,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Strings.homeTheater",
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Spacer(),

                      SizedBox(
                        width: 1.w,
                      ),
                      Icon(Icons.check_circle_rounded),
                      SizedBox(
                        width: 3.w,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 110.w,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.grey.shade500,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Strings.masterSuiteBalcony",
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Spacer(),

                      SizedBox(
                        width: 1.w,
                      ),
                      Icon(Icons.check_circle_rounded),
                      SizedBox(
                        width: 3.w,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              CommonButton(
                title: currentPage < 7 ? "nextStep" : "done",
                onPressed: () {
                  // Get.toNamed(Routes.homestayType);
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Strings.stepCount" + " " + currentPage.toString() + "/8",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'custtom_button.dart';

class NewAmenities extends StatefulWidget {
  const NewAmenities({super.key});

  @override
  State<NewAmenities> createState() => _NewAmenitiesState();
}

class _NewAmenitiesState extends State<NewAmenities> {
  int currentPage = 1;
  String? selectedType;

  void nextPage() {
    if (selectedType != null) {
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      "Strings.newAmenities",
                        style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                buildTitleStep(),
                Column(
                  children: [

                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.homeTheater",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.masterSuiteBalcony",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.Amenties3",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.add_circle_outline_sharp),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.Amenities4",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.Amenities5",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],

                ),
                // SizedBox(
                //   height: 7.h,
                //   width: 50.w,
                //   child: Image.asset(Assets.imagesHomestayProgres,
                //       fit: BoxFit.contain),
                // ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: currentPage < 7 ? "Strings.nextStep" : "Strings.done",
                  onPressed: () {

                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Strings.stepCount $currentPage/8",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'custtom_button.dart';

class HouseRulesPage extends StatefulWidget {
  const HouseRulesPage({super.key});

  @override
  State<HouseRulesPage> createState() => _HouseRulesPageState();
}

class _HouseRulesPageState extends State<HouseRulesPage> {
  final PageController _pageController = PageController();
  int currentPage = 1;

  void nextPage() {
    if (currentPage <= 8) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h),
              Row(crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Icon(Icons.keyboard_arrow_left, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    "homestayTitle",
                    style:
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTitleStep(),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepPurple)),
                      child: Center(
                          child: Text(
                            "+  Add Roles",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.deepPurple),
                          )),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(Icons.add),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.noSmoking",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(Icons.add),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.noDrinking",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.check_circle_rounded),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(Icons.add),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.noPet",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                  ],
                ),
              ),

              Text("Strings.newRules",style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),),
              // SizedBox(
              //   height: 7.h,
              //   width: 50.w,
              //   child: Image.asset(Assets.imagesHomestayProgres,
              //       fit: BoxFit.contain),
              // ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 110.w,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.grey.shade500,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Strings.damageToProperty",
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Spacer(),

                      SizedBox(
                        width: 1.w,
                      ),
                      Icon(Icons.check_circle_rounded),
                      SizedBox(
                        width: 3.w,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              CommonButton(
                title: currentPage < 7 ? "nextStep" : "done",
                onPressed: () {
                  // Get.toNamed(Routes.homestayType);
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Strings.stepCount" + " " + currentPage.toString() + "/8",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'custtom_button.dart';

class NewRulesPage extends StatefulWidget {
  const NewRulesPage({super.key});

  @override
  State<NewRulesPage> createState() => _NewRulesPageState();
}

class _NewRulesPageState extends State<NewRulesPage> {
  int currentPage = 1;
  String? selectedType;

  void nextPage() {
    if (selectedType != null) {
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      "Strings.NewRules",
                      style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                buildTitleStep(),
                Column(
                  children: [

                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.damageToProperty",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.rules2",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.rules3",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.add_circle_outline_sharp),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.rules4",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.rules4",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Strings.rules5",
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                // SizedBox(
                //   height: 7.h,
                //   width: 50.w,
                //   child: Image.asset(Assets.imagesHomestayProgres,
                //       fit: BoxFit.contain),
                // ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: currentPage < 7 ? "Strings.nextStep" : "Strings.done",
                  onPressed: () {

                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Strings.stepCount $currentPage/8",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

