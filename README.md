# re_exam

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
<p>
  <img src="https://github.com/userravina/re_exam/assets/120082785/81bc1725-fa25-4a71-8bd8-834980bb89b4" height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/3938dad3-351a-4d43-99ee-a07457df9043"  height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/5c989356-429c-42cb-af53-b846c047d09f" height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/f047ff5f-f02b-4762-9b23-c0c8345ea5d2"  height="50%" width="30%">
</p>
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/calculator_controller.dart';

class MoneyCashCounter extends StatefulWidget {
  @override
  _MoneyCashCounterState createState() => _MoneyCashCounterState();
}

class _MoneyCashCounterState extends State<MoneyCashCounter> {
  Map<int, int> notes = {
    500: 0,
    200: 0,
    100: 0,
    50: 0,
    20: 0,
    10: 0,
    5: 0,
    2: 0,
    1: 0,
  };

  int total = 0;

  void calculateTotal() {
    int newTotal = 0;
    notes.forEach((denomination, count) {
      newTotal += denomination * count;
    });
    setState(() {
      total = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    Calculator_Controller controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          "Money Cash Counter",
          style: TextStyle(
            color: controller.dark.value ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              total = 0;
              notes.clear();
            },
            child: Image.asset(
              "assets/images/tools/moneyreset.png",
              color: controller.dark.value ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 8.5.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Image.asset("assets/images/tools/moneyicon.png"),
                    SizedBox(width: 3.w,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [
                      Row(
                        children: [
                          Text("Notes Total:",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 5.w,),
                          Text("80",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Grand Total:",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 5.w,),
                          Text("${total}",style: TextStyle(color: Colors.white),),
                        ],
                      ),

                    ],)
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 71.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.7,
                      color: controller.dark.value
                          ? Colors.grey.shade600
                          : Colors.grey.shade300),
                ),
                child: Column(children: [
                  Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight:
                            Radius.circular(10)),
                        color: controller.dark.value
                            ? Color(0xff1C242C)
                            : Colors.grey.shade300),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "(₹) Notes",
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "Pcs",
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Spacer(),

                        Text(
                          "Total",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        int denomination = notes.keys.elementAt(index);
                        return Container(

                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.w,
                              ),
                              Container(
                                width: Get.width,
                                child: Row(
                                  children: [
                                    Expanded(flex: 2,child: Align(
                                        alignment: Alignment.centerRight,

                                        child: Text('$denomination'))),
                                    Expanded(flex: 1,child: Center(child: Text("x"))),
                                    Expanded(flex: 3,
                                      child: SizedBox(
                                        height: 4.h,
                                        width: 25.w,
                                        child: Center(
                                          child: TextField(
                                            style: TextStyle(fontSize: 12),
                                            cursorHeight: 2.h,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              setState(() {
                                                notes[denomination] = int.tryParse(value) ?? 0;
                                                calculateTotal();
                                              });
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                  color: controller.dark.value
                                                      ? Colors.grey.shade200
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Expanded(flex: 1,child: Center(child: Text("="))),

                                    Expanded(flex: 3,child: Center(child: Text("${notes[denomination]! * denomination}"))),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../controller/calculator_controller.dart';
import 'download_sip_screen.dart';

class SIP_Screen extends StatefulWidget {
  const SIP_Screen({super.key});

  @override
  State<SIP_Screen> createState() => _SIP_ScreenState();
}

class _SIP_ScreenState extends State<SIP_Screen> {
  Calculator_Controller controller = Get.find();
  TextEditingController investmentController = TextEditingController();
  TextEditingController returnRateController = TextEditingController();
  TextEditingController luminvestmentController = TextEditingController();
  TextEditingController lumreturnRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          title: Text(
            "SIP Calculator",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                returnRateController.text.isEmpty?"":Get.to(Download_SIP_Screen(
                  totalInvestedAmount: controller
                      .totalInvestedAmount.value,
                  estimatedReturn: controller
                      .estimatedReturn.value,
                  totalValue:
                  controller.totalValue.value,
                  rateValue: double.parse(
                      returnRateController.text),
                  totalyear: double.parse(
                      controller.twonumber.value),
                  amount: double.parse(
                      investmentController.text),
                ));
              },
              child: Image.asset(
                "assets/images/tools/sipdf.png",
                color: controller.dark.value ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleSwitch(
                      minWidth: 50.w,
                      minHeight: 45.0,
                      initialLabelIndex: controller.indexsip.value,
                      cornerRadius: 10,
                      activeFgColor: Colors.white,
                      inactiveBgColor: controller.dark.value
                          ? Colors.grey.shade400
                          : Colors.grey.shade300,
                      inactiveFgColor: Colors.black,
                      totalSwitches: 2,
                      labels: ["SIP", "Lumpsum"],
                      customTextStyles: [],
                      activeBgColors: [
                        [
                          controller.dark.value
                              ? Colors.grey.shade300
                              : Colors.grey.shade600
                        ],
                        [
                          controller.dark.value
                              ? Colors.grey.shade300
                              : Colors.grey.shade600
                        ]
                      ],
                      onToggle: (index) {
                        print('switched to: $index');
                        controller.indexsip.value = index!;
                        print('switched to2: ${controller.indexsip.value}');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(() => controller.indexsip.value == 0
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Monthly Investment Amount (Rs.)",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 6.77.h,
                              child: TextField(
                                controller: investmentController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide(color: Colors.yellow),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: controller.dark.value
                                            ? Colors.grey.shade200
                                            : Colors.black),
                                  ),
                                  hintText: 'Enter your Amount',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Expected return rate (per year)",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 6.77.h,
                              child: TextField(
                                controller: returnRateController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: controller.dark.value
                                              ? Colors.grey.shade200
                                              : Colors.black),
                                    ),
                                    hintText: 'Enter your rate',
                                    suffixIcon: Icon(Icons.percent)),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Time Period",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 3.5.h,
                                  width: 14.w,
                                  decoration: BoxDecoration(
                                      color: controller.dark.value
                                          ? Color(0)
                                          : Colors.grey.shade300,
                                      border: Border.all(
                                          color: controller.dark.value
                                              ? Colors.grey
                                              : Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Obx(() => Text(
                                        "${controller.twonumber.value} Yr")),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: 94.w,
                              child: Slider(
                                activeColor: Colors.blue,
                                value: controller.sipSliderValue.value,
                                min: 1,
                                max: 100,
                                label: controller.sipSliderValue.value
                                    .toInt()
                                    .toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    controller.sipSliderValue.value = value;
                                    print(controller.sipSliderValue.value);
                                    controller.twonumber.value = controller
                                        .sipSliderValue.value
                                        .toStringAsFixed(0);
                                    print(controller.twonumber.value);
                                    controller.sipSliderValue.value =
                                        double.parse(
                                            controller.twonumber.value);
                                    controller.value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      investmentController.clear();
                                      returnRateController.clear();
                                      controller.sipSliderValue.value = 1;
                                      controller.twonumber.value = '';
                                      controller.showsiptotal.value = false;
                                    },
                                    child: Container(
                                      height: 6.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          color: controller.dark.value
                                              ? Color(0xff202C35)
                                              : Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Clear",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      double investmentAmount = double.tryParse(
                                              investmentController.text) ??
                                          0.0;
                                      double returnRate = double.tryParse(
                                              returnRateController.text) ??
                                          0.0;
                                      int timePeriod = int.tryParse(
                                              controller.twonumber.value) ??
                                          0;
                                      controller.totalValue.value =
                                          calculateSIP(investmentAmount,
                                              returnRate, timePeriod);
                                      int totalMonths = int.parse(
                                              controller.twonumber.value) *
                                          12;
                                      print("totalMonths${totalMonths}");
                                      controller.totalInvestedAmount.value =
                                          investmentAmount * totalMonths;
                                      print(
                                          "totalInvestedAmount${controller.totalInvestedAmount.value}");
                                      controller.showsiptotal.value = true;
                                      print(
                                          "totalvalue :- ${controller.totalValue.value}");
                                      controller.estimatedReturn.value =
                                          controller.totalValue.value -
                                              controller
                                                  .totalInvestedAmount.value;
                                      print(
                                          "estimatedReturn :- ${controller.estimatedReturn.value}");
                                    },
                                    child: Container(
                                      height: 6.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xff4777E3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Calculate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            if (controller.showsiptotal.value)
                              Column(
                                children: [
                                  Container(
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.7,
                                          color: controller.dark.value
                                              ? Colors.grey.shade600
                                              : Colors.grey.shade300),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                              color: controller.dark.value
                                                  ? Color(0xff1C242C)
                                                  : Colors.grey.shade300),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Text(
                                                "Summery",
                                                style: TextStyle(fontSize: 17),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text("Invested amount",
                                                style: TextStyle(fontSize: 15)),
                                            Spacer(),
                                            Obx(() => Text(
                                                "₹${controller.totalInvestedAmount.value}",
                                                style:
                                                    TextStyle(fontSize: 15))),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Container(
                                          height: 1,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            color: controller.dark.value
                                                ? Colors.grey.shade600
                                                : Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text("Est. return",
                                                style: TextStyle(fontSize: 15)),
                                            Spacer(),
                                            Obx(() => Text(
                                                "₹${controller.estimatedReturn.value.toStringAsFixed(2)}",
                                                style:
                                                    TextStyle(fontSize: 15))),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Container(
                                          height: 1,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            color: controller.dark.value
                                                ? Colors.grey.shade600
                                                : Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text("Total value",
                                                style: TextStyle(fontSize: 15)),
                                            Spacer(),
                                            Obx(() => Text(
                                                "₹${controller.totalValue.value.toStringAsFixed(2)}",
                                                style:
                                                    TextStyle(fontSize: 15))),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            returnRateController.text.isEmpty?"":Get.to(Download_SIP_Screen(
                                              totalInvestedAmount: controller
                                                  .totalInvestedAmount.value,
                                              estimatedReturn: controller
                                                  .estimatedReturn.value,
                                              totalValue:
                                              controller.totalValue.value,
                                              rateValue: double.parse(
                                                  returnRateController.text),
                                              totalyear: double.parse(
                                                  controller.twonumber.value),
                                              amount: double.parse(
                                                  investmentController.text),
                                            ));
                                          },
                                          child: Container(
                                            height: 6.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                                color: controller.dark.value
                                                    ? Color(0xff202C35)
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "View Detail Chart",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(Download_SIP_Screen(
                                              totalInvestedAmount: controller
                                                  .totalInvestedAmount.value,
                                              estimatedReturn: controller
                                                  .estimatedReturn.value,
                                              totalValue:
                                                  controller.totalValue.value,
                                              rateValue: double.parse(
                                                  returnRateController.text),
                                              totalyear: double.parse(
                                                  controller.twonumber.value),
                                              amount: double.parse(
                                                  investmentController.text),
                                            ));
                                          },
                                          child: Container(
                                            height: 6.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                                color: Color(0xff4777E3),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "Download",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                ],
                              )
                            else
                              Column(
                                children: [],
                              )
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Monthly Investment Amount (Rs.)",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 6.77.h,
                              child: TextField(
                                controller: luminvestmentController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide(color: Colors.yellow),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: controller.dark.value
                                            ? Colors.grey.shade200
                                            : Colors.black),
                                  ),
                                  hintText: 'Enter your Amount',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Expected return rate (per year)",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 6.77.h,
                              child: TextField(
                                controller: lumreturnRateController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: controller.dark.value
                                              ? Colors.grey.shade200
                                              : Colors.black),
                                    ),
                                    hintText: 'Enter your rate',
                                    suffixIcon: Icon(Icons.percent)),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Time Period",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 3.5.h,
                                  width: 14.w,
                                  decoration: BoxDecoration(
                                      color: controller.dark.value
                                          ? Color(0)
                                          : Colors.grey.shade300,
                                      border: Border.all(
                                          color: controller.dark.value
                                              ? Colors.grey
                                              : Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Obx(() => Text(
                                        "${controller.twonumber2.value} Yr")),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: 94.w,
                              child: Slider(
                                activeColor: Colors.blue,
                                value: controller.lumSliderValue.value,
                                min: 0,
                                max: 100,
                                label: controller.lumSliderValue.value
                                    .toInt()
                                    .toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    controller.lumSliderValue.value = value;
                                    print(controller.lumSliderValue.value);
                                    controller.twonumber2.value = controller
                                        .lumSliderValue.value
                                        .toStringAsFixed(0);
                                    print(controller.twonumber2.value);
                                    controller.lumSliderValue.value =
                                        double.parse(
                                            controller.twonumber2.value);
                                    controller.value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      controller.twonumber2.value = "";
                                      controller.lumSliderValue.value = 1;
                                      controller.lumestimatedReturn.value = 0.0;
                                      controller.lumtotalValue.value = 0.0;
                                      lumreturnRateController.clear();
                                      luminvestmentController.clear();
                                      controller.showlumtotal.value = false;
                                    },
                                    child: Container(
                                      height: 6.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          color: controller.dark.value
                                              ? Color(0xff202C35)
                                              : Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Clear",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      double lumpSumAmount = double.parse(
                                          luminvestmentController.text);
                                      double returnRate = double.parse(
                                          lumreturnRateController.text);
                                      int years = int.parse(
                                          controller.twonumber2.value);

                                      double totalValue = calculateLumpSumTotal(
                                          lumpSumAmount, returnRate, years);

                                      double estimatedReturn =
                                          totalValue - lumpSumAmount;

                                      setState(() {
                                        controller.lumtotalValue.value =
                                            totalValue;
                                        controller.lumestimatedReturn.value =
                                            estimatedReturn;
                                        controller.showlumtotal.value = true;
                                      });
                                      controller.showlumtotal.value = true;
                                    },
                                    child: Container(
                                      height: 6.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xff4777E3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Calculate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            controller.showlumtotal.value
                                ? Column(
                                    children: [
                                      Container(
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 0.7,
                                              color: controller.dark.value
                                                  ? Colors.grey.shade600
                                                  : Colors.grey.shade300),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 6.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  color: controller.dark.value
                                                      ? Color(0xff1C242C)
                                                      : Colors.grey.shade300),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    "Summery",
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text("Invested amount",
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                Spacer(),
                                                Text(
                                                    "₹${luminvestmentController.text}",
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.5.h,
                                            ),
                                            Container(
                                              height: 1,
                                              width: 90.w,
                                              decoration: BoxDecoration(
                                                color: controller.dark.value
                                                    ? Colors.grey.shade600
                                                    : Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text("Est. return",
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                Spacer(),
                                                Text(
                                                    "₹${controller.lumestimatedReturn.toStringAsFixed(2)}",
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.5.h,
                                            ),
                                            Container(
                                              height: 1,
                                              width: 90.w,
                                              decoration: BoxDecoration(
                                                color: controller.dark.value
                                                    ? Colors.grey.shade600
                                                    : Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text("Total value",
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                Spacer(),
                                                Text(
                                                    "₹${controller.lumtotalValue.toStringAsFixed(2)}",
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                lumreturnRateController.text.isEmpty?"":Get.to(Download_SIP_Screen(
                                                  totalInvestedAmount: double.parse(luminvestmentController.text),
                                                  estimatedReturn: controller.lumestimatedReturn.value,
                                                  totalValue: controller.lumtotalValue.value,
                                                  rateValue: double.parse(lumreturnRateController.text),
                                                  totalyear: double.parse(
                                                      controller.twonumber2.value),
                                                  amount: double.parse(
                                                      luminvestmentController.text),
                                                ));
                                              },
                                              child: Container(
                                                height: 6.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                    color: controller.dark.value
                                                        ? Color(0xff202C35)
                                                        : Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "View Detail Chart",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                lumreturnRateController.text.isEmpty?"":Get.to(Download_SIP_Screen(
                                                  totalInvestedAmount: double.parse(luminvestmentController.text),
                                                  estimatedReturn: controller.lumestimatedReturn.value,
                                                  totalValue: controller.lumtotalValue.value,
                                                  rateValue: double.parse(lumreturnRateController.text),
                                                  totalyear: double.parse(controller.twonumber2.value),
                                                  amount: double.parse(luminvestmentController.text),
                                                ));
                                              },
                                              child: Container(
                                                height: 6.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff4777E3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "Download",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [],
                                  )
                          ],
                        ),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateSIP(
      double monthlyInvestment, double expectedReturnRate, int timePeriod) {
    double monthlyRate = expectedReturnRate / 12 / 100;
    int numberOfMonths = timePeriod * 12;
    double futureValue = 0;

    for (int i = 0; i < numberOfMonths; i++) {
      futureValue = (futureValue + monthlyInvestment) * (1 + monthlyRate);
    }

    return futureValue;
  }

  double calculateLumpSumTotal(
      double lumpSumAmount, double returnRate, int years) {
    // Convert return rate to decimal
    double rate = returnRate / 100;

    // Calculate total value using compound interest formula
    double totalValue = lumpSumAmount * pow((1 + rate), years);

    return totalValue;
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../class/language.dart';
import '../model/histary_model.dart';

class Calculator_Controller extends GetxController {
  RxBool dark = false.obs;
  RxBool buttonEfact = false.obs;
  RxString display = "".obs;
  RxString updatevalue = "".obs;
  RxString displayEnglish = "".obs;
  RxString displayOprater = "".obs;
  RxString prevOpertor = "".obs;
  RxString prevOpertor2 = "".obs;
  RxString m = "".obs;
  RxList<String> value = <String>[].obs;
  RxList operator = [].obs;
  RxList grandTotal = [].obs;
  RxDouble result = 0.0.obs;
  RxDouble memory = 0.0.obs;
  RxDouble currentValue = 0.0.obs;
  RxDouble percentage = 0.0.obs;
  RxDouble currentSliderValue = 2.0.obs;
  RxDouble sipSliderValue = 14.0.obs;
  RxDouble lumSliderValue = 14.0.obs;
  RxDouble gstAmount = 0.0.obs;
  RxList<String> histary = <String>[].obs;
  RxString IGST = "".obs;
  RxDouble SGST = 0.0.obs;
  RxDouble CGST = 0.0.obs;
  RxDouble lumtotalValue = 0.0.obs;
  RxDouble lumestimatedReturn = 0.0.obs;
  RxBool modetrue = false.obs;
  String selectedValue = "Option 1";
  late SharedPreferences _prefs;
  RxBool isLoopingCurrentItem = false.obs;
  RxBool isVibrationEnabled = false.obs;
  RxInt indexsip = 0.obs;
  RxString twonumber = "".obs;
  RxString twonumber2 = "".obs;
  RxBool showsiptotal = false.obs;
  RxBool showlumtotal = false.obs;
  RxDouble totalValue = 0.0.obs;
  RxDouble totalInvestedAmount = 0.0.obs;
  RxDouble estimatedReturn = 0.0.obs;

  RxList<Tools_Model> mytools = <Tools_Model>[
    Tools_Model(name: "SIP", img: "assets/images/tools/sip.png"),
    Tools_Model(name: "Currency Con..", img: "assets/images/tools/currency.png"),
    Tools_Model(name: "Age Calc", img: "assets/images/tools/agecal.png"),
    Tools_Model(name: "Money Cash C..", img: "assets/images/tools/moneyc.png"),
  ].obs;

  RxList<Tools_Model> unitols = <Tools_Model>[
    Tools_Model(name: "Area", img: "assets/images/tools/area.png"),
    Tools_Model(name: "Length", img: "assets/images/tools/length.png"),
    Tools_Model(name: "Weigth", img: "assets/images/tools/weigth.png"),
    Tools_Model(name: "Time", img: "assets/images/tools/time.png"),
    Tools_Model(name: "Temperature", img: "assets/images/tools/tem.png"),
    Tools_Model(name: "Speed", img: "assets/images/tools/speed.png"),
    Tools_Model(name: "Volume", img: "assets/images/tools/volum.png"),
    Tools_Model(name: "Energy", img: "assets/images/tools/energy.png"),
    Tools_Model(name: "Fuel", img: "assets/images/tools/fuel.png"),
    Tools_Model(name: "Pressure", img: "assets/images/tools/press.png"),
    Tools_Model(name: "Storage", img: "assets/images/tools/store.png"),
  ].obs;
  final player = AudioPlayer();

  RxList<Language_Calss> lang = <Language_Calss>[].obs;

  void toggleTheme(value) {
    dark.value = value;
    updateTheme();
  }

  void loadSound() async {
    player.setAsset('assets/sounds/clickeffect.mp3');
  }

  void playSound() async {
    if (player.playing) {
      print("play sound ==============================");
      player.stop();
    }
    player.setAsset('assets/sounds/clickeffect.mp3');
    player.load();
    player.play();
    print("play sound ==============================");
  }

  void stopSound(value) {
    isLoopingCurrentItem.value = value;
    updateTheme();
  }

  void vibrate(value) async {
    isVibrationEnabled.value = value;
    updateTheme();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    lang.value = <Language_Calss>[
      Language_Calss(
          id: 1,
          flag: "🇮🇳",
          name: "ગુજરાતી",
          languageCode: "gu",
          isselect: false),
      Language_Calss(
          id: 2,
          flag: "🇺🇸",
          name: "English",
          languageCode: "en",
          isselect: false),
      Language_Calss(
          id: 3,
          flag: "🇸🇦",
          name: "اَلْعَرَبِيَّةُ",
          languageCode: "ar",
          isselect: false),
      Language_Calss(
          id: 4,
          flag: "🇮🇳",
          name: "हिंदी",
          languageCode: "hi",
          isselect: false)
    ];
  }

  void updateTheme() {
    Get.changeThemeMode(dark.value ? ThemeMode.dark : ThemeMode.light);
  }

  void buttonEfect() {
    buttonEfact.value = true;
    update();
  }

  // store histary value in sharedpreference

  // Method to save the value list to shared preferences
  saveValueListToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedList = value.map((item) => json.encode(item)).toList();
    await prefs.setStringList('valueList', encodedList);
  }

  // Method to load the value list from shared preferences

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveSelectedValue(String value) async {
    await _prefs.setString('selectedValue', value);
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart' as a;
import 'package:pie_chart/pie_chart.dart';
import '../../../controller/calculator_controller.dart';

class Download_SIP_Screen extends StatefulWidget {
  final double totalInvestedAmount;
  final double estimatedReturn;
  final double totalValue;
  final double totalyear;
  final double amount;
  final double rateValue;

  const Download_SIP_Screen({
    Key? key,
    required this.totalInvestedAmount,
    required this.estimatedReturn,
    required this.totalValue,
    required this.rateValue,
    required this.totalyear,
    required this.amount,
  }) : super(key: key);

  @override
  State<Download_SIP_Screen> createState() => _Download_SIP_ScreenState();
}

class _Download_SIP_ScreenState extends State<Download_SIP_Screen> {
  Calculator_Controller controller = Get.find();
  List<double> yearWiseValues = [];

  @override
  void initState() {
    super.initState();
    calculateYearWiseValues();
  }

  void calculateYearWiseValues() {
    double totalInvestment = 0;

    double monthlyRate = widget.rateValue / 100 / 12;
    for (int i = 1; i <= widget.totalyear; i++) {
      double futureValue = totalInvestment * (1 + monthlyRate) +
          (widget.amount * 12) *
              (monthlyRate * (pow(1 + monthlyRate, 12 * i) - 1) / monthlyRate);

      yearWiseValues.add(futureValue);
      totalInvestment = futureValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalInvestedAmount = widget.totalInvestedAmount;
    double estimatedReturn = widget.estimatedReturn;
    double totalValue = widget.totalValue;
    double totalyear = widget.totalyear;

    Map<String, double> dataMap = {
      "InvestedAmount": totalInvestedAmount,
      "estimatedReturn": estimatedReturn,
    };
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          title: Text(
            "SIP Calculator",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          actions: [
            Image.asset(
              "assets/images/tools/sipdf.png",
              color: controller.dark.value ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: 3.w,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: controller.dark.value
                            ? Colors.grey.shade600
                            : Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: controller.dark.value
                                ? Color(0xff1C242C)
                                : Colors.grey.shade300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Amount Invested vs Returns",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: controller.dark.value
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PieChart(
                            dataMap: dataMap,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 40,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            colorList: [Colors.pink, Colors.blue],
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 25,
                            legendOptions: LegendOptions(
                              showLegendsInRow: true,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: false,
                              decimalPlaces: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 3.5.h,
                            width: 80.w,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Center(
                                child: Text(
                              "Expected Maturity Amount :Rs ${estimatedReturn.toStringAsFixed(2)} ",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 43.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: controller.dark.value
                            ? Colors.grey.shade600
                            : Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: controller.dark.value
                                ? Color(0xff1C242C)
                                : Colors.grey.shade300),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Duration",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: controller.dark.value
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "SIP Amount (₹)",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: controller.dark.value
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "Future Value (₹)",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: controller.dark.value
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: totalyear.toInt(),
                          itemBuilder: (context, index) {
                            int year = index + 1;
                            return Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text('Year $year'),
                                    Spacer(),
                                    Text("${widget.amount.toStringAsFixed(0)}"),
                                    Spacer(),
                                    Text(
                                      '${yearWiseValues[index].toStringAsFixed(0)}',
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../controller/calculator_controller.dart';

class SIP_Screen extends StatefulWidget {
  const SIP_Screen({super.key});

  @override
  State<SIP_Screen> createState() => _SIP_ScreenState();
}

class _SIP_ScreenState extends State<SIP_Screen> {
  Calculator_Controller controller = Get.find();
  TextEditingController investmentController = TextEditingController();
  TextEditingController returnRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          title: Text(
            "SIP Calculator",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          actions: [
            Image.asset(
              "assets/images/tools/sipdf.png",
              color: controller.dark.value ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: 3.w,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleSwitch(
                      minWidth: 50.w,
                      minHeight: 45.0,
                      initialLabelIndex: controller.indexsip.value,
                      cornerRadius: 10,
                      activeFgColor: Colors.white,
                      inactiveBgColor: controller.dark.value?Colors.grey.shade400:Colors.grey.shade200,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      labels: ["SIP", "Lumpsum"],
                      customTextStyles: [
                        TextStyle(
                          color: Colors.black,
                        ),
                        TextStyle(
                          color: Colors.black,
                        )
                      ],
                      activeBgColors: [
                        [controller.dark.value?Colors.grey.shade300:Colors.grey.shade300],
                        [controller.dark.value?Colors.grey.shade300:Colors.grey.shade300]
                      ],
                      animate: true,
                      // with just animate set to true, default curve = Curves.easeIn
                      curve: Curves.bounceInOut,
                      // animate must be set to true when using custom curve
                      onToggle: (index) {
                        print('switched to: $index');
                        controller.indexsip.value = index!;
                        print('switched to2: ${controller.indexsip.value}');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(() => controller.indexsip.value == 0? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Monthly Investment Amount (Rs.)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          controller: investmentController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: controller.dark.value
                                      ? Colors.grey.shade200
                                      : Colors.black),
                            ),
                            hintText: 'Enter your Amount',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Expected return rate (per year)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          controller: returnRateController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: controller.dark.value
                                        ? Colors.grey.shade200
                                        : Colors.black),
                              ),
                              hintText: 'Enter your rate',
                              suffixIcon: Icon(Icons.percent)),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Time Period",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 3.5.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Color(0)
                                    : Colors.grey.shade300,
                                border: Border.all(
                                    color: controller.dark.value
                                        ? Colors.grey
                                        : Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Obx(() => Text("${controller.twonumber.value} Yr")),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 94.w,
                        child: Slider(
                          activeColor: Colors.blue,
                          value: controller.sipSliderValue.value,
                          min: 0,
                          max: 100,
                          label: controller.sipSliderValue.value.toInt().toString(),
                          onChanged: (double value) {
                            setState(() {
                              controller.sipSliderValue.value = value;
                              controller.twonumber.value = controller.sipSliderValue.value.toStringAsFixed(0);
                              controller.sipSliderValue.value =
                                  double.parse(controller.twonumber.value);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  investmentController.clear();
                                  returnRateController.clear();
                                  controller.sipSliderValue.value = 0.0;
                                  controller.twonumber.value = '';
                                });
                              },
                              child: Container(
                                height: 6.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    color: controller.dark.value
                                        ? Color(0xff202C35)
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                double investmentAmount = double.tryParse(investmentController.text) ?? 0.0;
                                double returnRate = double.tryParse(returnRateController.text) ?? 0.0;
                                int timePeriod = int.tryParse(controller.twonumber.value) ?? 0;

                                double totalValue = calculateSIP(investmentAmount, returnRate, timePeriod);

                                // Do something with the calculated totalValue
                              },
                              child: Container(
                                height: 6.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    color: Color(0xff4777E3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.7,
                              color: controller.dark.value
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: controller.dark.value
                                      ? Color(0xff1C242C)
                                      : Colors.grey.shade300),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "Summary",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Invested amount",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Est. return", style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Total value", style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: controller.dark.value
                                      ? Color(0xff202C35)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "View Detail Chart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Download",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                    ],
                  ),
                ):SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Monthly Investment Amount (Rs.)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: controller.dark.value
                                      ? Colors.grey.shade200
                                      : Colors.black),
                            ),
                            hintText: 'Enter your Amount',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Expected return rate (per year)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: controller.dark.value
                                        ? Colors.grey.shade200
                                        : Colors.black),
                              ),
                              hintText: 'Enter your rate',
                              suffixIcon: Icon(Icons.percent)),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Time Period",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 3.5.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Color(0)
                                    : Colors.grey.shade300,
                                border: Border.all(
                                    color: controller.dark.value
                                        ? Colors.grey
                                        : Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Obx(() => Text(
                                  "${controller.twonumber2.value} Yr")),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 94.w,
                        child: Slider(
                          activeColor: Colors.blue,
                          value: controller.lumSliderValue.value,
                          min: 0,
                          max: 100,
                          label: controller.lumSliderValue.value
                              .toInt()
                              .toString(),
                          onChanged: (double value) {
                            setState(() {
                              controller.lumSliderValue.value = value;
                              print(controller.lumSliderValue.value);
                              controller.twonumber2.value = controller.lumSliderValue.value
                                  .toStringAsFixed(0);
                              print(controller.twonumber2.value);
                              controller.lumSliderValue.value =
                                  double.parse(controller.twonumber2.value);
                              controller.value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: controller.dark.value
                                      ? Color(0xff202C35)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Calcutor",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.7,
                              color: controller.dark.value
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: controller.dark.value
                                      ? Color(0xff1C242C)
                                      : Colors.grey.shade300),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "Summery",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Invested amount",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Est. return",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Total value",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: controller.dark.value
                                      ? Color(0xff202C35)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "View Detail Chart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Download",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Calculate SIP
  double calculateSIP(double monthlyInvestment, double expectedReturnRate, int timePeriod) {
    double monthlyRate = expectedReturnRate / 12 / 100;
    int numberOfMonths = timePeriod * 12;
    double futureValue = 0;

    for (int i = 0; i < numberOfMonths; i++) {
      futureValue = (futureValue + monthlyInvestment) * (1 + monthlyRate);
    }

    return futureValue;
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../controller/calculator_controller.dart';

class SIP_Screen extends StatefulWidget {
  const SIP_Screen({super.key});

  @override
  State<SIP_Screen> createState() => _SIP_ScreenState();
}

class _SIP_ScreenState extends State<SIP_Screen> {
  Calculator_Controller controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          title: Text(
            "SIP Calculator",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          actions: [
            Image.asset(
              "assets/images/tools/sipdf.png",
              color: controller.dark.value ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: 3.w,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleSwitch(
                      minWidth: 50.w,
                      minHeight: 45.0,
                      initialLabelIndex: controller.indexsip.value,
                      cornerRadius: 10,
                      activeFgColor: Colors.white,
                      inactiveBgColor: controller.dark.value?Colors.grey.shade400:Colors.grey.shade200,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      labels: ["SIP", "Lumpsum"],
                      customTextStyles: [
                        TextStyle(
                          color: Colors.black,
                        ),
                        TextStyle(
                          color: Colors.black,
                        )
                      ],
                      activeBgColors: [
                        [controller.dark.value?Colors.grey.shade300:Colors.grey.shade300],
                        [controller.dark.value?Colors.grey.shade300:Colors.grey.shade300]
                      ],
                      animate: true,
                      // with just animate set to true, default curve = Curves.easeIn
                      curve: Curves.bounceInOut,
                      // animate must be set to true when using custom curve
                      onToggle: (index) {
                        print('switched to: $index');
                        controller.indexsip.value = index!;
                        print('switched to2: ${controller.indexsip.value}');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(() => controller.indexsip.value == 0? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Monthly Investment Amount (Rs.)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: controller.dark.value
                                      ? Colors.grey.shade200
                                      : Colors.black),
                            ),
                            hintText: 'Enter your Amount',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Expected return rate (per year)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: controller.dark.value
                                        ? Colors.grey.shade200
                                        : Colors.black),
                              ),
                              hintText: 'Enter your rate',
                              suffixIcon: Icon(Icons.percent)),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Time Period",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 3.5.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Color(0)
                                    : Colors.grey.shade300,
                                border: Border.all(
                                    color: controller.dark.value
                                        ? Colors.grey
                                        : Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Obx(() => Text(
                                  "${controller.twonumber.value} Yr")),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 94.w,
                        child: Slider(
                          activeColor: Colors.blue,
                          value: controller.sipSliderValue.value,
                          min: 0,
                          max: 100,
                          label: controller.sipSliderValue.value
                              .toInt()
                              .toString(),
                          onChanged: (double value) {
                            setState(() {
                              controller.sipSliderValue.value = value;
                              print(controller.sipSliderValue.value);
                              controller.twonumber.value = controller.sipSliderValue.value
                                  .toStringAsFixed(0);
                              print(controller.twonumber.value);
                              controller.sipSliderValue.value =
                                  double.parse(controller.twonumber.value);
                              controller.value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: controller.dark.value
                                      ? Color(0xff202C35)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Calcutor",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.7,
                              color: controller.dark.value
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: controller.dark.value
                                      ? Color(0xff1C242C)
                                      : Colors.grey.shade300),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "Summery",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Invested amount",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Est. return",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Total value",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: controller.dark.value
                                      ? Color(0xff202C35)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "View Detail Chart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Download",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                    ],
                  ),
                ):SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Monthly Investment Amount (Rs.)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: controller.dark.value
                                      ? Colors.grey.shade200
                                      : Colors.black),
                            ),
                            hintText: 'Enter your Amount',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Expected return rate (per year)",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.77.h,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: controller.dark.value
                                        ? Colors.grey.shade200
                                        : Colors.black),
                              ),
                              hintText: 'Enter your rate',
                              suffixIcon: Icon(Icons.percent)),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Time Period",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 3.5.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Color(0)
                                    : Colors.grey.shade300,
                                border: Border.all(
                                    color: controller.dark.value
                                        ? Colors.grey
                                        : Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Obx(() => Text(
                                  "${controller.twonumber2.value} Yr")),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 94.w,
                        child: Slider(
                          activeColor: Colors.blue,
                          value: controller.lumSliderValue.value,
                          min: 0,
                          max: 100,
                          label: controller.lumSliderValue.value
                              .toInt()
                              .toString(),
                          onChanged: (double value) {
                            setState(() {
                              controller.lumSliderValue.value = value;
                              print(controller.lumSliderValue.value);
                              controller.twonumber2.value = controller.lumSliderValue.value
                                  .toStringAsFixed(0);
                              print(controller.twonumber2.value);
                              controller.lumSliderValue.value =
                                  double.parse(controller.twonumber2.value);
                              controller.value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: controller.dark.value
                                      ? Color(0xff202C35)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Calcutor",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.7,
                              color: controller.dark.value
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: controller.dark.value
                                      ? Color(0xff1C242C)
                                      : Colors.grey.shade300),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "Summery",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Invested amount",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Est. return",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 1,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: controller.dark.value
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("Total value",
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Text("₹", style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: 3.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: controller.dark.value
                                      ? Color(0xff202C35)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "View Detail Chart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Download",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Calculate SIP
  double calculateSIP(double monthlyInvestment, double expectedReturnRate, int timePeriod) {
    double monthlyRate = expectedReturnRate / 12 / 100;
    int numberOfMonths = timePeriod * 12;
    double futureValue = 0;

    for (int i = 0; i < numberOfMonths; i++) {
      futureValue = (futureValue + monthlyInvestment) * (1 + monthlyRate);
    }

    return futureValue;
  }
}
