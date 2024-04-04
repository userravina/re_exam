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
