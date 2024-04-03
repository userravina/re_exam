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
</p>import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gst_calculator/calculator/controller/calculator_controller.dart';
import 'package:gst_calculator/calculator/view/bouncing_button.dart';
import 'package:gst_calculator/main.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../class/language_constants.dart';

class Calculator_Home extends StatefulWidget {
  const Calculator_Home({super.key});

  @override
  State<Calculator_Home> createState() => _Calculator_HomeState();
}

class _Calculator_HomeState extends State<Calculator_Home> {
  Calculator_Controller controller = Get.find();
  ScrollController scrollcontroller = ScrollController();

  bool onetime = false;
  bool onetime2 = false;
  bool onetime3 = false;
  String display = "";
  bool gst = false;
  String twonumber = "";
  String gstnumber = "";
  String gstoperator = "";
  bool dotAdded = false;
  bool dotAdded2 = false;
  bool dotcheck = false;
  bool update = false;
  bool check = false;
  bool mrprint = false;
  bool rootprint = false;
  final player = AudioPlayer();

  void loadSound() async {
    try {
      await player.setAsset('assets/sounds/coin_add.wav');
    } catch (e) {
      print('Error loading sound: $e');
    }
  }

  void playSound() {
    player.play().catchError((error) {
      print('Error playing sound: $error');
    });
    print("play sound ==============================");
  }

  @override
  void initState() {
    controller.value.clear();
    controller.initPrefs();
    loadSound();
    super.initState();
  }

  void scrolle() {
    scrollcontroller.animateTo(scrollcontroller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  double subtractAndRound(double value1, double value2) {
    print("value1$value1");
    print("value2$value2");
    double result = value1 - value2;
    print("===========$result==================");
    // Find the maximum number of decimal places in the input values
    int maxDecimalPlaces = (value1.toString().split('.').length == 2 ||
            value2.toString().split('.').length == 2)
        ? (value1.toString().split('.').length >
                value2.toString().split('.').length
            ? value1.toString().split('.')[1].length
            : value2.toString().split('.')[1].length)
        : 0;

    // Round the result to the maximum number of decimal places found
    return double.parse((result).toStringAsFixed(maxDecimalPlaces));
  }

  void loadValueListFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      controller.value.value = prefs.getStringList('valueList') ?? [];
    });
  }

  double calculateTotal(List<String> values) {
    double total = 0.0;

    for (int i = 0; controller.grandTotal.length > i; i++) {
      total += controller.grandTotal[i];
    }
    return total;
  }

  onclick(String number, String click) async {
    switch (click) {
      case ".":
        {
          if (!dotAdded) {
            scrolle();
            print("dotAdded${dotAdded}");
            dotAdded = true;
            dotAdded2 = true;
            dotcheck = true;
            print("dotAdded2 ${dotAdded}");
            controller.display.value += click;
            controller.displayEnglish.value += click;
          }
          break;
        }
      case "0":
      case "00":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        if ((controller.display.value == "0" ||
                controller.display.value == "00") &&
            (number == "0" || number == "00")) {
          controller.display.value = "0";

          return;
        }
        if (controller.display.value == "" && (number == "00")) {
          number = "0";
        }
        if (controller.displayOprater.value == "M+" ||
            controller.displayOprater.value == "M-") {
          display = controller.display.value + controller.prevOpertor.value;
          print("display$display");
          controller.display.value = "";
          controller.displayEnglish.value = "";
        }

        if (onetime3 == true) {
          if (controller.displayOprater.value == "MU") {
            onetime3 == true;
            print("MMMMMMMMMMMMMMMMM3");
            controller.display.value = "";
            controller.displayEnglish.value = "";
          }
        } else {
          if (onetime2 == true) {
            if (controller.displayOprater.value == "MU") {
              onetime2 == true;
              check = true;
              print("MMMMMMMMMMMMMMMMM1");
              controller.display.value = "";
              controller.displayEnglish.value = "";
            }
          } else {
            if (controller.displayOprater.value == "MU") {
              print("MMMMMMMMMMMMMMMMM2");
              onetime = true;
              check = false;
              onetime2 == false;
              controller.display.value = "";
              controller.displayEnglish.value = "";
            }
          }
        }

        if (rootprint == true) {
          controller.display.value = "";
        }
        controller.displayOprater.value = "";

        if (update == true) {
          print("Update diplay ${controller.display.value}");
          print("Update diplay + number ${controller.display.value + number}");
          print("jhdjkh${controller.updatevalue.value}");
          controller.updatevalue.value = controller.display.value + number;
          print("jhdjkh${controller.updatevalue.value}");
          print("jhdjkh${controller.prevOpertor.value}");
        }

        controller.display.value.length < 12
            ? controller.display.value = controller.display.value + number
            : controller.display.value;

        if (controller.display.value == "01" ||
            controller.display.value == "02" ||
            controller.display.value == "03" ||
            controller.display.value == "04" ||
            controller.display.value == "05" ||
            controller.display.value == "06" ||
            controller.display.value == "07" ||
            controller.display.value == "08" ||
            controller.display.value == "09") {
          controller.display.value =
              controller.display.value.replaceFirst('0', '');
        }
        scrolle();
        controller.displayEnglish.value =
            controller.displayEnglish.value + click;
        break;
      case "AC":
        onetime = false;
        onetime2 = false;
        onetime3 = false;
        print(onetime);
        dotAdded = false;
        dotAdded2 = false;
        dotcheck = false;
        rootprint = false;
        check = false;
        controller.display.value = "";
        controller.displayEnglish.value = "";
        controller.value.clear();
        controller.prevOpertor.value = "";
        gstnumber = "";
        controller.memory.value = 0.0;
        controller.result.value = 0.0;
        display = "";
        mrprint = false;
        gst = false;
        update = false;
        controller.displayOprater.value = "";
        controller.operator.clear();

        controller.grandTotal.clear();
        break;
      case "DE":
        scrolle();
        dotAdded = false;
        print("Update DE ${controller.display.value}");
        if (controller.display.value.isNotEmpty) {
          print("Update DE2 ${controller.display.value}");
          controller.display.value = controller.display.value
              .substring(0, controller.display.value.length - 1);
          print("Update DE3 ${controller.display.value}");
        }
        print("Update displayEnglish DE1 ${controller.displayEnglish.value}");
        controller.displayEnglish.value = controller.displayEnglish.value
            .substring(0, controller.displayEnglish.value.length - 1);
        print("Update displayEnglish DE2 ${controller.displayEnglish.value}");
        update = true;
        break;

      case "+3%":
      case "+5%":
      case "+12%":
      case "+18%":
      case "+GST":
        if (controller.displayEnglish.value.isEmpty) {
        } else {
          controller.currentValue.value =
              double.parse(controller.displayEnglish.value);
          if (click == "+3%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+3%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.03;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "3%";
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator  ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 1.5%   ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 1.5%   ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;

            print(controller.percentage.value);
            controller.prevOpertor.value = number;
            controller.prevOpertor2.value = number;
            print(controller.prevOpertor.value);
            controller.currentValue.value = 0.0;
            controller.gstAmount.value = 0.0;
            controller.percentage.value = 0.0;
            controller.result.value = 0.0;
            controller.display.value = "";
          } else if (click == "+5%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+5%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.05;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "5%";
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("CGST 2.5%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("SGST 2.5%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
            controller.prevOpertor2.value = number;
            print(controller.percentage.value);
          } else if (click == "+12%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+12%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.12;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "12%";
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("CGST 6%     ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 6%     ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
            controller.prevOpertor2.value = number;
            print(controller.percentage.value);
          } else if (click == "+18%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+18%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.18;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "18%";
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 9%    ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 9%    ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
            controller.prevOpertor2.value = number;
            print(controller.percentage.value);
          } else if (click == "+GST") {
            scrolle();
            dotAdded = false;
            gst = true;
            print("currentValue ${controller.currentValue}");

            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
          }

          print(controller.currentValue.value);
          print(controller.result.value);
          controller.prevOpertor.value = "+GST";

          controller.display.value = "";
          controller.displayOprater.value = "";
          // controller.displayEnglish.value = controller.result.value.toString();
        }

        break;

      case "-3%":
      case "-5%":
      case "-12%":
      case "-18%":
      case "-GST":
        if (controller.displayEnglish.value.isEmpty) {
        } else {
          controller.currentValue.value =
              double.parse(controller.displayEnglish.value);

          if (click == "-3%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-3%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.03;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;

            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            gstoperator = "3%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 1.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 1.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
            print(" ============= ${controller.result.value} ");
          } else if (click == "-5%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-5%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.05;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;
            controller.result.value = controller.percentage.value / 2;
            gst = true;
            gstoperator = "5%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 2.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 2.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
            print(" ============= ${controller.result.value} ");
          } else if (click == "-12%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-12%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.12;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;
            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            gstoperator = "12%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            String digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("CGST 6%     $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("SGST 6%     $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
          } else if (click == "-18%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-18%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.18;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;
            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            gstoperator = "18%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            String digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("CGST 9%      $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("SGST 9%      $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
          } else if (click == "-GST") {
            dotAdded = false;
            gst = true;
            print("currentValue ${controller.currentValue}");

            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();

            controller.prevOpertor.value = "-GST";
          }

          print(controller.currentValue.value);
          print(controller.result.value);

          controller.display.value = "";
        }
        break;
      case "MR":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          print(controller.memory.value.toString());
          if (mrprint == true) {
            if (update == true) {
              controller.display.value = controller.display.value
                  .replaceAll("MR+", "")
                  .replaceAll("MR-", "")
                  .replaceAll("MR*", "")
                  .replaceAll("MR/", "");
              print("iiiiii");
            } else {
              if (controller.memory.value == 0.0) {
              } else {
                controller.display.value = controller.memory.value.toString();
                print("eeeeeeeeeee");
              }
            }
            controller.prevOpertor.value = "MR";
          } else {
            controller.display.value = "";
            controller.value.clear();
          }

          break;
        }
      case "M-":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            if (controller.value.isEmpty) {
            } else {
              controller.display.value = controller.value[0]
                  .replaceAll(controller.value[0], controller.value[0]);
              print(" controller.display.value${controller.display.value}");
              controller.value.clear();
            }
          } else {
            controller.memory.value =
                double.parse(controller.displayEnglish.value);
          }
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M-";
          controller.m.value = "M-";
          break;
        }

      case "M+":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            if (controller.value.isEmpty) {
            } else {
              controller.display.value = controller.value[0]
                  .replaceAll(controller.value[0], controller.value[0]);
              print(" controller.display.value${controller.display.value}");
              controller.display.value.isEmpty
                  ? ""
                  : controller.memory.value =
                      double.parse(controller.display.value);
              controller.value.clear();
            }
          } else {
            controller.memory.value =
                double.parse(controller.displayEnglish.value);
          }
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M+";
          controller.m.value = "M+";
          break;
        }
      case "MU":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "MU";
          if (controller.prevOpertor2.value == "+3%" ||
              controller.prevOpertor2.value == "+5%" ||
              controller.prevOpertor2.value == "+12%" ||
              controller.prevOpertor2.value == "+18%" ||
              controller.prevOpertor2.value == "-3%" ||
              controller.prevOpertor2.value == "-5%" ||
              controller.prevOpertor2.value == "-12%" ||
              controller.prevOpertor2.value == "-18%") {
            print("yyyyyyyyy");
          } else {
            print("nnnnnnnnnnnn");
            if (controller.display.value.isEmpty) {
              if (controller.displayOprater.value.isNotEmpty) {
                onetime2 = true;
                if (controller.value.isEmpty) {
                } else {
                  controller.display.value = controller.value[0]
                      .replaceAll(controller.value[0], controller.value[0]);
                  controller.value.clear();
                  controller.value.add(controller.display.value +
                      controller.displayOprater.value);
                  controller.saveValueListToPrefs();
                }
              }
            } else {
              if (controller.value.isEmpty) {
                print("-------------");
                onetime3 = true;
                controller.displayOprater.value = number;
                controller.value.add(
                    controller.display.value + controller.displayOprater.value);
                controller.saveValueListToPrefs();
              } else {
                onetime3 = false;
                display = controller.display.value;
                controller.display.value = controller.value[2];
                controller.displayOprater.value = number;
                controller.value.add(controller.displayEnglish.value +
                    controller.displayOprater.value);
                controller.saveValueListToPrefs();
              }
            }
          }

          break;
        }
      case "undo":
        {
          // Assuming this is a function call to scroll somewhere
          dotAdded = false; // Resetting a flag maybe?

          if (controller.value.isNotEmpty) {
            controller.displayOprater.value = "";
            if (gst == true) {
            } else {
              scrolle();
              if (!controller.value[controller.value.length - 1]
                  .contains("=")) {
                String lastEntry = controller.value.removeLast();

                controller.prevOpertor.value = lastEntry[
                    0]; // Assuming the first character denotes the operator

                controller.display.value = lastEntry;
                controller.displayEnglish.value = lastEntry;
                print(
                    "Updated the display to the last entry: ${controller.display.value}");
              } else {
                print("Cannot undo because the last entry contains '='.");
                controller.value.removeAt(controller.value.length - 1);
                String lastEntry = controller.value.removeLast();
                controller.prevOpertor.value = lastEntry[0];
                controller.display.value = lastEntry;
                controller.displayEnglish.value = lastEntry;
                print(
                    "Updated the display to the last entry: ${controller.display.value}");
              }
            }
          }
          break;
        }
      case "GT":
        {
          scrolle();
          dotAdded = false;
          if (number == "0.0") {
          } else {
            controller.value.add("= " + number.toString() + " GT");
            controller.saveValueListToPrefs();
          }
          break;
        }
      case "%":
        {
          scrolle();
          dotAdded = false;
          if (onetime3 == false) {
            if (check == false) {
              print("fffffffffffffff");
              scrolle();
              dotAdded = false;
              if (onetime2 == true) {
                print("onetime2");
              } else {
                print("one time ===");
                print(controller.prevOpertor.value);
                if (onetime == false) {
                  if (controller.prevOpertor.value == "+") {
                    print("onetime");
                    String display = controller.display.value;
                    print(display);
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");

                      double percentageValue =
                          controller.currentValue.value * double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue ${percentageValue}");
                      double newValue =
                          controller.currentValue.value + percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = newValue.toString();

                      controller.displayEnglish.value = newValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  } else if (controller.prevOpertor.value == "-") {
                    String display = controller.display.value;
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue =
                          controller.currentValue.value * double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue $percentageValue");
                      double newValue =
                          controller.currentValue.value - percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = newValue.toString();

                      controller.displayEnglish.value = newValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  } else if (controller.prevOpertor.value == "*") {
                    String display = controller.display.value;
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue =
                          controller.currentValue.value * double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue $percentageValue");
                      print('************');
                      double newValue =
                          controller.currentValue.value * percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = percentageValue.toString();

                      controller.displayEnglish.value =
                          percentageValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  } else if (controller.prevOpertor.value == "/") {
                    String display = controller.display.value;
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue =
                          controller.currentValue.value / double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue *= 100;
                      print("percentageValue $percentageValue");
                      double newValue =
                          controller.currentValue.value / percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = percentageValue.toString();

                      controller.displayEnglish.value =
                          percentageValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  }
                  print("tum");
                  print(controller.displayEnglish);
                } else if (onetime == true) {
                  if (update == true) {
                    print("========= update +++++++++++");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();

                    controller.updatevalue.value =
                        controller.updatevalue.value.substring(1);
                    controller.displayEnglish.value =
                        controller.displayEnglish.value.substring(1);
                    print(controller.display.value);
                    print("jhdjkh${controller.updatevalue.value}");
                    display = controller.value[3].replaceAll("MU", "");
                    controller.currentValue.value = double.parse(display);
                    print("currentValue ${controller.currentValue.value}");

                    double percentageValue =
                        controller.currentValue.value * 100;
                    print("percentageValue $percentageValue");
                    print("display ${controller.display.value}");
                    double r = 100 -
                        double.parse(
                            controller.display.value.replaceAll("%", ""));
                    print(percentageValue);
                    print(r);
                    double r1 = percentageValue / r;
                    print(r1);
                    controller.prevOpertor.value = "=";
                    controller.value
                        .add(controller.prevOpertor.value + r1.toString());
                    controller.saveValueListToPrefs();
                    print(controller.value);
                    controller.display.value = "";
                    controller.displayOprater.value = "";
                    scrolle();
                  } else {
                    controller.prevOpertor.value = "=";
                    print("tttttttttttttttttttttttttttt");
                    controller.displayOprater.value = number;
                    print(controller.displayOprater.value);
                    print(" 4000000000000000000${controller.display.value}");
                    print("4444444444444$display");

                    controller.value.add(controller.displayOprater.value +
                        controller.display.value);

                    controller.currentValue.value = double.parse(display);
                    print("currentValue ${controller.currentValue.value}");
                    double percentageValue =
                        controller.currentValue.value * 100;
                    print("percentageValue $percentageValue");
                    double r = 100 - double.parse(controller.display.value);
                    print(percentageValue);
                    print(r);
                    double r1 = percentageValue / r;
                    print(r1);
                    controller.value
                        .add(controller.prevOpertor.value + r1.toString());
                    controller.saveValueListToPrefs();
                    print(controller.value);
                    controller.display.value = "";
                    controller.displayOprater.value = "";
                  }
                }
              }
            }
          } else {
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value[0].replaceAll("MU", "");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              print("display ${controller.display.value}");
              double r = 100 -
                  double.parse(controller.display.value.replaceAll("%", ""));
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.prevOpertor.value = "=";
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
              scrolle();
            } else {
              print("yes");
              controller.prevOpertor.value = "=";
              print("onetime3 tttttttttttttttttttttttttttt");
              controller.displayOprater.value = number;
              print(controller.displayOprater.value);
              print(" 4000000000000000000${controller.display.value}");
              print("4444444444444${controller.value[0].replaceAll("MU", "")}");
              display = controller.value[0].replaceAll("MU", "");
              controller.value.add(
                  controller.displayOprater.value + controller.display.value);

              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              double r = 100 - double.parse(controller.display.value);
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
            }
          }

          if (check == true) {
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value[0].replaceAll("MU", "");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              print("display ${controller.display.value}");
              double r = 100 -
                  double.parse(controller.display.value.replaceAll("%", ""));
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.prevOpertor.value = "=";
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
              scrolle();
            } else {
              print("true");
              controller.prevOpertor.value = "=";
              print("check tttttttttttttttttttttttttttt");
              controller.displayOprater.value = number;
              print(controller.displayOprater.value);
              print(" 4000000000000000000${controller.display.value}");
              print("4444444444444${controller.value[0].replaceAll("MU", "")}");
              display = controller.value[0].replaceAll("MU", "");
              controller.value.add(
                  controller.displayOprater.value + controller.display.value);

              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              double r = 100 - double.parse(controller.display.value);
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
            }
          }
          break;
        }
      case "root":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
          } else {
            rootprint = true;
            double currentValue = double.parse(controller.displayEnglish.value);

            if (currentValue >= 0) {
              double squareRoot = sqrt(currentValue);

              controller.display.value = squareRoot.toString();
              double secoundvalue = double.parse(controller.display.value);
              controller.display.value = secoundvalue.toStringAsFixed(3);
              controller.displayEnglish.value = squareRoot.toString();
            } else {
              controller.display.value = "Error";
              controller.displayEnglish.value = "Error";
            }
          }

          break;
        }
      case "/":
        {
          scrolle();
          dotAdded = false;

          if (controller.displayEnglish.value.isEmpty) {
            controller.displayOprater.value = number;
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print(
                  "MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR${controller.displayEnglish.value}");
              if (controller.value.isEmpty) {
              } else {
                if (controller.value[0].contains("M+")) {
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  controller.display.value = "";
                  controller.displayEnglish.value = "";
                  controller.prevOpertor.value = "/";
                  controller.prevOpertor2.value = "/";
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.prevOpertor.value = "/";
                print(controller.value[0]);
                controller.result.value = double.parse(controller.value[0]);
              }
            }
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              controller.displayOprater.value = number;
              if (controller.prevOpertor.value == "+") {
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                if (controller.prevOpertor.value == "M+" ||
                    controller.prevOpertor.value == "M-") {
                  controller.prevOpertor.value = "/";
                  controller.value.add(controller.display.value);
                } else {
                  controller.value.add(controller.display.value);
                }
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              controller.saveValueListToPrefs();
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                controller.memory.value = double.parse(
                    display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.prevOpertor.value = "/";
              controller.prevOpertor2.value = "/";
            }
          }

          break;
        }
      case "*":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            controller.displayOprater.value = number;
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print(
                  "MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR${controller.displayEnglish.value}");
              if (controller.value.isEmpty) {
              } else {
                if (controller.value[0].contains("M+")) {
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  controller.display.value = "";
                  controller.displayEnglish.value = "";
                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = "*";
                  controller.prevOpertor2.value = "*";
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.prevOpertor.value = "*";
                print(controller.value[0]);
                controller.result.value = double.parse(controller.value[0]);
              }
            }
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              controller.displayOprater.value = number;
              print("cjhj2 ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "+") {
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                if (controller.prevOpertor.value == "M+" ||
                    controller.prevOpertor.value == "M-") {
                  controller.value.add(controller.display.value);
                } else {
                  controller.value.add(controller.display.value);
                }
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              controller.saveValueListToPrefs();
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                display.isEmpty
                    ? ""
                    : controller.memory.value = double.parse(
                        display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "*";
              controller.prevOpertor2.value = "*";
            }
          }
          break;
        }
      case "-":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            controller.displayOprater.value = number;
            print(
                "controller.displayEnglish.value3 ${controller.display.value}");
            print("== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print(
                  "MMMMMMMMMMMMMRRRRRRRRRR  RRRRRRR${controller.displayOprater.value}");
              if (controller.value.isEmpty) {
              } else {
                if (controller.value[0].contains("M+")) {
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  controller.display.value = "";
                  controller.displayEnglish.value = "";
                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = "-";
                  controller.prevOpertor2.value = "-";
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.prevOpertor.value = "-";
                print("------");
                controller.displayOprater.value = number;
                print(controller.value[0]);
                controller.result.value = double.parse(controller.value[0]);
              }
            }
            print(controller.result.value);
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              controller.displayOprater.value = number;
              print("cjhj3 ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "+") {
                print(
                    "controller.displayEnglish.value2 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                if (controller.prevOpertor.value == "M+" ||
                    controller.prevOpertor.value == "M-") {
                  controller.prevOpertor.value = "-";
                  controller.value.add(controller.display.value);
                } else {
                  controller.value.add(controller.display.value);
                }
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }

              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                controller.memory.value = double.parse(
                    display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "-";
              controller.prevOpertor2.value = "-";
            }
          }
          break;
        }
      case "+":
        {
          dotAdded = false;
          scrolle();
          print("==+== ${controller.display.value}");

          if (controller.displayEnglish.value.isEmpty) {
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            if (controller.value.isEmpty) {
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.result.value = double.parse(controller.value[0]);
              }

              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "+";
              controller.prevOpertor2.value = "+";
            }
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              print("cjhj ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "+") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "+GST") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                print("ppppp1");
                controller.value.add(controller.display.value);
                controller.saveValueListToPrefs();
              } else {
                print("ppppp2");
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                display.isEmpty
                    ? ""
                    : controller.memory.value = double.parse(
                        display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "+";
              controller.prevOpertor2.value = "+";
            }
          }

          break;
        }
      case "=":
        {
          scrolle();
          controller.displayOprater.value = number;
          if (controller.prevOpertor.value == "+") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) +
                    double.parse(controller.updatevalue.value);
              } else {
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  total += elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              print("+++++++++++");

              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11");
                }
                print(controller.displayEnglish.value);
                print(controller.result.value);
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(
                      controller.displayOprater.value + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "-") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) -
                    double.parse(controller.updatevalue.value);
              } else {
                double total = 0.0;
                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  print("elementValue: $elementValue");
                  total -= elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                }

                controller.result.value = subtractAndRound(
                    controller.result.value,
                    double.parse(controller.display.value));
                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(
                      controller.displayOprater.value + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "*") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) *
                    double.parse(controller.updatevalue.value);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(controller.value[i]);
                    total += elementValue;
                    print("1elementValue: $elementValue");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(controller.value[i]);
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        controller.value[i].replaceAll(RegExp('[*+-./]'), ''));
                    total *= elementValue;
                    print("3elementValue: $elementValue");
                  }
                }
                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11");
                }
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(
                      controller.displayOprater.value + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "/") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) /
                    double.parse(controller.updatevalue.value);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(controller.value[i]);
                    total += elementValue;
                    print("1elementValue: $elementValue");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(controller.value[i]);
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        controller.value[i].replaceAll(RegExp('[*+-./]'), ''));
                    total /= elementValue;
                    print("3elementValue: $elementValue");
                  }
                }
                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11");
                }
                print("jjjjjjjj11${controller.result.value}");
                print("jjjjjjjj11${controller.displayEnglish.value}");
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
                print("jjjjjjjj11${controller.result.value}");

                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(controller.displayOprater.value +
                      controller.result.value.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "MU") {
            scrolle();
            controller.value
                .add(controller.prevOpertor.value + controller.display.value);
          } else if (controller.prevOpertor.value == "+GST") {
            scrolle();
            double secoundvalue = double.parse(controller.display.value);
            twonumber = secoundvalue.toStringAsFixed(0);
            controller.percentage.value =
                controller.currentValue.value * 0 + secoundvalue;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("IGST ${controller.display.value}%   $twonumber");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            controller.value.add(
                "CGST ${controller.CGST.value}%   ${controller.CGST.value}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            controller.value.add(
                "SGST ${controller.SGST.value}%   ${controller.SGST.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;

            print(controller.percentage.value);
            print("==${controller.currentValue.value}");
          } else if (controller.prevOpertor.value == "-GST") {
            scrolle();
            print(controller.display.value);
            double secoundvalue = double.parse(controller.display.value);
            twonumber = secoundvalue.toStringAsFixed(0);
            print("kjvkljf $twonumber");
            controller.percentage.value =
                controller.currentValue.value * 0 + secoundvalue;
            print("percentage ${controller.percentage.value}");
            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("IGST ${controller.display.value}%   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("CGST ${controller.result.value}%    $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("SGST ${controller.result.value}%    $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("GST  = $twonumber");
            controller.saveValueListToPrefs();
            print(" ============= ${controller.result.value} ");
            print("currentValue ${controller.currentValue}");
            print("==${controller.currentValue.value}");
          } else if (controller.prevOpertor.value == "update") {
            print("========= update ==========");

            print("jhdjkh${controller.updatevalue.value}");
          } else if (controller.prevOpertor.value == "MR") {
            if (update == true) {
              print("========= update +++++++++++");
              print("========= update ${controller.display.value}");
              controller.value.add(controller.prevOpertor.value +
                  controller.prevOpertor2.value +
                  controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value[0]
                  .replaceAll("M+", "")
                  .replaceAll("M-", " ");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              print("prevOpertor ${controller.updatevalue.value}");
              if (controller.m.value == "M-") {
                if (controller.prevOpertor2.value == "+") {
                  controller.result.value = controller.currentValue.value -
                      double.parse(
                          controller.updatevalue.value.replaceAll("R+ - ", ""));
                }
                if (controller.prevOpertor2.value == "-") {
                  controller.result.value = controller.currentValue.value +
                      double.parse(
                          controller.updatevalue.value.replaceAll("R- - ", ""));
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = controller.currentValue.value *
                      double.parse(
                          controller.updatevalue.value.replaceAll("R* -", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = controller.currentValue.value /
                      double.parse(
                          controller.updatevalue.value.replaceAll("R/ -", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
                controller.display.value = "";
                controller.displayOprater.value = "";
              } else {
                if (controller.prevOpertor2.value == "+") {
                  print("prevOpertor1 ${controller.updatevalue.value}");
                  controller.result.value = controller.currentValue.value +
                      double.parse(
                          controller.updatevalue.value.replaceAll("R+", ""));
                  print("prevOpertor2 ${controller.updatevalue.value}");
                }
                if (controller.prevOpertor2.value == "-") {
                  print("prevOpertor3 ${controller.currentValue.value}");
                  controller.result.value = controller.currentValue.value -
                      double.parse(
                          controller.updatevalue.value.replaceAll("R-", ""));
                  print("prevOpertor4 ${controller.currentValue.value}");
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = controller.currentValue.value *
                      double.parse(
                          controller.updatevalue.value.replaceAll("R*", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = controller.currentValue.value /
                      double.parse(
                          controller.updatevalue.value.replaceAll("R/", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
                controller.display.value = "";
                controller.displayOprater.value = "";
              }
            } else {
              print("M+M_");
              print("M+M_${controller.m.value}");
              if (controller.m.value == "M-") {
                print("M--------------");
                controller.value.add(controller.prevOpertor.value +
                    controller.prevOpertor2.value +
                    " - " +
                    display.replaceAll("M+", "").replaceAll("M-", ""));
                controller.saveValueListToPrefs();
                if (controller.prevOpertor2.value == "+") {
                  controller.result.value = double.parse(controller.value[0]) -
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "-") {
                  controller.result.value = double.parse(controller.value[0]) +
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = double.parse(controller.value[0]) *
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = double.parse(controller.value[0]) /
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
              } else {
                print("M+++++++++++");

                controller.value.add(controller.prevOpertor.value +
                    controller.prevOpertor2.value +
                    display.replaceAll("M+", "").replaceAll("M-", ""));
                controller.saveValueListToPrefs();
                if (controller.prevOpertor2.value == "+") {
                  controller.result.value = double.parse(controller.value[0]) +
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "-") {
                  controller.result.value = double.parse(controller.value[0]) -
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = double.parse(controller.value[0]) *
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = double.parse(controller.value[0]) /
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                controller.prevOpertor.value = "=   ";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
              }
              print(controller.value);
            }
          }
          print("jjjjjjjj");
          controller.display.value = "";
          controller.grandTotal.add(controller.result.value);
          controller.operator.add(controller.displayOprater.value);
          controller.displayEnglish.value = "";
          controller.prevOpertor.value = "=";
          controller.saveValueListToPrefs();

          controller.result.value = 0.0;
          break;
        }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: controller.dark.value ? Colors.white : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.6.h),
          child: AppBar(
            backgroundColor:
                controller.dark.value ? Colors.black : Color(0xffE7E7E7),
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                    icon: Icon(Icons.menu));
              },
            ),
            centerTitle: true,
            title: controller.dark.value
                ? Container(
                    height: 5.2.h,
                    width: 35.w,
                    color: Colors.black,
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          "assets/images/more.png",
                          height: 3.h,
                          width: 10.w,
                        ),
                        Spacer(),
                        Text(
                          "More Tools",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 5.2.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 3.5.h,
                          width: 7.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.blueAccent)),
                          child: Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "More Tools",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
            actions: [
              controller.dark.value
                  ? Text("")
                  : Image.asset(
                      "assets/images/game_icon.png",
                      height: 4.h,
                    ),
              Image.asset(
                "assets/images/queen.png",
                height: 7.h,
              )
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: controller.dark.value ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 23.h,
                    width: 75.w,
                    decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "GST lternic Calculator",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Pro",
                              style: TextStyle(
                                  color: Colors.yellow.shade800,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4.w,
                            ),
                            SizedBox(
                              height: 3.h,
                              child: ClipRect(
                                child: Image.asset("assets/images/expand.png"),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Enjoy Full Size Calc",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4.w,
                            ),
                            SizedBox(
                              height: 3.h,
                              child: ClipRect(
                                child: Image.asset("assets/images/expand1.png"),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Ad Free Calculator",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 5.4.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff4777E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Buy",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "GST OPTION",
                    style: TextStyle(
                        color: controller.dark.value
                            ? Colors.grey.shade500
                            : Colors.grey,
                        fontSize: 17,
                        fontWeight: controller.dark.value
                            ? FontWeight.w400
                            : FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child: Image.asset("assets/images/tools.png"),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "More Tools",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    "GENERAL",
                    style: TextStyle(
                        color: controller.dark.value
                            ? Colors.grey.shade500
                            : Colors.grey,
                        fontSize: 17,
                        fontWeight: controller.dark.value
                            ? FontWeight.w400
                            : FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/dark1.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Dark Theme",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Spacer(),
                            Switch(
                              value: controller.dark.value,
                              onChanged: (value) {
                                controller.toggleTheme(value);
                              },
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            showModalBottomSheet(
                              backgroundColor: Colors.white10,
                              context: context,
                              builder: (BuildContext context) {
                                return BottomSheet(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.8),
                                  builder: (BuildContext context) {
                                    return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5.0, sigmaY: 5.0),
                                        child: LenguageSelectionBottomSheet());
                                  },
                                  onClosing: () {
                                    // Handle the closing of the bottom sheet
                                  },
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              Container(
                                height: 4.5.h,
                                width: 9.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade800),
                                child: Center(
                                    child: Icon(Icons.language,
                                        color: Colors.white)),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Language",
                                style: TextStyle(
                                  color: controller.dark.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth:
                                          300, // Minimum width of the dialog
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 40, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "ROUNDER SELECT",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Obx(
                                                () => Slider(
                                                  value: controller
                                                      .currentSliderValue.value,
                                                  min: 0,
                                                  max: 5,
                                                  divisions: 50,
                                                  label: controller
                                                      .currentSliderValue.value
                                                      .toInt()
                                                      .toString(),
                                                  onChanged: (double value) {
                                                    setState(() {
                                                      controller
                                                          .currentSliderValue
                                                          .value = value;
                                                      print(controller
                                                          .currentSliderValue
                                                          .value);
                                                      twonumber = controller
                                                          .currentSliderValue
                                                          .value
                                                          .toStringAsFixed(0);
                                                      print(twonumber);
                                                      controller
                                                              .currentSliderValue
                                                              .value =
                                                          double.parse(
                                                              twonumber);
                                                      controller.value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Obx(() => Text(
                                                  'Value: ${controller.currentSliderValue.value}'))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: Text("Close"),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                height: 4.h,
                                child: ClipRect(
                                  child:
                                      Image.asset("assets/images/rounder.png"),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Round off answer",
                                style: TextStyle(
                                  color: controller.dark.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            showModalBottomSheet(
                              backgroundColor: Colors.white10,
                              context: context,
                              builder: (BuildContext context) {
                                return BottomSheet(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.8),
                                  builder: (BuildContext context) {
                                    return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5.0, sigmaY: 5.0),
                                        child: Keypad_Model_Screen());
                                  },
                                  onClosing: () {
                                    // Handle the closing of the bottom sheet
                                  },
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                height: 4.h,
                                child: ClipRect(
                                  child: Image.asset("assets/images/kmode.png"),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Keypad Mode",
                                style: TextStyle(
                                  color: controller.dark.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/sound.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Keypad Sound",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Spacer(),
                            Switch(
                              value: false,
                              onChanged: (value) {
                                // controller.toggleTheme(value);
                              },
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/vibration.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Vibration",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Spacer(),
                            Switch(
                              value: false,
                              onChanged: (value) {
                                // controller.toggleTheme(value);
                              },
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    "OTHER",
                    style: TextStyle(
                        color: controller.dark.value
                            ? Colors.grey.shade500
                            : Colors.grey,
                        fontSize: 17,
                        fontWeight: controller.dark.value
                            ? FontWeight.w400
                            : FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child: Image.asset(
                                    "assets/images/privacypolicy.png"),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Privacy Policy ",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child: Image.asset("assets/images/terms.png"),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child: Image.asset("assets/images/rate.png"),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Rate Us",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value
                              ? Color(0xff202C35)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ClipRect(
                                child:
                                    Image.asset("assets/images/shareapp.png"),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Share This App",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 7.h,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: scrollcontroller,
                physics: ClampingScrollPhysics(),
                itemCount: controller.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.value.length) {
                    return Container(
                      height: 8.h,
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        gst == true
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: controller.value[index]
                                                .contains("=")
                                            ? 10
                                            : 5,
                                        vertical: controller.value[index]
                                                .contains("=")
                                            ? 3
                                            : 0),
                                    decoration:
                                        controller.value[index].contains("=")
                                            ? BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(20))
                                            : BoxDecoration(),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "${controller.value[index]} ",
                                        style: TextStyle(
                                            fontSize: controller.value[index]
                                                    .contains("=")
                                                ? 16
                                                : 15,
                                            fontWeight: controller.value[index]
                                                    .contains("=")
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                            color: controller.dark.value
                                                ? Colors.black
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        controller.value[index].contains("=")
                                            ? 7
                                            : 0),
                                decoration: controller.value[index]
                                        .contains("=")
                                    ? BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(5))
                                    : BoxDecoration(),
                                child: Text(
                                  " ${controller.value[index]} ",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.black
                                        : Colors.black,
                                    fontSize: 18,
                                    fontWeight:
                                        controller.value[index].contains("=")
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
        Obx(() => controller.modetrue.value?  Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 7.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffE7E7E7),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  onclick("", "AC");
                                  print("dwfwddeded");
                                },
                                child: Image.asset(
                                  "assets/images/ac.png",
                                  height: 5.h,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  onclick("", "undo");
                                },
                                child: Image.asset(
                                  "assets/images/undo.png",
                                  height: 4.h,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    maxLines: 1,
                                    "${controller.display}",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: controller.dark.value
                                            ? Colors.black
                                            : Colors.black),
                                  ),
                                ),
                              ),
                              Obx(
                                    () => Text(
                                  controller.displayOprater.value == "="
                                      ? ""
                                      : controller.displayOprater.value,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: controller.dark.value
                                          ? Colors.black
                                          : Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  onclick("", "DE");
                                },
                                child: Image.asset("assets/images/delet.png",
                                    height: 5.h),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 43, left: 145),
                      child: Container(
                        height: 1.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Bouncing(
                      onPress: () {
                        onclick("+${context.loc.three}%", "+3%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "+${context.loc.three}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("+${context.loc.five}%", "+5%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "+${context.loc.five}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick(
                            "+${context.loc.one}${context.loc.two}%", "+12%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          text: "+${context.loc.one}${context.loc.two}%",
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("+${context.loc.one}${context.loc.eight}%",
                            "+18%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "+${context.loc.one}${context.loc.eight}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("+GST", "+GST");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          text: "+GST",
                          imagePath: "assets/images/btn1.png"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Bouncing(
                      onPress: () {
                        onclick("-${context.loc.three}%", "-3%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "-${context.loc.three}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("-${context.loc.five}%", "-5%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "-${context.loc.five}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick(
                            "-${context.loc.one}${context.loc.two}%", "-12%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "-${context.loc.one}${context.loc.two}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("-${context.loc.one}${context.loc.eight}%",
                            "-18%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "-${context.loc.one}${context.loc.eight}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("-GST", "-GST");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "-GST",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          imagePath: "assets/images/btn1.png"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Bouncing(
                      onPress: () {
                        onclick("MR", "MR");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "MR",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                          imagePath: "assets/images/btn2.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("÷", "/");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "÷",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                          imagePath: "assets/images/btn2.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("%", "%");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "%",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                          imagePath: "assets/images/btn2.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("√x", "root");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "√x",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 19),
                          imagePath: "assets/images/btn2.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        double total = calculateTotal(controller.value);
                        onclick("${total}", "GT");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "GT",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          imagePath: "assets/images/btn2.png"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Bouncing(
                      onPress: () {
                        onclick("MU", "MU");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "MU",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                          imagePath: "assets/images/btn2.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("×", "*");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "×",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                          imagePath: "assets/images/btn2.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick(context.loc.seven, "7");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "${context.loc.seven}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 23),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick(context.loc.eight, "8");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "${context.loc.eight}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 23),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick(context.loc.nine, "9");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "${context.loc.nine}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 23),
                          imagePath: "assets/images/btn1.png"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Bouncing(
                      onPress: () {
                        onclick("M-", "M-");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "M-",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                          imagePath: "assets/images/btn2.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("-", "-");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "-",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                          imagePath: "assets/images/btn2.png"),
                    ),


                    Bouncing(
                      onPress: () {
                        onclick(context.loc.four, "4");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "${context.loc.four}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 23),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick(context.loc.five, "5");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "${context.loc.five}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 23),
                          imagePath: "assets/images/btn1.png"),
                    ),
                    Bouncing(
                      onPress: () {
                        onclick(context.loc.six, "6");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 7.2.h,
                          text: "${context.loc.six}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 23),
                          imagePath: "assets/images/btn1.png"),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Column(
                      children: [
                        Bouncing(
                          onPress: () {
                            onclick("M+", "M+");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "M+",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                              imagePath: "assets/images/btn2.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("=", "=");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "=",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                              imagePath: "assets/images/btn4.png"),
                        ),
                      ],
                    ),
                    Bouncing(
                      onPress: () {
                        onclick("+", "+");
                      },
                      child: clickableContainer(
                          onTap: () {},
                          width: 20.w,
                          height: 14.4.h,
                          text: "+",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                          imagePath: "assets/images/btn3.png"),
                    ),
                    Column(
                      children: [
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.one, "1");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.one}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.zero, "0");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.zero}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.two, "2");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.two}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.zero1, "00");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.zero1}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.three, "3");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.three}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(".", ".");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: ".",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ):
            Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 7.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xffE7E7E7),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      playSound();
                                      onclick("", "AC");
                                      print("dwfwddeded");
                                    },
                                    child: Image.asset(
                                      "assets/images/ac.png",
                                      height: 5.h,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      playSound();
                                      onclick("", "undo");
                                    },
                                    child: Image.asset(
                                      "assets/images/undo.png",
                                      height: 4.h,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        maxLines: 1,
                                        "${controller.display}",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                            color: controller.dark.value
                                                ? Colors.black
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.displayOprater.value == "="
                                          ? ""
                                          : controller.displayOprater.value,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: controller.dark.value
                                              ? Colors.black
                                              : Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      playSound();
                                      onclick("", "DE");
                                    },
                                    child: Image.asset("assets/images/delet.png",
                                        height: 5.h),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 43, left: 145),
                          child: Container(
                            height: 1.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Bouncing(
                          onPress: () {
                            loadSound();
                            onclick("+${context.loc.three}%", "+3%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "+${context.loc.three}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            playSound();
                            onclick("+${context.loc.five}%", "+5%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "+${context.loc.five}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            playSound();
                            onclick(
                                "+${context.loc.one}${context.loc.two}%", "+12%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              text: "+${context.loc.one}${context.loc.two}%",
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            playSound();
                            onclick("+${context.loc.one}${context.loc.eight}%",
                                "+18%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "+${context.loc.one}${context.loc.eight}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            playSound();
                            onclick("+GST", "+GST");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              text: "+GST",
                              imagePath: "assets/images/btn1.png"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Bouncing(
                          onPress: () {
                            onclick("-${context.loc.three}%", "-3%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "-${context.loc.three}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("-${context.loc.five}%", "-5%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "-${context.loc.five}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(
                                "-${context.loc.one}${context.loc.two}%", "-12%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "-${context.loc.one}${context.loc.two}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("-${context.loc.one}${context.loc.eight}%",
                                "-18%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "-${context.loc.one}${context.loc.eight}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("-GST", "-GST");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "-GST",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              imagePath: "assets/images/btn1.png"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Bouncing(
                          onPress: () {
                            double total = calculateTotal(controller.value);
                            onclick("${total}", "GT");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "GT",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              imagePath: "assets/images/btn2.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("√x", "root");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "√x",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19),
                              imagePath: "assets/images/btn2.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("%", "%");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "%",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                              imagePath: "assets/images/btn2.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("÷", "/");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "÷",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                              imagePath: "assets/images/btn2.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("MR", "MR");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "MR",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                              imagePath: "assets/images/btn2.png"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.seven, "7");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.seven}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.eight, "8");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.eight}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.nine, "9");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.nine}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("×", "*");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "×",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                              imagePath: "assets/images/btn2.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("MU", "MU");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "MU",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                              imagePath: "assets/images/btn2.png"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.four, "4");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.four}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.five, "5");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.five}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick(context.loc.six, "6");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "${context.loc.six}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                              imagePath: "assets/images/btn1.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("-", "-");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "-",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                              imagePath: "assets/images/btn2.png"),
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("M-", "M-");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 7.2.h,
                              text: "M-",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                              imagePath: "assets/images/btn2.png"),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Bouncing(
                              onPress: () {
                                onclick(context.loc.one, "1");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: "${context.loc.one}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23),
                                  imagePath: "assets/images/btn1.png"),
                            ),
                            Bouncing(
                              onPress: () {
                                onclick(context.loc.zero, "0");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: "${context.loc.zero}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23),
                                  imagePath: "assets/images/btn1.png"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Bouncing(
                              onPress: () {
                                onclick(context.loc.two, "2");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: "${context.loc.two}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23),
                                  imagePath: "assets/images/btn1.png"),
                            ),
                            Bouncing(
                              onPress: () {
                                onclick(context.loc.zero1, "00");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: "${context.loc.zero1}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23),
                                  imagePath: "assets/images/btn1.png"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Bouncing(
                              onPress: () {
                                onclick(context.loc.three, "3");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: "${context.loc.three}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23),
                                  imagePath: "assets/images/btn1.png"),
                            ),
                            Bouncing(
                              onPress: () {
                                onclick(".", ".");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: ".",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23),
                                  imagePath: "assets/images/btn1.png"),
                            ),
                          ],
                        ),
                        Bouncing(
                          onPress: () {
                            onclick("+", "+");
                          },
                          child: clickableContainer(
                              onTap: () {},
                              width: 20.w,
                              height: 14.4.h,
                              text: "+",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                              imagePath: "assets/images/btn3.png"),
                        ),
                        Column(
                          children: [
                            Bouncing(
                              onPress: () {
                                onclick("M+", "M+");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: "M+",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  imagePath: "assets/images/btn2.png"),
                            ),
                            Bouncing(
                              onPress: () {
                                onclick("=", "=");
                              },
                              child: clickableContainer(
                                  onTap: () {},
                                  width: 20.w,
                                  height: 7.2.h,
                                  text: "=",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                  imagePath: "assets/images/btn4.png"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
        ),
          ],
        ),
      ),
    );
  }

  Widget clickableContainer({
    VoidCallback? onTap,
    double? height,
    double? width,
    String? imagePath,
    String? text,
    TextStyle? style,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage(imagePath!),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: style,
          ),
        ),
      ),
    );
  }
}

class LenguageSelectionBottomSheet extends StatefulWidget {
  const LenguageSelectionBottomSheet({super.key});

  @override
  State<LenguageSelectionBottomSheet> createState() =>
      _LenguageSelectionBottomSheetState();
}

class _LenguageSelectionBottomSheetState
    extends State<LenguageSelectionBottomSheet> {
  Calculator_Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 4.h,
                width: 8.7.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                itemCount: controller.lang.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 1.0),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        border: controller.lang[index].isselect == true
                            ? Border.all(color: Colors.white)
                            : Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            for (int i = 0; i < controller.lang.length; i++) {
                              controller.lang[i].isselect = false;
                            }
                            controller.lang[index].isselect = true;
                            setState(() {});

                            Locale locale = await setLocale(
                                controller.lang[index].languageCode!);
                            MyApp.setLocale(context, locale);

                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 60,
                            child: Center(
                              child: Text(
                                "${controller.lang[index].flag}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.lang[index].name}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}

class Keypad_Model_Screen extends StatefulWidget {
  const Keypad_Model_Screen({super.key});

  @override
  State<Keypad_Model_Screen> createState() => _Keypad_Model_ScreenState();
}

class _Keypad_Model_ScreenState extends State<Keypad_Model_Screen> {
  Calculator_Controller controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 55.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Keypad Mode",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/right.png",
                              height: 30.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Container(width: 5.w,
                                  child: Radio<String>(
                                    activeColor: Colors.blue,
                                    value: 'Option 1',
                                    groupValue: controller.selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.selectedValue = value!;
                                        controller.modetrue.value = false;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Right",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/left.png",
                              height: 30.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Container(width: 5.w,
                                  child: Radio<String>(
                                    activeColor: Colors.blue,
                                    mouseCursor: MouseCursor.defer,
                                    value: 'Option 2',
                                    groupValue: controller.selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.selectedValue = value!;
                                        controller.modetrue.value = true;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Left",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            await controller.saveSelectedValue(controller.selectedValue);
                            print('Selected Value: $controller.selectedValue');
                             setState(() {
                              Get.back();
                            });
                          },
                          child: Container(
                            height: 5.5.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade500,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("Done", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../class/language.dart';

class Calculator_Controller extends GetxController {
  RxBool dark = false.obs;
  RxBool buttonEfact = false.obs;
  RxString display="".obs;
  RxString updatevalue="".obs;
  RxString displayEnglish="".obs;
  RxString displayOprater="".obs;
  RxString prevOpertor="".obs;
  RxString prevOpertor2="".obs;
  RxString m ="".obs;
  RxList<String> value =<String>[].obs;
  RxList operator =[].obs;
  RxList grandTotal =[].obs;
  RxDouble result = 0.0.obs;
  RxDouble memory = 0.0.obs;
  RxDouble currentValue = 0.0.obs;
  RxDouble percentage =0.0.obs;
  RxDouble currentSliderValue = 2.0.obs;
  RxDouble gstAmount =0.0.obs;
  RxList<String> histary =<String>[].obs;
  RxString IGST ="".obs;
  RxDouble SGST =0.0.obs;
  RxDouble CGST =0.0.obs;
  RxBool modetrue = false.obs;
  String selectedValue = "Option 1";
  late SharedPreferences _prefs;


  RxList<Language_Calss> lang=<Language_Calss>[].obs;
  void toggleTheme(value) {
    dark.value = value;
    updateTheme();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    lang.value=<Language_Calss>[
      Language_Calss(id: 1, flag: "🇮🇳", name: "ગુજરાતી", languageCode: "gu",isselect: false),
      Language_Calss(id: 2, flag: "🇺🇸", name: "English", languageCode: "en",isselect: false),
      Language_Calss(id: 3, flag: "🇸🇦",name:  "اَلْعَرَبِيَّةُ", languageCode: "ar",isselect: false),
      Language_Calss(id: 4, flag: "🇮🇳",name:  "हिंदी",languageCode:  "hi",isselect: false)
    ];


  }

  void updateTheme() {
    Get.changeThemeMode(dark.value ? ThemeMode.dark : ThemeMode.light);
  }

  void buttonEfect()
  {
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

apply plugin: 'com.google.gms.google-services'
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gst_calculator/calculator/controller/calculator_controller.dart';
import 'package:gst_calculator/calculator/view/bouncing_button.dart';
import 'package:gst_calculator/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../class/language_constants.dart';

class Calculator_Home extends StatefulWidget {
  const Calculator_Home({super.key});

  @override
  State<Calculator_Home> createState() => _Calculator_HomeState();
}

class _Calculator_HomeState extends State<Calculator_Home> {
  Calculator_Controller controller = Get.find();
  ScrollController scrollcontroller = ScrollController();

  bool onetime = false;
  bool onetime2 = false;
  bool onetime3 = false;
  String display = "";
  bool gst = false;
  String twonumber = "";
  String gstnumber = "";
  String gstoperator = "";
  bool dotAdded = false;
  bool dotAdded2 = false;
  bool dotcheck = false;
  bool update = false;
  bool check = false;
  bool mrprint = false;
  bool rootprint = false;

  @override
  void initState() {
    controller.value.clear();
    super.initState();
  }

  void scrolle() {
    scrollcontroller.animateTo(scrollcontroller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  double subtractAndRound(double value1, double value2) {
    print("value1$value1");
    print("value2$value2");
    double result = value1 - value2;
    print("===========$result==================");
    // Find the maximum number of decimal places in the input values
    int maxDecimalPlaces = (value1.toString().split('.').length == 2 ||
            value2.toString().split('.').length == 2)
        ? (value1.toString().split('.').length >
                value2.toString().split('.').length
            ? value1.toString().split('.')[1].length
            : value2.toString().split('.')[1].length)
        : 0;

    // Round the result to the maximum number of decimal places found
    return double.parse((result).toStringAsFixed(maxDecimalPlaces));
  }

  void loadValueListFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      controller.value.value = prefs.getStringList('valueList') ?? [];
    });
  }

  double calculateTotal(List<String> values) {
    double total = 0.0;

    for (int i = 0; controller.grandTotal.length > i; i++) {
      total += controller.grandTotal[i];
    }
    return total;
  }

  onclick(String number, String click) async {
    switch (click) {
      case ".":
        {
          if (!dotAdded) {
            scrolle();
            print("dotAdded${dotAdded}");
            dotAdded = true;
            dotAdded2 = true;
            dotcheck = true;
            print("dotAdded2 ${dotAdded}");
            controller.display.value += click;
            controller.displayEnglish.value += click;
          }
          break;
        }
      case "0":
      case "00":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        if ((controller.display.value == "0" ||
                controller.display.value == "00") &&
            (number == "0" || number == "00")) {
          controller.display.value = "0";

          return;
        }
        if (controller.display.value == "" && (number == "00")) {
          number = "0";
        }
        if (controller.displayOprater.value == "M+" ||
            controller.displayOprater.value == "M-") {
          display = controller.display.value + controller.prevOpertor.value;
          print("display$display");
          controller.display.value = "";
          controller.displayEnglish.value = "";
        }

        if (onetime3 == true) {
          if (controller.displayOprater.value == "MU") {
            onetime3 == true;
            print("MMMMMMMMMMMMMMMMM3");
            controller.display.value = "";
            controller.displayEnglish.value = "";
          }
        } else {
          if (onetime2 == true) {
            if (controller.displayOprater.value == "MU") {
              onetime2 == true;
              check = true;
              print("MMMMMMMMMMMMMMMMM1");
              controller.display.value = "";
              controller.displayEnglish.value = "";
            }
          } else {
            if (controller.displayOprater.value == "MU") {
              print("MMMMMMMMMMMMMMMMM2");
              onetime = true;
              check = false;
              onetime2 == false;
              controller.display.value = "";
              controller.displayEnglish.value = "";
            }
          }
        }

        if (rootprint == true) {
          controller.display.value = "";
        }
        controller.displayOprater.value = "";

        if (update == true) {
          print("Update diplay ${controller.display.value}");
          print("Update diplay + number ${controller.display.value + number}");
          print("jhdjkh${controller.updatevalue.value}");
          controller.updatevalue.value = controller.display.value + number;
          print("jhdjkh${controller.updatevalue.value}");
          print("jhdjkh${controller.prevOpertor.value}");
        }

        controller.display.value.length < 12
            ? controller.display.value = controller.display.value + number
            : controller.display.value;

        if (controller.display.value == "01" ||
            controller.display.value == "02" ||
            controller.display.value == "03" ||
            controller.display.value == "04" ||
            controller.display.value == "05" ||
            controller.display.value == "06" ||
            controller.display.value == "07" ||
            controller.display.value == "08" ||
            controller.display.value == "09") {
          controller.display.value =
              controller.display.value.replaceFirst('0', '');
        }
        scrolle();
        controller.displayEnglish.value =
            controller.displayEnglish.value + click;
        break;
      case "AC":
        onetime = false;
        onetime2 = false;
        onetime3 = false;
        print(onetime);
        dotAdded = false;
        dotAdded2 = false;
        dotcheck = false;
        rootprint = false;
        check = false;
        controller.display.value = "";
        controller.displayEnglish.value = "";
        controller.value.clear();
        controller.prevOpertor.value = "";
        gstnumber = "";
        controller.memory.value = 0.0;
        controller.result.value = 0.0;
        display = "";
        mrprint = false;
        gst = false;
        update = false;
        controller.displayOprater.value = "";
        controller.operator.clear();

        controller.grandTotal.clear();
        break;
      case "DE":
        scrolle();
        dotAdded = false;
        print("Update DE ${controller.display.value}");
        if (controller.display.value.isNotEmpty) {
          print("Update DE2 ${controller.display.value}");
          controller.display.value = controller.display.value
              .substring(0, controller.display.value.length - 1);
          print("Update DE3 ${controller.display.value}");
        }
        print("Update displayEnglish DE1 ${controller.displayEnglish.value}");
        controller.displayEnglish.value = controller.displayEnglish.value
            .substring(0, controller.displayEnglish.value.length - 1);
        print("Update displayEnglish DE2 ${controller.displayEnglish.value}");
        update = true;
        break;

      case "+3%":
      case "+5%":
      case "+12%":
      case "+18%":
      case "+GST":
        if (controller.displayEnglish.value.isEmpty) {
        } else {
          controller.currentValue.value = double.parse(controller.displayEnglish.value);
          if (click == "+3%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+3%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.03;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "3%";
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator  ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 1.5%   ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 1.5%   ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value = controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;

            print(controller.percentage.value);
            controller.prevOpertor.value = number;
            controller.prevOpertor2.value = number;
            print(controller.prevOpertor.value);
            controller.currentValue.value = 0.0;
            controller.gstAmount.value = 0.0;
            controller.percentage.value = 0.0;
            controller.result.value =0.0;
            controller.display.value = "";
          } else if (click == "+5%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+5%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.05;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value = (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "5%";
            twonumber = controller.gstAmount.value.toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("CGST 2.5%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("SGST 2.5%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
            controller.prevOpertor2.value = number;
            print(controller.percentage.value);
          } else if (click == "+12%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+12%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.12;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "12%";
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("CGST 6%     ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 6%     ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
            controller.prevOpertor2.value = number;
            print(controller.percentage.value);
          } else if (click == "+18%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+18%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.18;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            gstoperator = "18%";
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 9%    ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 9%    ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
            controller.prevOpertor2.value = number;
            print(controller.percentage.value);
          } else if (click == "+GST") {
            scrolle();
            dotAdded = false;
            gst = true;
            print("currentValue ${controller.currentValue}");

            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
          }

          print(controller.currentValue.value);
          print(controller.result.value);
          controller.prevOpertor.value = "+GST";

          controller.display.value = "";
          controller.displayOprater.value = "";
          // controller.displayEnglish.value = controller.result.value.toString();
        }

        break;

      case "-3%":
      case "-5%":
      case "-12%":
      case "-18%":
      case "-GST":
        if (controller.displayEnglish.value.isEmpty) {
        } else {
          controller.currentValue.value =
              double.parse(controller.displayEnglish.value);

          if (click == "-3%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-3%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.03;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;

            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            gstoperator = "3%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 1.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 1.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
            print(" ============= ${controller.result.value} ");
          } else if (click == "-5%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-5%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.05;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;
            controller.result.value = controller.percentage.value / 2;
            gst = true;
            gstoperator = "5%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 2.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST 2.5%    $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
            print(" ============= ${controller.result.value} ");
          } else if (click == "-12%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-12%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.12;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;
            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            gstoperator = "12%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            String digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("CGST 6%     $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("SGST 6%     $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
          } else if (click == "-18%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-18%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value = double.parse(controller.display.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            controller.percentage.value = controller.currentValue.value * 0.18;
            print("percentage ${controller.percentage.value}");
            print(" ============= $number ");
            gstoperator = number;
            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            gstoperator = "18%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            String digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("CGST 9%      $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("SGST 9%      $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("Total Amount  = $twonumber");
            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
          } else if (click == "-GST") {
            dotAdded = false;
            gst = true;
            print("currentValue ${controller.currentValue}");

            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();

            controller.prevOpertor.value = "-GST";
          }

          print(controller.currentValue.value);
          print(controller.result.value);

          controller.display.value = "";
        }
        break;
      case "MR":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          print(controller.memory.value.toString());
          if (mrprint == true) {
            if (update == true) {
              controller.display.value = controller.display.value
                  .replaceAll("MR+", "")
                  .replaceAll("MR-", "")
                  .replaceAll("MR*", "")
                  .replaceAll("MR/", "");
              print("iiiiii");
            } else {
              if (controller.memory.value == 0.0) {
              } else {
                controller.display.value = controller.memory.value.toString();
                print("eeeeeeeeeee");
              }
            }
            controller.prevOpertor.value = "MR";
          } else {
            controller.display.value = "";
            controller.value.clear();
          }

          break;
        }
      case "M-":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            if (controller.value.isEmpty) {
            } else {
              controller.display.value = controller.value[0]
                  .replaceAll(controller.value[0], controller.value[0]);
              print(" controller.display.value${controller.display.value}");
              controller.value.clear();
            }
          } else {
            controller.memory.value =
                double.parse(controller.displayEnglish.value);
          }
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M-";
          controller.m.value = "M-";
          break;
        }

      case "M+":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            if (controller.value.isEmpty) {
            } else {
              controller.display.value = controller.value[0]
                  .replaceAll(controller.value[0], controller.value[0]);
              print(" controller.display.value${controller.display.value}");
              controller.display.value.isEmpty
                  ? ""
                  : controller.memory.value =
                      double.parse(controller.display.value);
              controller.value.clear();
            }
          } else {
            controller.memory.value =
                double.parse(controller.displayEnglish.value);
          }
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M+";
          controller.m.value = "M+";
          break;
        }
      case "MU":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "MU";
          if (controller.prevOpertor2.value == "+3%" ||
              controller.prevOpertor2.value == "+5%" ||
              controller.prevOpertor2.value == "+12%" ||
              controller.prevOpertor2.value == "+18%" ||
              controller.prevOpertor2.value == "-3%" ||
              controller.prevOpertor2.value == "-5%" ||
              controller.prevOpertor2.value == "-12%" ||
              controller.prevOpertor2.value == "-18%") {
            print("yyyyyyyyy");
          } else {
            print("nnnnnnnnnnnn");
            if (controller.display.value.isEmpty) {
              if (controller.displayOprater.value.isNotEmpty) {
                onetime2 = true;
                if (controller.value.isEmpty) {
                } else {
                  controller.display.value = controller.value[0]
                      .replaceAll(controller.value[0], controller.value[0]);
                  controller.value.clear();
                  controller.value.add(controller.display.value +
                      controller.displayOprater.value);
                  controller.saveValueListToPrefs();
                }
              }
            } else {
              if (controller.value.isEmpty) {
                print("-------------");
                onetime3 = true;
                controller.displayOprater.value = number;
                controller.value.add(
                    controller.display.value + controller.displayOprater.value);
                controller.saveValueListToPrefs();
              } else {
                onetime3 = false;
                display = controller.display.value;
                controller.display.value = controller.value[2];
                controller.displayOprater.value = number;
                controller.value.add(controller.displayEnglish.value +
                    controller.displayOprater.value);
                controller.saveValueListToPrefs();
              }
            }
          }

          break;
        }
      case "undo":
        {
          // Assuming this is a function call to scroll somewhere
          dotAdded = false; // Resetting a flag maybe?

          if (controller.value.isNotEmpty) {
            controller.displayOprater.value = "";
            if (gst == true) {
            } else {
              scrolle();
              if (!controller.value[controller.value.length - 1]
                  .contains("=")) {
                String lastEntry = controller.value.removeLast();

                controller.prevOpertor.value = lastEntry[
                    0]; // Assuming the first character denotes the operator

                controller.display.value = lastEntry;
                controller.displayEnglish.value = lastEntry;
                print(
                    "Updated the display to the last entry: ${controller.display.value}");
              } else {
                print("Cannot undo because the last entry contains '='.");
                controller.value.removeAt(controller.value.length - 1);
                String lastEntry = controller.value.removeLast();
                controller.prevOpertor.value = lastEntry[0];
                controller.display.value = lastEntry;
                controller.displayEnglish.value = lastEntry;
                print(
                    "Updated the display to the last entry: ${controller.display.value}");
              }
            }
          }
          break;
        }
      case "GT":
        {
          scrolle();
          dotAdded = false;
          if (number == "0.0") {
          } else {
            controller.value.add("= " + number.toString() + " GT");
            controller.saveValueListToPrefs();
          }
          break;
        }
      case "%":
        {
          scrolle();
          dotAdded = false;
          if (onetime3 == false) {
            if (check == false) {
              print("fffffffffffffff");
              scrolle();
              dotAdded = false;
              if (onetime2 == true) {
                print("onetime2");
              } else {
                print("one time ===");
                print(controller.prevOpertor.value);
                if (onetime == false) {
                  if (controller.prevOpertor.value == "+") {
                    print("onetime");
                    String display = controller.display.value;
                    print(display);
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");

                      double percentageValue =
                          controller.currentValue.value * double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue ${percentageValue}");
                      double newValue =
                          controller.currentValue.value + percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = newValue.toString();

                      controller.displayEnglish.value = newValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  } else if (controller.prevOpertor.value == "-") {
                    String display = controller.display.value;
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue =
                          controller.currentValue.value * double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue $percentageValue");
                      double newValue =
                          controller.currentValue.value - percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = newValue.toString();

                      controller.displayEnglish.value = newValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  } else if (controller.prevOpertor.value == "*") {
                    String display = controller.display.value;
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue =
                          controller.currentValue.value * double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue $percentageValue");
                      print('************');
                      double newValue =
                          controller.currentValue.value * percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = percentageValue.toString();

                      controller.displayEnglish.value =
                          percentageValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  } else if (controller.prevOpertor.value == "/") {
                    String display = controller.display.value;
                    if (display.isEmpty) {
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value);
                      controller.saveValueListToPrefs();
                      print(controller.value);
                      print("currentValue ${controller.currentValue.value}");
                      controller.currentValue.value =
                          double.parse(controller.value[0]);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue =
                          controller.currentValue.value / double.parse(display);
                      print("percentageValue $percentageValue");
                      percentageValue *= 100;
                      print("percentageValue $percentageValue");
                      double newValue =
                          controller.currentValue.value / percentageValue;

                      print("newValue $newValue");
                      // Update the display with the new value
                      controller.display.value = percentageValue.toString();

                      controller.displayEnglish.value =
                          percentageValue.toString();
                      controller.displayOprater.value = "=";
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  }
                  print("tum");
                  print(controller.displayEnglish);
                } else if (onetime == true) {
                  if (update == true) {
                    print("========= update +++++++++++");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();

                    controller.updatevalue.value =
                        controller.updatevalue.value.substring(1);
                    controller.displayEnglish.value =
                        controller.displayEnglish.value.substring(1);
                    print(controller.display.value);
                    print("jhdjkh${controller.updatevalue.value}");
                    display = controller.value[3].replaceAll("MU", "");
                    controller.currentValue.value = double.parse(display);
                    print("currentValue ${controller.currentValue.value}");

                    double percentageValue =
                        controller.currentValue.value * 100;
                    print("percentageValue $percentageValue");
                    print("display ${controller.display.value}");
                    double r = 100 -
                        double.parse(
                            controller.display.value.replaceAll("%", ""));
                    print(percentageValue);
                    print(r);
                    double r1 = percentageValue / r;
                    print(r1);
                    controller.prevOpertor.value = "=";
                    controller.value
                        .add(controller.prevOpertor.value + r1.toString());
                    controller.saveValueListToPrefs();
                    print(controller.value);
                    controller.display.value = "";
                    controller.displayOprater.value = "";
                    scrolle();
                  } else {
                    controller.prevOpertor.value = "=";
                    print("tttttttttttttttttttttttttttt");
                    controller.displayOprater.value = number;
                    print(controller.displayOprater.value);
                    print(" 4000000000000000000${controller.display.value}");
                    print("4444444444444$display");

                    controller.value.add(controller.displayOprater.value +
                        controller.display.value);

                    controller.currentValue.value = double.parse(display);
                    print("currentValue ${controller.currentValue.value}");
                    double percentageValue =
                        controller.currentValue.value * 100;
                    print("percentageValue $percentageValue");
                    double r = 100 - double.parse(controller.display.value);
                    print(percentageValue);
                    print(r);
                    double r1 = percentageValue / r;
                    print(r1);
                    controller.value
                        .add(controller.prevOpertor.value + r1.toString());
                    controller.saveValueListToPrefs();
                    print(controller.value);
                    controller.display.value = "";
                    controller.displayOprater.value = "";
                  }
                }
              }
            }
          } else {
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value[0].replaceAll("MU", "");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              print("display ${controller.display.value}");
              double r = 100 -
                  double.parse(controller.display.value.replaceAll("%", ""));
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.prevOpertor.value = "=";
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
              scrolle();
            } else {
              print("yes");
              controller.prevOpertor.value = "=";
              print("onetime3 tttttttttttttttttttttttttttt");
              controller.displayOprater.value = number;
              print(controller.displayOprater.value);
              print(" 4000000000000000000${controller.display.value}");
              print("4444444444444${controller.value[0].replaceAll("MU", "")}");
              display = controller.value[0].replaceAll("MU", "");
              controller.value.add(
                  controller.displayOprater.value + controller.display.value);

              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              double r = 100 - double.parse(controller.display.value);
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
            }
          }

          if (check == true) {
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value[0].replaceAll("MU", "");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              print("display ${controller.display.value}");
              double r = 100 -
                  double.parse(controller.display.value.replaceAll("%", ""));
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.prevOpertor.value = "=";
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
              scrolle();
            } else {
              print("true");
              controller.prevOpertor.value = "=";
              print("check tttttttttttttttttttttttttttt");
              controller.displayOprater.value = number;
              print(controller.displayOprater.value);
              print(" 4000000000000000000${controller.display.value}");
              print("4444444444444${controller.value[0].replaceAll("MU", "")}");
              display = controller.value[0].replaceAll("MU", "");
              controller.value.add(
                  controller.displayOprater.value + controller.display.value);

              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              double r = 100 - double.parse(controller.display.value);
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
            }
          }
          break;
        }
      case "root":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
          } else {
            rootprint = true;
            double currentValue = double.parse(controller.displayEnglish.value);

            if (currentValue >= 0) {
              double squareRoot = sqrt(currentValue);

              controller.display.value = squareRoot.toString();
              double secoundvalue = double.parse(controller.display.value);
              controller.display.value = secoundvalue.toStringAsFixed(3);
              controller.displayEnglish.value = squareRoot.toString();
            } else {
              controller.display.value = "Error";
              controller.displayEnglish.value = "Error";
            }
          }

          break;
        }
      case "/":
        {
          scrolle();
          dotAdded = false;

          if (controller.displayEnglish.value.isEmpty) {
            controller.displayOprater.value = number;
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print(
                  "MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR${controller.displayEnglish.value}");
              if (controller.value.isEmpty) {
              } else {
                if (controller.value[0].contains("M+")) {
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  controller.display.value = "";
                  controller.displayEnglish.value = "";
                  controller.prevOpertor.value = "/";
                  controller.prevOpertor2.value = "/";
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.prevOpertor.value = "/";
                print(controller.value[0]);
                controller.result.value = double.parse(controller.value[0]);
              }
            }
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              controller.displayOprater.value = number;
              if (controller.prevOpertor.value == "+") {
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                if (controller.prevOpertor.value == "M+" ||
                    controller.prevOpertor.value == "M-") {
                  controller.prevOpertor.value = "/";
                  controller.value.add(controller.display.value);
                } else {
                  controller.value.add(controller.display.value);
                }
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              controller.saveValueListToPrefs();
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                controller.memory.value = double.parse(
                    display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.prevOpertor.value = "/";
              controller.prevOpertor2.value = "/";
            }
          }

          break;
        }
      case "*":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            controller.displayOprater.value = number;
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print(
                  "MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR${controller.displayEnglish.value}");
              if (controller.value.isEmpty) {
              } else {
                if (controller.value[0].contains("M+")) {
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  controller.display.value = "";
                  controller.displayEnglish.value = "";
                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = "*";
                  controller.prevOpertor2.value = "*";
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.prevOpertor.value = "*";
                print(controller.value[0]);
                controller.result.value = double.parse(controller.value[0]);
              }
            }
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              controller.displayOprater.value = number;
              print("cjhj2 ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "+") {
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                if (controller.prevOpertor.value == "M+" ||
                    controller.prevOpertor.value == "M-") {
                  controller.value.add(controller.display.value);
                } else {
                  controller.value.add(controller.display.value);
                }
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              controller.saveValueListToPrefs();
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                display.isEmpty
                    ? ""
                    : controller.memory.value = double.parse(
                        display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "*";
              controller.prevOpertor2.value = "*";
            }
          }
          break;
        }
      case "-":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            controller.displayOprater.value = number;
            print(
                "controller.displayEnglish.value3 ${controller.display.value}");
            print("== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print(
                  "MMMMMMMMMMMMMRRRRRRRRRR  RRRRRRR${controller.displayOprater.value}");
              if (controller.value.isEmpty) {
              } else {
                if (controller.value[0].contains("M+")) {
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  controller.display.value = "";
                  controller.displayEnglish.value = "";
                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = "-";
                  controller.prevOpertor2.value = "-";
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.prevOpertor.value = "-";
                print("------");
                controller.displayOprater.value = number;
                print(controller.value[0]);
                controller.result.value = double.parse(controller.value[0]);
              }
            }
            print(controller.result.value);
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              controller.displayOprater.value = number;
              print("cjhj3 ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "+") {
                print(
                    "controller.displayEnglish.value2 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                if (controller.prevOpertor.value == "M+" ||
                    controller.prevOpertor.value == "M-") {
                  controller.prevOpertor.value = "-";
                  controller.value.add(controller.display.value);
                } else {
                  controller.value.add(controller.display.value);
                }
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }

              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                controller.memory.value = double.parse(
                    display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "-";
              controller.prevOpertor2.value = "-";
            }
          }
          break;
        }
      case "+":
        {
          dotAdded = false;
          scrolle();
          print("==+== ${controller.display.value}");

          if (controller.displayEnglish.value.isEmpty) {
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            if (controller.value.isEmpty) {
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.result.value = double.parse(controller.value[0]);
              }

              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "+";
              controller.prevOpertor2.value = "+";
            }
          } else {
            if (controller.prevOpertor.value == "MU") {
              print("cjhhfghfjMU ${controller.prevOpertor.value}");
            } else {
              print("cjhj ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "+") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "=") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "+GST") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
              if (controller.prevOpertor.value == "=" ||
                  controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                print("ppppp1");
                controller.value.add(controller.display.value);
                controller.saveValueListToPrefs();
              } else {
                print("ppppp2");
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                display.isEmpty
                    ? ""
                    : controller.memory.value = double.parse(
                        display.replaceAll("M+", "").replaceAll("M-", ""));
              }
              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "+";
              controller.prevOpertor2.value = "+";
            }
          }

          break;
        }
      case "=":
        {
          scrolle();
          controller.displayOprater.value = number;
          if (controller.prevOpertor.value == "+") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) +
                    double.parse(controller.updatevalue.value);
              } else {
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  total += elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              print("+++++++++++");

              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11");
                }
                print(controller.displayEnglish.value);
                print(controller.result.value);
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(
                      controller.displayOprater.value + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "-") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) -
                    double.parse(controller.updatevalue.value);
              } else {
                double total = 0.0;
                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  print("elementValue: $elementValue");
                  total -= elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                }

                controller.result.value = subtractAndRound(
                    controller.result.value,
                    double.parse(controller.display.value));
                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(
                      controller.displayOprater.value + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "*") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) *
                    double.parse(controller.updatevalue.value);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(controller.value[i]);
                    total += elementValue;
                    print("1elementValue: $elementValue");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(controller.value[i]);
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        controller.value[i].replaceAll(RegExp('[*+-./]'), ''));
                    total *= elementValue;
                    print("3elementValue: $elementValue");
                  }
                }
                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11");
                }
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(
                      controller.displayOprater.value + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "/") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) /
                    double.parse(controller.updatevalue.value);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(controller.value[i]);
                    total += elementValue;
                    print("1elementValue: $elementValue");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(controller.value[i]);
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        controller.value[i].replaceAll(RegExp('[*+-./]'), ''));
                    total /= elementValue;
                    print("3elementValue: $elementValue");
                  }
                }
                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              if (controller.displayEnglish.value.isEmpty) {
                controller.displayOprater.value = controller.prevOpertor.value;
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(controller.display.value);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                    dotcheck = true;
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11");
                }
                print("jjjjjjjj11${controller.result.value}");
                print("jjjjjjjj11${controller.displayEnglish.value}");
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
                print("jjjjjjjj11${controller.result.value}");

                twonumber = controller.result.value.toStringAsFixed(0);
                print(twonumber);
                print(dotAdded);
                if (dotAdded == true && dotcheck == true) {
                  print("ddddddddddd");
                  bool containsDecimal = false;

                  for (String value in controller.value) {
                    if (value.contains(".")) {
                      containsDecimal = true;
                      break;
                    }
                  }

                  if (containsDecimal) {
                    print("iiiiiiiii");
                    controller.value.add(controller.displayOprater.value +
                        controller.result.value.toString());
                  } else {
                    print("eeeeeeeee");
                    controller.value.add(
                        controller.displayOprater.value + twonumber.toString());
                  }
                  controller.saveValueListToPrefs();
                  scrolle();
                } else {
                  controller.value.add(controller.displayOprater.value +
                      controller.result.value.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                }
              }
            }
          } else if (controller.prevOpertor.value == "MU") {
            scrolle();
            controller.value
                .add(controller.prevOpertor.value + controller.display.value);
          } else if (controller.prevOpertor.value == "+GST") {
            scrolle();
            double secoundvalue = double.parse(controller.display.value);
            twonumber = secoundvalue.toStringAsFixed(0);
            controller.percentage.value =
                controller.currentValue.value * 0 + secoundvalue;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("IGST ${controller.display.value}%   $twonumber");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            controller.value.add(
                "CGST ${controller.CGST.value}%   ${controller.CGST.value}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            controller.value.add(
                "SGST ${controller.SGST.value}%   ${controller.SGST.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add("Total Amount = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;

            print(controller.percentage.value);
            print("==${controller.currentValue.value}");
          } else if (controller.prevOpertor.value == "-GST") {
            scrolle();
            print(controller.display.value);
            double secoundvalue = double.parse(controller.display.value);
            twonumber = secoundvalue.toStringAsFixed(0);
            print("kjvkljf $twonumber");
            controller.percentage.value =
                controller.currentValue.value * 0 + secoundvalue;
            print("percentage ${controller.percentage.value}");
            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("IGST ${controller.display.value}%   $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("CGST ${controller.result.value}%    $twonumber");
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value
                .add("SGST ${controller.result.value}%    $twonumber");
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("GST  = $twonumber");
            controller.saveValueListToPrefs();
            print(" ============= ${controller.result.value} ");
            print("currentValue ${controller.currentValue}");
            print("==${controller.currentValue.value}");
          } else if (controller.prevOpertor.value == "update") {
            print("========= update ==========");

            print("jhdjkh${controller.updatevalue.value}");
          } else if (controller.prevOpertor.value == "MR") {
            if (update == true) {
              print("========= update +++++++++++");
              print("========= update ${controller.display.value}");
              controller.value.add(controller.prevOpertor.value +
                  controller.prevOpertor2.value +
                  controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value[0]
                  .replaceAll("M+", "")
                  .replaceAll("M-", " ");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              print("prevOpertor ${controller.updatevalue.value}");
              if (controller.m.value == "M-") {
                if (controller.prevOpertor2.value == "+") {
                  controller.result.value = controller.currentValue.value -
                      double.parse(
                          controller.updatevalue.value.replaceAll("R+ - ", ""));
                }
                if (controller.prevOpertor2.value == "-") {
                  controller.result.value = controller.currentValue.value +
                      double.parse(
                          controller.updatevalue.value.replaceAll("R- - ", ""));
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = controller.currentValue.value *
                      double.parse(
                          controller.updatevalue.value.replaceAll("R* -", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = controller.currentValue.value /
                      double.parse(
                          controller.updatevalue.value.replaceAll("R/ -", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
                controller.display.value = "";
                controller.displayOprater.value = "";
              } else {
                if (controller.prevOpertor2.value == "+") {
                  print("prevOpertor1 ${controller.updatevalue.value}");
                  controller.result.value = controller.currentValue.value +
                      double.parse(
                          controller.updatevalue.value.replaceAll("R+", ""));
                  print("prevOpertor2 ${controller.updatevalue.value}");
                }
                if (controller.prevOpertor2.value == "-") {
                  print("prevOpertor3 ${controller.currentValue.value}");
                  controller.result.value = controller.currentValue.value -
                      double.parse(
                          controller.updatevalue.value.replaceAll("R-", ""));
                  print("prevOpertor4 ${controller.currentValue.value}");
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = controller.currentValue.value *
                      double.parse(
                          controller.updatevalue.value.replaceAll("R*", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = controller.currentValue.value /
                      double.parse(
                          controller.updatevalue.value.replaceAll("R/", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
                controller.display.value = "";
                controller.displayOprater.value = "";
              }
            } else {
              print("M+M_");
              print("M+M_${controller.m.value}");
              if (controller.m.value == "M-") {
                print("M--------------");
                controller.value.add(controller.prevOpertor.value +
                    controller.prevOpertor2.value +
                    " - " +
                    display.replaceAll("M+", "").replaceAll("M-", ""));
                controller.saveValueListToPrefs();
                if (controller.prevOpertor2.value == "+") {
                  controller.result.value = double.parse(controller.value[0]) -
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "-") {
                  controller.result.value = double.parse(controller.value[0]) +
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = double.parse(controller.value[0]) *
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = double.parse(controller.value[0]) /
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
              } else {
                print("M+++++++++++");

                controller.value.add(controller.prevOpertor.value +
                    controller.prevOpertor2.value +
                    display.replaceAll("M+", "").replaceAll("M-", ""));
                controller.saveValueListToPrefs();
                if (controller.prevOpertor2.value == "+") {
                  controller.result.value = double.parse(controller.value[0]) +
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "-") {
                  controller.result.value = double.parse(controller.value[0]) -
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = double.parse(controller.value[0]) *
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "/") {
                  controller.result.value = double.parse(controller.value[0]) /
                      double.parse(
                          display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    controller.result.value.toString());
                controller.saveValueListToPrefs();
              }
              print(controller.value);
            }
          }
          print("jjjjjjjj");
          controller.display.value = "";
          controller.grandTotal.add(controller.result.value);
          controller.operator.add(controller.displayOprater.value);
          controller.displayEnglish.value = "";
          controller.prevOpertor.value = "=";
          controller.saveValueListToPrefs();

          controller.result.value = 0.0;
          break;
        }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: controller.dark.value ? Colors.white : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.6.h),
          child: AppBar(
            backgroundColor:
                controller.dark.value ? Colors.black : Color(0xffE7E7E7),
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                    icon: Icon(Icons.menu));
              },
            ),
            centerTitle: true,
            title: controller.dark.value
                ? Container(
                    height: 5.2.h,
                    width: 35.w,
                    color: Colors.black,
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          "assets/images/more.png",
                          height: 3.h,
                          width: 10.w,
                        ),
                        Spacer(),
                        Text(
                          "More Tools",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 5.2.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 3.5.h,
                          width: 7.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.blueAccent)),
                          child: Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "More Tools",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
            actions: [
              controller.dark.value
                  ? Text("")
                  : Image.asset(
                      "assets/images/game_icon.png",
                      height: 4.h,
                    ),
              Image.asset(
                "assets/images/queen.png",
                height: 7.h,
              )
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: controller.dark.value ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GST OPTION",
                  style: TextStyle(
                    color: controller.dark.value
                        ? Colors.grey.shade300
                        : Colors.grey.shade900,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white38
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          SizedBox(
                            height: 4.h,
                            child: ClipRect(
                              child: Image.asset("assets/images/tools.png"),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "More Tools",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white38
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          SizedBox(
                            height: 4.h,
                            child: ClipRect(
                              child: Image.asset(
                                "assets/images/dark.png",
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Dark Theme",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Spacer(),
                          Switch(
                            value: controller.dark.value,
                            onChanged: (value) {
                              controller.toggleTheme(value);
                            },
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white38
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                            backgroundColor: Colors.white10,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheet(
                                backgroundColor: Colors.black.withOpacity(0.8),
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: LenguageSelectionBottomSheet());
                                },
                                onClosing: () {
                                  // Handle the closing of the bottom sheet
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 3.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.language),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Language",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white38
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                    minWidth:
                                        300, // Minimum width of the dialog
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 40, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Obx(
                                              () => Slider(
                                                value: controller
                                                    .currentSliderValue.value,
                                                min: 0,
                                                max: 5,
                                                divisions: 50,
                                                label: controller
                                                    .currentSliderValue.value
                                                    .toInt()
                                                    .toString(),
                                                onChanged: (double value) {
                                                  setState(() {
                                                    controller
                                                        .currentSliderValue
                                                        .value = value;
                                                    print(controller
                                                        .currentSliderValue
                                                        .value);
                                                    twonumber = controller
                                                        .currentSliderValue
                                                        .value
                                                        .toStringAsFixed(0);
                                                    print(twonumber);
                                                    controller
                                                            .currentSliderValue
                                                            .value =
                                                        double.parse(twonumber);
                                                    controller.value;
                                                  });
                                                },
                                              ),
                                            ),
                                            Obx(() => Text(
                                                'Value: ${controller.currentSliderValue.value}'))
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text("Close"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 3.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.language),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Raounder",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 7.h,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: scrollcontroller,
                physics: ClampingScrollPhysics(),
                itemCount: controller.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.value.length) {
                    return Container(
                      height: 8.h,
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        gst == true
                            ? Container(
                                width: 55.w,
                                decoration: controller.value[index].contains("=")
                                    ? BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(5))
                                    : BoxDecoration(),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${controller.value[index]} ",
                                    style: TextStyle(
                                        fontSize: controller.value[index].contains("=")
                                            ? 16
                                            : 15,
                                        fontWeight: controller.value[index]
                                                .contains("=")
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                        color: controller.dark.value
                                            ? Colors.black
                                            : Colors.black),
                                  ),
                                ),
                              )
                            : Container(
                          decoration: controller.value[index]
                              .contains("=")
                              ? BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5))
                              : BoxDecoration(),
                          child: Text(
                            " ${controller.value[index]} ",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.black
                                  : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 7.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffE7E7E7),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    onclick("", "AC");
                                    print("dwfwddeded");
                                  },
                                  child: Image.asset(
                                    "assets/images/ac.png",
                                    height: 5.h,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    onclick("", "undo");
                                  },
                                  child: Image.asset(
                                    "assets/images/undo.png",
                                    height: 4.h,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      maxLines: 1,
                                      "${controller.display}",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: controller.dark.value
                                              ? Colors.black
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.displayOprater.value == "="
                                        ? ""
                                        : controller.displayOprater.value,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: controller.dark.value
                                            ? Colors.black
                                            : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    onclick("", "DE");
                                  },
                                  child: Image.asset("assets/images/delet.png",
                                      height: 5.h),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 43, left: 145),
                        child: Container(
                          height: 1.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick("+${context.loc.three}%", "+3%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "+${context.loc.three}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+${context.loc.five}%", "+5%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "+${context.loc.five}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(
                              "+${context.loc.one}${context.loc.two}%", "+12%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            text: "+${context.loc.one}${context.loc.two}%",
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+${context.loc.one}${context.loc.eight}%",
                              "+18%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "+${context.loc.one}${context.loc.eight}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+GST", "+GST");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            text: "+GST",
                            imagePath: "assets/images/btn1.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick("-${context.loc.three}%", "-3%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.three}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-${context.loc.five}%", "-5%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.five}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(
                              "-${context.loc.one}${context.loc.two}%", "-12%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.one}${context.loc.two}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-${context.loc.one}${context.loc.eight}%",
                              "-18%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.one}${context.loc.eight}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-GST", "-GST");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-GST",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          double total = calculateTotal(controller.value);
                          onclick("${total}", "GT");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "GT",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("√x", "root");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "√x",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 19),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("%", "%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "%",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("÷", "/");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "÷",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("MR", "MR");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "MR",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            imagePath: "assets/images/btn2.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.seven, "7");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.seven}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.eight, "8");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.eight}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.nine, "9");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.nine}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("×", "*");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "×",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("MU", "MU");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "MU",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            imagePath: "assets/images/btn2.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.four, "4");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.four}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.five, "5");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.five}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.six, "6");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.six}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-", "-");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("M-", "M-");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "M-",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            imagePath: "assets/images/btn2.png"),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.one, "1");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.one}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.zero, "0");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.zero}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.two, "2");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.two}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.zero1, "00");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.zero1}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.three, "3");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.three}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick(".", ".");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: ".",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                        ],
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+", "+");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 14.4.h,
                            text: "+",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                            imagePath: "assets/images/btn3.png"),
                      ),
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick("M+", "M+");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "M+",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                imagePath: "assets/images/btn2.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick("=", "=");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "=",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                                imagePath: "assets/images/btn4.png"),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget clickableContainer({
    VoidCallback? onTap,
    double? height,
    double? width,
    String? imagePath,
    String? text,
    TextStyle? style,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage(imagePath!),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: style,
          ),
        ),
      ),
    );
  }
}

class LenguageSelectionBottomSheet extends StatefulWidget {
  const LenguageSelectionBottomSheet({super.key});

  @override
  State<LenguageSelectionBottomSheet> createState() =>
      _LenguageSelectionBottomSheetState();
}

class _LenguageSelectionBottomSheetState
    extends State<LenguageSelectionBottomSheet> {
  Calculator_Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 4.h,
                width: 8.7.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                itemCount: controller.lang.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 1.0),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        border: controller.lang[index].isselect == true
                            ? Border.all(color: Colors.white)
                            : Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            for (int i = 0; i < controller.lang.length; i++) {
                              controller.lang[i].isselect = false;
                            }
                            controller.lang[index].isselect = true;
                            setState(() {});

                            Locale locale = await setLocale(
                                controller.lang[index].languageCode!);
                            MyApp.setLocale(context, locale);

                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 60,
                            child: Center(
                              child: Text(
                                "${controller.lang[index].flag}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.lang[index].name}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}

 import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gst_calculator/calculator/controller/calculator_controller.dart';
import 'package:gst_calculator/calculator/view/bouncing_button.dart';
import 'package:gst_calculator/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../class/language_constants.dart';

class Calculator_Home extends StatefulWidget {
  const Calculator_Home({super.key});

  @override
  State<Calculator_Home> createState() => _Calculator_HomeState();
}

class _Calculator_HomeState extends State<Calculator_Home> {
  Calculator_Controller controller = Get.find();
  ScrollController scrollcontroller = ScrollController();
  bool onetime = false;
  bool onetime2 = false;
  bool onetime3 = false;
  String display = "";
  bool gst = false;
  String twonumber = "";
  String gstnumber = "";
  String gstoperator = "";
  bool dotAdded = false;
  bool update = false;
  bool check = false;

  @override
  void initState() {
    controller.value.clear();
    super.initState();
  }

  void scrolle() {
    scrollcontroller.animateTo(scrollcontroller.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  double subtractAndRound(double value1, double value2) {
    print("value1${value1}");
    print("value2${value2}");
    double result = value1 - value2;
    print("===========${result}==================");
    // Find the maximum number of decimal places in the input values
    int maxDecimalPlaces = (value1.toString().split('.').length == 2 ||
            value2.toString().split('.').length == 2)
        ? (value1.toString().split('.').length >
                value2.toString().split('.').length
            ? value1.toString().split('.')[1].length
            : value2.toString().split('.')[1].length)
        : 0;

    // Round the result to the maximum number of decimal places found
    return double.parse((result).toStringAsFixed(maxDecimalPlaces));
  }

  void loadValueListFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      controller.value.value = prefs.getStringList('valueList') ?? [];
    });
  }

  double calculateTotal(List<String> values) {
    double total = 0.0;

    for (int i = 0; controller.grandTotal.length > i; i++) {
      total += controller.grandTotal[i];
    }
    // print(" count function ${total} ========================");
    return total;
  }

  onclick(String number, String click) async {
    switch (click) {
      case ".":
        {
          if (!dotAdded) {
            scrolle();
            dotAdded = true;
            controller.display.value += click;
            controller.displayEnglish.value += click;
          }
          break;
        }
      case "0":
      case "00":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        if ((controller.display.value == "0" ||
                controller.display.value == "00") &&
            (number == "0" || number == "00")) {
          controller.display.value = "0";

          return;
        }
        if (controller.display.value == "" && (number == "00")) {
          number = "0";
        }
        if (controller.displayOprater.value == "M+" ||
            controller.displayOprater.value == "M-") {
          display =controller.display.value + controller.prevOpertor.value;
          print("display${display}");
          controller.display.value = "";
          controller.displayEnglish.value = "";
        }

        if (onetime3 == true) {
          if (controller.displayOprater.value == "MU") {
            onetime3 == true;
            print("MMMMMMMMMMMMMMMMM3");
            controller.display.value = "";
            controller.displayEnglish.value = "";
          }
        } else {
          if (onetime2 == true) {
            if (controller.displayOprater.value == "MU") {
              onetime2 == true;
              check = true;
              print("MMMMMMMMMMMMMMMMM1");
              controller.display.value = "";
              controller.displayEnglish.value = "";
            }
          } else {
            if (controller.displayOprater.value == "MU") {
              print("MMMMMMMMMMMMMMMMM2");
              onetime = true;
              check = false;
              onetime2 == false;
              controller.display.value = "";
              controller.displayEnglish.value = "";
            }
          }
        }

        controller.displayOprater.value = "";

        if (update == true) {
          print("Update diplay ${controller.display.value}");
          print("Update diplay + number ${controller.display.value + number}");
          print("jhdjkh${controller.updatevalue.value}");
          controller.updatevalue.value = controller.display.value + number;
          print("jhdjkh${controller.updatevalue.value}");
          print("jhdjkh${controller.prevOpertor.value}");
        }

        controller.display.value = controller.display.value + number;
        if (controller.display.value == "01" ||
            controller.display.value == "02" ||
            controller.display.value == "03" ||
            controller.display.value == "04" ||
            controller.display.value == "05" ||
            controller.display.value == "06" ||
            controller.display.value == "07" ||
            controller.display.value == "08" ||
            controller.display.value == "09") {
          controller.display.value =
              controller.display.value.replaceFirst('0', '');
        }
        scrolle();
        controller.displayEnglish.value =
            controller.displayEnglish.value + click;
        break;
      case "AC":
        onetime = false;
        onetime2 = false;
        onetime3 = false;
        print(onetime);
        dotAdded = false;
        check = false;
        controller.display.value = "";
        controller.displayEnglish.value = "";
        controller.value.clear();
        controller.prevOpertor.value = "";
        gstnumber = "";
        controller.memory.value = 0.0;
        controller.result.value = 0.0;
        display = "";
        gst = false;
        update = false;
        controller.displayOprater.value = "";
        controller.operator.clear();

        controller.grandTotal.clear();
        break;
      case "DE":
        scrolle();
        dotAdded = false;
        print("Update DE ${controller.display.value}");
        if (controller.display.value.isNotEmpty) {
          print("Update DE2 ${controller.display.value}");
          controller.display.value = controller.display.value
              .substring(0, controller.display.value.length - 1);
          print("Update DE3 ${controller.display.value}");
        }
        print("Update displayEnglish DE1 ${controller.displayEnglish.value}");
        controller.displayEnglish.value = controller.displayEnglish.value
            .substring(0, controller.displayEnglish.value.length - 1);
        print("Update displayEnglish DE2 ${controller.displayEnglish.value}");

        update = true;

        break;

      case "+3%":
      case "+5%":
      case "+12%":
      case "+18%":
      case "+GST":
        controller.currentValue.value =
            double.parse(controller.displayEnglish.value);

        if (click == "+3%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(+3%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.03;
          print("percentage ${controller.percentage.value}");
          gst = true;
          print("currentValue ${controller.currentValue}");
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          print("gstAmount ${controller.gstAmount.value}");
          print("result ${controller.result.value}");
          gstoperator = "3%";
          controller.value.add(
              "IGST ${gstoperator}   " + controller.gstAmount.value.toString());
          controller.saveValueListToPrefs();

          controller.CGST.value = controller.gstAmount.value / 2;
          controller.value.add("CGST ${controller.CGST.value}%   " +
              controller.CGST.value.toString());
          controller.saveValueListToPrefs();
          controller.SGST.value = controller.gstAmount.value / 2;
          controller.value.add("SGST ${controller.SGST.value}%   " +
              controller.SGST.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.percentage.value;
          controller.value.add("GST :- " + controller.result.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.gstAmount.value;

          print(controller.percentage.value);
        } else if (click == "+5%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(+5%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.05;
          print("percentage ${controller.percentage.value}");
          gst = true;
          print("currentValue ${controller.currentValue}");
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          print("gstAmount ${controller.gstAmount.value}");
          print("result ${controller.result.value}");
          gstoperator = "5%";
          controller.value.add(
              "IGST ${gstoperator}   " + controller.gstAmount.value.toString());
          controller.saveValueListToPrefs();

          controller.CGST.value = controller.gstAmount.value / 2;
          controller.value.add("CGST ${controller.CGST.value}%   " +
              controller.CGST.value.toString());
          controller.saveValueListToPrefs();
          controller.SGST.value = controller.gstAmount.value / 2;
          controller.value.add("SGST ${controller.SGST.value}%   " +
              controller.SGST.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.percentage.value;
          controller.value.add("GST :- " + controller.result.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.gstAmount.value;

          print(controller.percentage.value);
        } else if (click == "+12%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(+12%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.12;
          print("percentage ${controller.percentage.value}");
          gst = true;
          print("currentValue ${controller.currentValue}");
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          print("gstAmount ${controller.gstAmount.value}");
          print("result ${controller.result.value}");
          gstoperator = "12%";
          controller.value.add(
              "IGST ${gstoperator}   " + controller.gstAmount.value.toString());
          controller.saveValueListToPrefs();

          controller.CGST.value = controller.gstAmount.value / 2;
          controller.value.add("CGST ${controller.CGST.value}%     " +
              controller.CGST.value.toString());
          controller.saveValueListToPrefs();
          controller.SGST.value = controller.gstAmount.value / 2;
          controller.value.add("SGST ${controller.SGST.value}%     " +
              controller.SGST.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.percentage.value;
          controller.value.add("GST :- " + controller.result.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.gstAmount.value;

          print(controller.percentage.value);
        } else if (click == "+18%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(+18%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.18;
          print("percentage ${controller.percentage.value}");
          gst = true;
          print("currentValue ${controller.currentValue}");
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          print("gstAmount ${controller.gstAmount.value}");
          print("result ${controller.result.value}");
          gstoperator = "18%";
          controller.value.add(
              "IGST ${gstoperator}   " + controller.gstAmount.value.toString());
          controller.saveValueListToPrefs();

          controller.CGST.value = controller.gstAmount.value / 2;
          controller.value.add("CGST ${controller.CGST.value}%    " +
              controller.CGST.value.toString());
          controller.saveValueListToPrefs();
          controller.SGST.value = controller.gstAmount.value / 2;
          controller.value.add("SGST ${controller.SGST.value}%    " +
              controller.SGST.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.percentage.value;
          controller.value.add("GST :- " + controller.result.value.toString());
          controller.saveValueListToPrefs();
          controller.result.value =
              controller.currentValue.value + controller.gstAmount.value;

          print(controller.percentage.value);
        } else if (click == "+GST") {
          scrolle();
          dotAdded = false;
          gst = true;
          print("currentValue ${controller.currentValue}");

          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
        }

        print(controller.currentValue.value);
        print(controller.result.value);
        controller.prevOpertor.value = "+GST";

        controller.display.value = "";
        // controller.displayEnglish.value = controller.result.value.toString();
        break;

      case "-3%":
      case "-5%":
      case "-12%":
      case "-18%":
      case "-GST":
        controller.currentValue.value =
            double.parse(controller.displayEnglish.value);

        if (click == "-3%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(-3%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.03;
          print("percentage ${controller.percentage.value}");
          print(" ============= ${number} ");
          gstoperator = number;

          controller.result.value = controller.percentage.value / 2;
          print(" ============= ${controller.result.value} ");
          gst = true;
          gstoperator = "3%";
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          controller.gstAmount.value = controller.currentValue.value -
              controller.currentValue.value *
                  (100 / (100 + controller.percentage.value));
          print(controller.gstAmount.value);
          twonumber = controller.gstAmount.value.toStringAsFixed(1);
          controller.value.add("IGST ${gstoperator}   " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          controller.value.add(
              "CGST ${controller.result.value}%    " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          controller.value.add(
              "SGST ${controller.result.value}%    " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.result.value =
              controller.currentValue.value - controller.gstAmount.value;
          twonumber = controller.result.value.toStringAsFixed(1);
          controller.value.add("GST  = " + twonumber.toString());
          controller.saveValueListToPrefs();
          print(" ============= ${controller.result.value} ");
        } else if (click == "-5%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(-5%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.05;
          print("percentage ${controller.percentage.value}");
          print(" ============= ${number} ");
          gstoperator = number;
          controller.result.value = controller.percentage.value / 2;
          gst = true;
          gstoperator = "5%";
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          controller.gstAmount.value = controller.currentValue.value -
              controller.currentValue.value *
                  (100 / (100 + controller.percentage.value));
          print(controller.gstAmount.value);
          twonumber = controller.gstAmount.value.toStringAsFixed(1);
          controller.value.add("IGST ${gstoperator}   " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          controller.value.add(
              "CGST ${controller.result.value}%    " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          controller.value.add(
              "SGST ${controller.result.value}%    " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.result.value =
              controller.currentValue.value - controller.gstAmount.value;
          twonumber = controller.result.value.toStringAsFixed(1);
          controller.value.add("GST  = " + twonumber.toString());
          controller.saveValueListToPrefs();
          print(" ============= ${controller.result.value} ");
        } else if (click == "-12%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(-12%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.12;
          print("percentage ${controller.percentage.value}");
          print(" ============= ${number} ");
          gstoperator = number;
          controller.result.value = controller.percentage.value / 2;
          print(" ============= ${controller.result.value} ");
          gst = true;
          gstoperator = "12%";
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          controller.gstAmount.value = controller.currentValue.value -
              controller.currentValue.value *
                  (100 / (100 + controller.percentage.value));
          print(controller.gstAmount.value);
          twonumber = controller.gstAmount.value.toStringAsFixed(1);
          controller.value.add("IGST ${gstoperator}   " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          String digitresult = controller.result.value.toStringAsFixed(0);
          controller.value
              .add("CGST ${digitresult}%     " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          digitresult = controller.result.value.toStringAsFixed(0);
          controller.value
              .add("SGST ${digitresult}%     " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.result.value =
              controller.currentValue.value - controller.gstAmount.value;
          twonumber = controller.result.value.toStringAsFixed(1);
          controller.value.add("GST  = " + twonumber.toString());
          controller.saveValueListToPrefs();
        } else if (click == "-18%") {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "(-18%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.18;
          print("percentage ${controller.percentage.value}");
          print(" ============= ${number} ");
          gstoperator = number;
          controller.result.value = controller.percentage.value / 2;
          print(" ============= ${controller.result.value} ");
          gst = true;
          gstoperator = "18%";
          controller.gstAmount.value =
              (controller.currentValue * controller.percentage.value) / 100;

          controller.gstAmount.value = controller.currentValue.value -
              controller.currentValue.value *
                  (100 / (100 + controller.percentage.value));
          print(controller.gstAmount.value);
          twonumber = controller.gstAmount.value.toStringAsFixed(1);
          controller.value.add("IGST ${gstoperator}   " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          String digitresult = controller.result.value.toStringAsFixed(0);
          controller.value
              .add("CGST ${digitresult}%      " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.SGST.value = controller.gstAmount.value / 2;
          twonumber = controller.SGST.value.toStringAsFixed(1);
          digitresult = controller.result.value.toStringAsFixed(0);
          controller.value
              .add("SGST ${digitresult}%      " + twonumber.toString());
          controller.saveValueListToPrefs();

          controller.result.value =
              controller.currentValue.value - controller.gstAmount.value;
          twonumber = controller.result.value.toStringAsFixed(1);
          controller.value.add("GST  = " + twonumber.toString());
          controller.saveValueListToPrefs();
        } else if (click == "-GST") {
          dotAdded = false;
          gst = true;
          print("currentValue ${controller.currentValue}");

          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();

          controller.prevOpertor.value = "-GST";
        }

        print(controller.currentValue.value);
        print(controller.result.value);

        controller.display.value = "";
        break;
      case "MR":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          print(controller.memory.value.toString());
         if(update == true)
           {
             controller.display.value = controller.display.value.replaceAll("MR+", "");
             print("eeeeeeeeeee");
           }else {
           controller.display.value = controller.memory.value.toString();
           print("eeeeeeeeeee");
         }
         controller.prevOpertor.value = "MR";
         break;
        }
      case "M-":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            controller.display.value = controller.value[0]
                .replaceAll("${controller.value[0]}", "${controller.value[0]}");
            print(" controller.display.value${controller.display.value}");
            controller.value.clear();
          } else {
            controller.memory.value = double.parse(controller.displayEnglish.value);
          }
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M-";

          break;
        }

      case "M+":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            controller.display.value = controller.value[0].replaceAll("${controller.value[0]}","${controller.value[0]}");
            print(" controller.display.value${controller.display.value}");
            controller.memory.value = double.parse(controller.display.value);
            controller.value.clear();
          } else {
            controller.memory.value =  double.parse(controller.displayEnglish.value);
          }
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M+";
          break;
        }
      case "MU":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "MU";
          if (controller.display.value.isEmpty) {
            if (controller.displayOprater.value.isNotEmpty) {
              onetime2 = true;
              controller.display.value = controller.value[0].replaceAll(
                  "${controller.value[0]}", "${controller.value[0]}");
              controller.value.clear();
              controller.value.add(
                  controller.display.value + controller.displayOprater.value);
              controller.saveValueListToPrefs();
            }
          } else {
            if (controller.value.isEmpty) {
              print("-------------");
              onetime3 = true;
              controller.displayOprater.value = number;
              controller.value.add(
                  controller.display.value + controller.displayOprater.value);
              controller.saveValueListToPrefs();
            } else {
              onetime3 = false;
              display = controller.display.value;
              controller.display.value = controller.value[2];
              controller.displayOprater.value = number;
              controller.value.add(controller.displayEnglish.value +
                  controller.displayOprater.value);
              controller.saveValueListToPrefs();
            }
          }
          break;
        }
      case "undo":
        {
          scrolle();
          dotAdded = false;
          // Check if there are any entries in the history
          if (controller.value.isNotEmpty) {
            // Remove the last entry from the history
            if (controller.value.length > 2 || controller.value.length > 3) {
              controller.value.removeAt(controller.value.length - 1);
            }
            String lastEntry =
                controller.value.removeAt(controller.value.length - 1);
            controller.prevOpertor.value = lastEntry[0];
            print("lastEntry");
            print(lastEntry);
            controller.display.value = lastEntry;
            print(controller.display.value);
            print("Update the display to the last ${controller.display.value}");
            print(controller.display.value);
            controller.displayEnglish.value = lastEntry;
          }
          break;
        }
      case "GT":
        {
          scrolle();
          dotAdded = false;
          controller.prevOpertor.value = "GT";
          controller.value
              .add(number.toString() + controller.prevOpertor.value);
          controller.saveValueListToPrefs();
          break;
        }
      case "%":
        {
          scrolle();
          dotAdded = false;
          if (onetime3 == false) {
            if (check == false) {
              print("fffffffffffffff");
              scrolle();
              dotAdded = false;
              if (onetime2 == true) {
                print("onetime2");
              } else {
                print("one time ===");
                print(controller.prevOpertor.value);
                if (onetime == false) {
                  if (controller.prevOpertor.value == "+") {
                    print("onetime");
                    String display = controller.display.value;
                    print(display);
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                    print(controller.value);
                    print("currentValue ${controller.currentValue.value}");
                    controller.currentValue.value =
                        double.parse(controller.value[0]);
                    print("currentValue ${controller.currentValue.value}");

                    double percentageValue =
                        controller.currentValue.value * double.parse(display);
                    print("percentageValue ${percentageValue}");
                    percentageValue /= 100;
                    print("percentageValue ${percentageValue}");
                    double newValue =
                        controller.currentValue.value + percentageValue;

                    print("newValue ${newValue}");
                    // Update the display with the new value
                    controller.display.value = newValue.toString();

                    controller.displayEnglish.value = newValue.toString();
                  } else if (controller.prevOpertor.value == "-") {
                    String display = controller.display.value;
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                    print(controller.value.value);
                    print("currentValue ${controller.currentValue.value}");
                    controller.currentValue.value =
                        double.parse(controller.value[0]);
                    print("currentValue ${controller.currentValue.value}");
                    double percentageValue =
                        controller.currentValue.value * double.parse(display);
                    print("percentageValue ${percentageValue}");
                    percentageValue /= 100;
                    print("percentageValue ${percentageValue}");
                    double newValue =
                        controller.currentValue.value - percentageValue;

                    print("newValue ${newValue}");
                    // Update the display with the new value
                    controller.display.value = newValue.toString();

                    controller.displayEnglish.value = newValue.toString();
                  } else if (controller.prevOpertor.value == "*") {
                    String display = controller.display.value;
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                    print(controller.value.value);
                    print("currentValue ${controller.currentValue.value}");
                    controller.currentValue.value =
                        double.parse(controller.value[0]);
                    print("currentValue ${controller.currentValue.value}");
                    double percentageValue =
                        controller.currentValue.value * double.parse(display);
                    print("percentageValue ${percentageValue}");
                    percentageValue /= 100;
                    print("percentageValue ${percentageValue}");
                    print('************');
                    double newValue =
                        controller.currentValue.value * percentageValue;

                    print("newValue ${newValue}");
                    // Update the display with the new value
                    controller.display.value = percentageValue.toString();

                    controller.displayEnglish.value =
                        percentageValue.toString();
                  } else if (controller.prevOpertor.value == "/") {
                    String display = controller.display.value;
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                    print(controller.value.value);
                    print("currentValue ${controller.currentValue.value}");
                    controller.currentValue.value =
                        double.parse(controller.value[0]);
                    print("currentValue ${controller.currentValue.value}");
                    double percentageValue =
                        controller.currentValue.value / double.parse(display);
                    print("percentageValue ${percentageValue}");
                    percentageValue *= 100;
                    print("percentageValue ${percentageValue}");
                    double newValue =
                        controller.currentValue.value / percentageValue;

                    print("newValue ${newValue}");
                    // Update the display with the new value
                    controller.display.value = percentageValue.toString();

                    controller.displayEnglish.value =
                        percentageValue.toString();
                  }
                  print(controller.displayEnglish);
                  controller.displayOprater.value = "=";
                  // print(controller.result);
                  controller.value.add(controller.displayOprater.value +
                      controller.displayEnglish.value);
                  controller.saveValueListToPrefs();
                } else if (onetime == true) {
                  if (update == true) {
                    print("========= update +++++++++++");
                    controller.value.add(controller.display.value);
                    controller.saveValueListToPrefs();

                    controller.updatevalue.value =
                        controller.updatevalue.value.substring(1);
                    controller.displayEnglish.value =
                        controller.displayEnglish.value.substring(1);
                    print(controller.display.value);
                    print("jhdjkh${controller.updatevalue.value}");
                    display = controller.value.value[3].replaceAll("MU", "");
                    controller.currentValue.value = double.parse(display);
                    print("currentValue ${controller.currentValue.value}");

                    double percentageValue =
                        controller.currentValue.value * 100;
                    print("percentageValue ${percentageValue}");
                    print("display ${controller.display.value}");
                    double r = 100 -
                        double.parse(
                            controller.display.value.replaceAll("%", ""));
                    print(percentageValue);
                    print(r);
                    double r1 = percentageValue / r;
                    print(r1);
                    controller.prevOpertor.value = "=";
                    controller.value
                        .add(controller.prevOpertor.value + r1.toString());
                    controller.saveValueListToPrefs();
                    print(controller.value.value);
                    controller.display.value = "";
                    controller.displayOprater.value = "";
                    scrolle();
                  } else {
                    controller.prevOpertor.value = "=";
                    print("tttttttttttttttttttttttttttt");
                    controller.displayOprater.value = number;
                    print(controller.displayOprater.value);
                    print(" 4000000000000000000${controller.display.value}");
                    print("4444444444444${display}");

                    controller.value.add(controller.displayOprater.value +
                        controller.display.value);

                    controller.currentValue.value = double.parse(display);
                    print("currentValue ${controller.currentValue.value}");
                    double percentageValue =
                        controller.currentValue.value * 100;
                    print("percentageValue ${percentageValue}");
                    double r = 100 - double.parse(controller.display.value);
                    print(percentageValue);
                    print(r);
                    double r1 = percentageValue / r;
                    print(r1);
                    controller.value
                        .add(controller.prevOpertor.value + r1.toString());
                    controller.saveValueListToPrefs();
                    print(controller.value.value);
                    controller.display.value = "";
                    controller.displayOprater.value = "";
                  }
                }
              }
            }
          } else {
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value.value[0].replaceAll("MU", "");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue ${percentageValue}");
              print("display ${controller.display.value}");
              double r = 100 -
                  double.parse(controller.display.value.replaceAll("%", ""));
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.prevOpertor.value = "=";
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
              scrolle();
            } else {
              print("yes");
              controller.prevOpertor.value = "=";
              print("onetime3 tttttttttttttttttttttttttttt");
              controller.displayOprater.value = number;
              print(controller.displayOprater.value);
              print(" 4000000000000000000${controller.display.value}");
              print(
                  "4444444444444${controller.value.value[0].replaceAll("MU", "")}");
              display = controller.value.value[0].replaceAll("MU", "");
              controller.value.add(
                  controller.displayOprater.value + controller.display.value);

              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue ${percentageValue}");
              double r = 100 - double.parse(controller.display.value);
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
            }
          }

          if (check == true) {
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              display = controller.value.value[0].replaceAll("MU", "");
              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue ${percentageValue}");
              print("display ${controller.display.value}");
              double r = 100 -
                  double.parse(controller.display.value.replaceAll("%", ""));
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.prevOpertor.value = "=";
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
              scrolle();
            } else {
              print("true");
              controller.prevOpertor.value = "=";
              print("check tttttttttttttttttttttttttttt");
              controller.displayOprater.value = number;
              print(controller.displayOprater.value);
              print(" 4000000000000000000${controller.display.value}");
              print(
                  "4444444444444${controller.value.value[0].replaceAll("MU", "")}");
              display = controller.value.value[0].replaceAll("MU", "");
              controller.value.add(
                  controller.displayOprater.value + controller.display.value);

              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue ${percentageValue}");
              double r = 100 - double.parse(controller.display.value);
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value.value);
              controller.display.value = "";
              controller.displayOprater.value = "";
            }
          }
          break;
        }
      case "root":
        {
          scrolle();
          dotAdded = false;
          double currentValue = double.parse(controller.displayEnglish.value);

          if (currentValue >= 0) {
            double squareRoot = sqrt(currentValue);

            controller.display.value = squareRoot.toString();
            double secoundvalue = double.parse(controller.display.value);
            controller.display.value = secoundvalue.toStringAsFixed(3);
            controller.displayEnglish.value = squareRoot.toString();
          } else {
            controller.display.value = "Error";
            controller.displayEnglish.value = "Error";
          }
          break;
        }
      case "/":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          if (controller.displayEnglish.value.isEmpty) {
            print("controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR${controller.displayEnglish.value}");
              controller.value.add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
            } else {
              print(controller.value[0]);
              controller.result.value = double.parse(controller.value[0]);
            }
          } else {
            if (controller.prevOpertor.value == "+") {
              controller.result.value +=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "-") {
              controller.result.value -=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "*") {
              controller.result.value *=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "/") {
              controller.result.value /=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "") {
              controller.result.value =
                  double.parse(controller.displayEnglish.value);
            }
            print("displayEnglish${controller.displayEnglish.value}");
            if (controller.prevOpertor.value == "=" || controller.prevOpertor.value == "M+" || controller.prevOpertor.value == "M-") {
              if (controller.prevOpertor.value == "M+"|| controller.prevOpertor.value == "M-") {
                controller.prevOpertor.value = "/";
                controller.value.add(controller.display.value);
              } else {
                controller.value.add(controller.display.value);
              }
            } else {
              controller.value.add(controller.prevOpertor.value + controller.display.value);
            }
            controller.saveValueListToPrefs();
            if(controller.prevOpertor.value == "M+"||controller.prevOpertor.value == "M-")
            {
              controller.memory.value = double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
            }
          }
          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.prevOpertor.value = "/";
          controller.prevOpertor2.value = "/";
          break;
        }
      case "*":
        {
          scrolle();
          dotAdded = false;
          print("==+== ${controller.display.value}");
          controller.displayOprater.value = number;
          if (controller.displayEnglish.value.isEmpty) {
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
                    if (controller.value.isEmpty) {
                      print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
                      print(
                          "MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR${controller.displayEnglish.value}");
                      controller.value
                          .add(controller.prevOpertor.value + controller.display.value);
                      controller.saveValueListToPrefs();
                    } else {
                      print(controller.value[0]);
                      controller.result.value = double.parse(controller.value[0]);
                    }
          } else {
            if (controller.prevOpertor.value == "+") {
              controller.result.value +=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "-") {
              controller.result.value -=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "*") {
              controller.result.value *=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "/") {
              controller.result.value /=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "") {
              controller.result.value =
                  double.parse(controller.displayEnglish.value);
            }
            print("displayEnglish${controller.displayEnglish.value}");
            if (controller.prevOpertor.value == "=" || controller.prevOpertor.value == "M+" || controller.prevOpertor.value == "M-") {
              if (controller.prevOpertor.value == "M+"|| controller.prevOpertor.value == "M-") {
                controller.prevOpertor.value = "*";
                controller.value.add(controller.display.value);
              } else {
                controller.value.add(controller.display.value);
              }
            } else {
              controller.value.add(controller.prevOpertor.value + controller.display.value);
            }
            controller.saveValueListToPrefs();
            if(controller.prevOpertor.value == "M+"||controller.prevOpertor.value == "M-")
            {
              controller.memory.value =
                  double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
            }
          }
          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "*";
          controller.prevOpertor2.value = "*";
          break;
        }
      case "-":
        {
          scrolle();
          dotAdded = false;
          print("== ${controller.display.value}");
          controller.displayOprater.value = number;
          if (controller.displayEnglish.value.isEmpty) {
            print(
                "controller.displayEnglish.value3 ${controller.display.value}");
            print("== ${controller.display.value}");
            if (controller.value.isEmpty) {
              print("MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR");
              print(
                  "MMMMMMMMMMMMMRRRRRRRRRRRRRRRRR${controller.displayEnglish.value}");
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
            } else {
              print(controller.value[0]);
              controller.result.value = double.parse(controller.value[0]);
            }
            print(controller.result.value);
          } else {
            if (controller.prevOpertor.value == "+") {
              print(
                  "controller.displayEnglish.value2 ${controller.displayEnglish.value}");
              controller.result.value +=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "-") {
              controller.result.value -=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "*") {
              controller.result.value *=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "/") {
              controller.result.value /=
                  double.parse(controller.displayEnglish.value);
            }
            if (controller.prevOpertor.value == "") {
              controller.result.value =
                  double.parse(controller.displayEnglish.value);
            }
            print("displayEnglish${controller.displayEnglish.value}");
            if (controller.prevOpertor.value == "=" || controller.prevOpertor.value == "M+" || controller.prevOpertor.value == "M-") {
              if (controller.prevOpertor.value == "M+"|| controller.prevOpertor.value == "M-") {
                controller.prevOpertor.value = "-";
                controller.value.add(controller.display.value);
              } else {
                controller.value.add(controller.display.value);
              }
            } else {
              controller.value.add(controller.prevOpertor.value + controller.display.value);
            }
            controller.saveValueListToPrefs();
            if(controller.prevOpertor.value == "M+"||controller.prevOpertor.value == "M-")
            {
              controller.memory.value =
                  double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
            }
          }

          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "-";
          controller.prevOpertor2.value = "-";

          break;
        }
      case "+":
        {
          dotAdded = false;
          scrolle();
          print("==+== ${controller.display.value}");

          if (controller.displayEnglish.value.isEmpty) {
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+== ${controller.display.value}");
            print(controller.value[0]);
            controller.result.value = double.parse(controller.value[0]);
          }
          else {
            if (controller.prevOpertor.value == "+") {
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value += double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "-") {
                controller.result.value -=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "*") {
                controller.result.value *=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "/") {
                controller.result.value /=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
              }
              print("displayEnglish${controller.displayEnglish.value}");
                  if (controller.prevOpertor.value == "=" || controller.prevOpertor.value == "M+" || controller.prevOpertor.value == "M-") {
                      controller.value.add(controller.display.value);
                      controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value + controller.display.value);
                    controller.saveValueListToPrefs();
                  }
              if(controller.prevOpertor.value == "M+"||controller.prevOpertor.value == "M-")
                {
                  controller.memory.value =
                      double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
                }
          }

          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "+";
          controller.prevOpertor2.value = "+";
          break;
        }
      case "=":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          if (controller.prevOpertor.value == "+") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");
              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) +
                    double.parse(controller.updatevalue.value);
              } else {
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  total += elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              print("+++++++++++");
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              controller.result.value +=
                  double.parse(controller.displayEnglish.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            }
          } else if (controller.prevOpertor.value == "-") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) -
                    double.parse(controller.updatevalue.value);
              } else {
                // print("length${ double.parse( controller.value[controller.value.length])}");
                double total = 0.0;
                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  print("elementValue: ${elementValue}");
                  total -= elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();

              controller.result.value = subtractAndRound(
                  controller.result.value,
                  double.parse(controller.display.value));
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
            }
          } else if (controller.prevOpertor.value == "*") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) *
                    double.parse(controller.updatevalue.value);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(controller.value[i]);
                    total += elementValue;
                    print("1elementValue: $elementValue");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(controller.value[i]);
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        controller.value[i].replaceAll(RegExp('[*+-./]'), ''));
                    total *= elementValue;
                    print("3elementValue: $elementValue");
                  }
                }
                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              controller.result.value *=
                  double.parse(controller.displayEnglish.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
            }
          } else if (controller.prevOpertor.value == "/") {
            scrolle();
            if (update == true) {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value =
                  controller.updatevalue.value.substring(1);
              controller.displayEnglish.value =
                  controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${controller.updatevalue.value}");

              if (controller.value.length == 2) {
                print(
                    "length${double.parse(controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                        controller.value[controller.value.length - 2]) /
                    double.parse(controller.updatevalue.value);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;
                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(controller.value[i]);
                    total += elementValue;
                    print("1elementValue: $elementValue");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(controller.value[i]);
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        controller.value[i].replaceAll(RegExp('[*+-.]'), ''));
                    total *= elementValue;
                    print("3elementValue: $elementValue");
                  } else if (controller.value[i].contains("/")) {
                    double elementValue = double.parse(
                        controller.value[i].replaceAll(RegExp('[*+-./]'), ''));
                    print("elementValue: $elementValue");
                    total /= elementValue;
                  }
                }
                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              controller.result.value /=
                  double.parse(controller.displayEnglish.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toString());
              controller.saveValueListToPrefs();
            }
          } else if (controller.prevOpertor.value == "MU") {
            scrolle();
            controller.value
                .add(controller.prevOpertor.value + controller.display.value);
          } else if (controller.prevOpertor.value == "+GST") {
            scrolle();
            double secoundvalue = double.parse(controller.display.value);
            twonumber = secoundvalue.toStringAsFixed(0);
            controller.percentage.value =
                controller.currentValue.value * 0 + secoundvalue;
            print("percentage ${controller.percentage.value}");
            gst = true;
            print("currentValue ${controller.currentValue}");
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            print("gstAmount ${controller.gstAmount.value}");
            print("result ${controller.result.value}");
            twonumber = controller.gstAmount.value.toStringAsFixed(1);
            controller.value
                .add("IGST ${controller.display.value}%   $twonumber");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.gstAmount.value / 2;
            controller.value.add("CGST ${controller.CGST.value}%   " +
                controller.CGST.value.toString());
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            controller.value.add("SGST ${controller.SGST.value}%   " +
                controller.SGST.value.toString());
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value
                .add("GST :- " + controller.result.value.toString());
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;

            print(controller.percentage.value);
            print("==${controller.currentValue.value}");
          } else if (controller.prevOpertor.value == "-GST") {
            scrolle();
            print(controller.display.value);
            double secoundvalue = double.parse(controller.display.value);
            twonumber = secoundvalue.toStringAsFixed(0);
            print("kjvkljf ${twonumber}");
            controller.percentage.value =
                controller.currentValue.value * 0 + secoundvalue;
            print("percentage ${controller.percentage.value}");
            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gst = true;
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value *
                    (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value.toStringAsFixed(1);
            controller.value.add(
                "IGST ${controller.display.value}%   " + twonumber.toString());
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value.toStringAsFixed(1);
            controller.value.add(
                "CGST ${controller.result.value}%    " + twonumber.toString());
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value.toStringAsFixed(1);
            controller.value.add(
                "SGST ${controller.result.value}%    " + twonumber.toString());
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("GST  = " + twonumber.toString());
            controller.saveValueListToPrefs();
            print(" ============= ${controller.result.value} ");
            print("currentValue ${controller.currentValue}");
            print("==${controller.currentValue.value}");
          } else if (controller.prevOpertor.value == "update") {
            print("========= update ==========");

            print("jhdjkh${controller.updatevalue.value}");
          } else if(controller.prevOpertor.value == "MR")
            {
              if(update == true) {
                print("========= update +++++++++++");
                print("========= update ${controller.display.value}");
                controller.value.add(controller.prevOpertor.value+controller.prevOpertor2.value+controller.display.value);
                controller.saveValueListToPrefs();

                controller.updatevalue.value =
                    controller.updatevalue.value.substring(1);
                controller.displayEnglish.value =
                    controller.displayEnglish.value.substring(1);
                print(controller.display.value);
                print("jhdjkh${controller.updatevalue.value}");
                display = controller.value.value[0].replaceAll("M+", "").replaceAll("M-", " ");
                controller.currentValue.value = double.parse(display);
                print("currentValue ${controller.currentValue.value}");
                print("prevOpertor ${controller.prevOpertor.value}");

                if(controller.prevOpertor2.value == "+")
                {
                  controller.result.value = controller.currentValue.value + double.parse(controller.updatevalue.value.replaceAll("R+", ""));
                }
                if(controller.prevOpertor2.value == "-")
                {
                  controller.result.value = controller.currentValue.value - double.parse(controller.updatevalue.value.replaceAll("R+", ""));
                }
                if(controller.prevOpertor2.value == "*")
                {
                  controller.result.value = controller.currentValue.value * double.parse(controller.updatevalue.value.replaceAll("R+", ""));
                }
                if(controller.prevOpertor2.value == "/")
                {
                  controller.result.value = controller.currentValue.value + double.parse(controller.updatevalue.value.replaceAll("R+", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value + controller.result.value.toString());
                controller.saveValueListToPrefs();
                controller.display.value = "";
                controller.displayOprater.value = "";
              }else
              {
                print("M+M_");
                controller.value.add(controller.prevOpertor.value  +  controller.prevOpertor2.value+display.replaceAll("M+", "").replaceAll("M-", ""));
                controller.saveValueListToPrefs();
                if(controller.prevOpertor2.value == "+")
                {
                  controller.result.value = double.parse(controller.value[0]) + double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if(controller.prevOpertor2.value == "-")
                {
                  controller.result.value = double.parse(controller.value[0]) + double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if(controller.prevOpertor2.value == "*")
                {
                  controller.result.value = double.parse(controller.value[0]) * double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                if(controller.prevOpertor2.value == "/")
                {
                  controller.result.value = double.parse(controller.value[0]) / double.parse(display.replaceAll("M+", "").replaceAll("M-", ""));
                }
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value + controller.result.value.toString());
                controller.saveValueListToPrefs();
                print(controller.value.value);
              }
            }
          controller.display.value = "";
          controller.grandTotal.add(controller.result.value);
          controller.operator.add(controller.displayOprater.value);
          controller.displayEnglish.value = "";
          controller.prevOpertor.value = "=";
          controller.saveValueListToPrefs();

          controller.result.value = 0.0;
          break;
        }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: controller.dark.value ? Colors.white : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.6.h),
          child: AppBar(
            backgroundColor:
                controller.dark.value ? Colors.black : Color(0xffE7E7E7),
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                    icon: Icon(Icons.menu));
              },
            ),
            centerTitle: true,
            title: controller.dark.value
                ? Container(
                    height: 5.2.h,
                    width: 35.w,
                    color: Colors.black,
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          "assets/images/more.png",
                          height: 3.h,
                          width: 10.w,
                        ),
                        Spacer(),
                        Text(
                          "More Tools",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 5.2.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 3.5.h,
                          width: 7.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.blueAccent)),
                          child: Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "More Tools",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
            actions: [
              controller.dark.value
                  ? Text("")
                  : Image.asset(
                      "assets/images/game_icon.png",
                      height: 4.h,
                    ),
              Image.asset(
                "assets/images/queen.png",
                height: 7.h,
              )
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: controller.dark.value ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GST OPTION",
                  style: TextStyle(
                    color: controller.dark.value
                        ? Colors.grey.shade300
                        : Colors.grey.shade900,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white38
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          SizedBox(
                            height: 4.h,
                            child: ClipRect(
                              child: Image.asset("assets/images/tools.png"),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "More Tools",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white38
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          SizedBox(
                            height: 4.h,
                            child: ClipRect(
                              child: Image.asset(
                                "assets/images/dark.png",
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Dark Theme",
                            style: TextStyle(
                              color: controller.dark.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Spacer(),
                          Switch(
                            value: controller.dark.value,
                            onChanged: (value) {
                              controller.toggleTheme(value);
                            },
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: controller.dark.value
                            ? Colors.white38
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                            backgroundColor: Colors.white10,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheet(
                                backgroundColor: Colors.black.withOpacity(0.8),
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: LenguageSelectionBottomSheet());
                                },
                                onClosing: () {
                                  // Handle the closing of the bottom sheet
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 3.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.language),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Language",
                              style: TextStyle(
                                color: controller.dark.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 7.h,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: scrollcontroller,
                physics: ClampingScrollPhysics(),
                itemCount: controller.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.value.length) {
                    return Container(
                      height: 8.h,
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        gst == true
                            ? Text(
                                "${controller.value[index]}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: controller.dark.value
                                        ? Colors.black
                                        : Colors.black),
                              )
                            : Container(
                                decoration: controller.value[index]
                                        .contains("=")
                                    ? BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(5))
                                    : BoxDecoration(),
                                child: Text(
                                  " ${controller.value[index]} ",
                                  style: TextStyle(
                                    color: controller.dark.value
                                        ? Colors.black
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 7.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffE7E7E7),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    onclick("", "AC");
                                    print("dwfwddeded");
                                  },
                                  child: Image.asset(
                                    "assets/images/ac.png",
                                    height: 5.h,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    onclick("", "undo");
                                  },
                                  child: Image.asset(
                                    "assets/images/undo.png",
                                    height: 4.h,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "${controller.display}",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: controller.dark.value
                                          ? Colors.black
                                          : Colors.black),
                                ),
                                Obx(
                                  () => Text(
                                    "${controller.displayOprater.value == "=" ? "" : controller.displayOprater.value}",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: controller.dark.value
                                            ? Colors.black
                                            : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    onclick("", "DE");
                                  },
                                  child: Image.asset("assets/images/delet.png",
                                      height: 5.h),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 43, left: 145),
                        child: Container(
                          height: 1.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick("+${context.loc.three}%", "+3%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "+${context.loc.three}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+${context.loc.five}%", "+5%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "+${context.loc.five}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(
                              "+${context.loc.one}${context.loc.two}%", "+12%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            text: "+${context.loc.one}${context.loc.two}%",
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+${context.loc.one}${context.loc.eight}%",
                              "+18%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "+${context.loc.one}${context.loc.eight}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+GST", "+GST");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            text: "+GST",
                            imagePath: "assets/images/btn1.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick("-${context.loc.three}%", "-3%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.three}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-${context.loc.five}%", "-5%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.five}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(
                              "-${context.loc.one}${context.loc.two}%", "-12%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.one}${context.loc.two}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-${context.loc.one}${context.loc.eight}%",
                              "-18%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-${context.loc.one}${context.loc.eight}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-GST", "-GST");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-GST",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            imagePath: "assets/images/btn1.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          double total = calculateTotal(controller.value);
                          onclick("${total}", "GT");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "GT",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("√x", "root");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "√x",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 19),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("%", "%");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "%",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("÷", "/");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "÷",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("MR", "MR");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "MR",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            imagePath: "assets/images/btn2.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.seven, "7");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.seven}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.eight, "8");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.eight}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.nine, "9");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.nine}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("×", "*");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "×",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("MU", "MU");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "MU",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            imagePath: "assets/images/btn2.png"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.four, "4");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.four}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.five, "5");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.five}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick(context.loc.six, "6");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "${context.loc.six}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                            imagePath: "assets/images/btn1.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("-", "-");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "-",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                            imagePath: "assets/images/btn2.png"),
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("M-", "M-");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 7.2.h,
                            text: "M-",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            imagePath: "assets/images/btn2.png"),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.one, "1");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.one}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.zero, "0");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.zero}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.two, "2");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.two}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.zero1, "00");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.zero1}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick(context.loc.three, "3");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "${context.loc.three}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick(".", ".");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: ".",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                                imagePath: "assets/images/btn1.png"),
                          ),
                        ],
                      ),
                      Bouncing(
                        onPress: () {
                          onclick("+", "+");
                        },
                        child: clickableContainer(
                            onTap: () {},
                            width: 20.w,
                            height: 14.4.h,
                            text: "+",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                            imagePath: "assets/images/btn3.png"),
                      ),
                      Column(
                        children: [
                          Bouncing(
                            onPress: () {
                              onclick("M+", "M+");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "M+",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                imagePath: "assets/images/btn2.png"),
                          ),
                          Bouncing(
                            onPress: () {
                              onclick("=", "=");
                            },
                            child: clickableContainer(
                                onTap: () {},
                                width: 20.w,
                                height: 7.2.h,
                                text: "=",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                                imagePath: "assets/images/btn4.png"),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget clickableContainer({
    VoidCallback? onTap,
    double? height,
    double? width,
    String? imagePath,
    String? text,
    TextStyle? style,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage(imagePath!),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: style,
          ),
        ),
      ),
    );
  }
}

class LenguageSelectionBottomSheet extends StatefulWidget {
  const LenguageSelectionBottomSheet({super.key});

  @override
  State<LenguageSelectionBottomSheet> createState() =>
      _LenguageSelectionBottomSheetState();
}

class _LenguageSelectionBottomSheetState
    extends State<LenguageSelectionBottomSheet> {
  Calculator_Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 4.h,
                width: 8.7.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                itemCount: controller.lang.value.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 1.0),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        border: controller.lang.value[index].isselect == true
                            ? Border.all(color: Colors.white)
                            : Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            for (int i = 0;
                                i < controller.lang.value.length;
                                i++) {
                              controller.lang.value[i].isselect = false;
                            }
                            controller.lang.value[index].isselect = true;
                            setState(() {});

                            Locale _locale = await setLocale(
                                controller.lang.value[index].languageCode!);
                            MyApp.setLocale(context, _locale);

                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 60,
                            child: Center(
                              child: Text(
                                "${controller.lang.value[index].flag}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.lang.value[index].name}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}

