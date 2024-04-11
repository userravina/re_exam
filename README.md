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
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gst_calculator/calculator/controller/calculator_controller.dart';
import 'package:gst_calculator/calculator/view/bouncing_button.dart';
import 'package:gst_calculator/main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';
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
    controller.initPrefs();
    controller.loadSound();
    super.initState();
  }

  @override
  void dispose() {
    controller.player.stop();
    super.dispose();
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
    if (controller.isLoopingCurrentItem.value == false) {
      print("++++++++++++++++ true++++++++++++++");
    } else {
      print("++++++++++++++++ false++++++++++++++");
      controller.playSound();
    }

    if (controller.isVibrationEnabled.value == false) {
    } else {
      bool hasVibrator = await Vibration.hasVibrator() ?? false;

      if (hasVibrator) {
        Vibration.vibrate(duration: 50, amplitude: 128);

        print("++++++++++++++++ vibration ++++++++++++++");
      }
    }
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
            twonumber = controller.percentage.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator  ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 1.5%   ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
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
            twonumber = controller.percentage.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST $gstoperator   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("CGST 2.5%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("SGST 2.5%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            print("result 5 ${controller.result.value}");
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
            twonumber = controller.percentage.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value.add("CGST 6%     ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
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
            twonumber = controller.percentage.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("IGST ${gstoperator}   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("CGST 9%    ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
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

            double discountPercentage = 3.0;

            double gstAmount = controller.currentValue.value -
                (controller.currentValue.value *
                    (100 / (100 + discountPercentage)));
            double igst = gstAmount;
            double cgst = gstAmount / 2;
            double sgst = gstAmount / 2;

            double totalAmount = controller.currentValue.value - gstAmount;

            String formattedIGST = igst.toStringAsFixed(2);
            controller.CGST.value = double.parse(cgst.toStringAsFixed(2));
            controller.SGST.value = double.parse(sgst.toStringAsFixed(2));
            String formattedTotalAmount = totalAmount.toStringAsFixed(2);
            gst = true;
            controller.value.add(
                "IGST ${discountPercentage.toStringAsFixed(0)}%   $formattedIGST");
            controller.value.add(
                "CGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.CGST.value}");
            controller.value.add(
                "SGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.SGST.value}");
            controller.value.add("Total Amount  = $formattedTotalAmount");

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

            double discountPercentage = 5.0;

            double gstAmount = controller.currentValue.value -
                (controller.currentValue.value *
                    (100 / (100 + discountPercentage)));
            double igst = gstAmount;
            double cgst = gstAmount / 2;
            double sgst = gstAmount / 2;

            double totalAmount = controller.currentValue.value - gstAmount;

            String formattedIGST = igst.toStringAsFixed(2);
            controller.CGST.value = double.parse(cgst.toStringAsFixed(2));
            controller.SGST.value = double.parse(sgst.toStringAsFixed(2));
            String formattedTotalAmount = totalAmount.toStringAsFixed(2);
            gst = true;
            controller.value.add(
                "IGST ${discountPercentage.toStringAsFixed(0)}%   $formattedIGST");
            controller.value.add(
                "CGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.CGST.value}");
            controller.value.add(
                "SGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.SGST.value}");
            controller.value.add("Total Amount  = $formattedTotalAmount");

            controller.saveValueListToPrefs();
            print(" ============= ${controller.result.value} ");
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

            double discountPercentage = 12.0;

            double gstAmount = controller.currentValue.value -
                (controller.currentValue.value *
                    (100 / (100 + discountPercentage)));
            double igst = gstAmount;
            double cgst = gstAmount / 2;
            double sgst = gstAmount / 2;

            double totalAmount = controller.currentValue.value - gstAmount;

            String formattedIGST = igst.toStringAsFixed(2);
            controller.CGST.value = double.parse(cgst.toStringAsFixed(2));
            controller.SGST.value = double.parse(sgst.toStringAsFixed(2));
            String formattedTotalAmount = totalAmount.toStringAsFixed(2);
            gst = true;
            controller.value.add(
                "IGST ${discountPercentage.toStringAsFixed(0)}%   $formattedIGST");
            controller.value.add(
                "CGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.CGST.value}");
            controller.value.add(
                "SGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.SGST.value}");
            controller.value.add("Total Amount  = $formattedTotalAmount");

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

            double discountPercentage = 18.0;

            double gstAmount = controller.currentValue.value -
                (controller.currentValue.value *
                    (100 / (100 + discountPercentage)));
            double igst = gstAmount;
            double cgst = gstAmount / 2;
            double sgst = gstAmount / 2;

            double totalAmount = controller.currentValue.value - gstAmount;

            String formattedIGST = igst.toStringAsFixed(2);
            controller.CGST.value = double.parse(cgst.toStringAsFixed(2));
            controller.SGST.value = double.parse(sgst.toStringAsFixed(2));
            String formattedTotalAmount = totalAmount.toStringAsFixed(2);
            gst = true;
            controller.value.add(
                "IGST ${discountPercentage.toStringAsFixed(0)}%   $formattedIGST");
            controller.value.add(
                "CGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.CGST.value}");
            controller.value.add(
                "SGST ${double.parse(discountPercentage.toStringAsFixed(0)) / 2}%    ${controller.SGST.value}");
            controller.value.add("Total Amount  = $formattedTotalAmount");

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
                      controller.prevOpertor.value = "%";
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
                  } else if (controller.prevOpertor.value == "÷") {
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
      case "÷":
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
                  controller.prevOpertor.value = "÷";
                  controller.prevOpertor2.value = "÷";
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                controller.prevOpertor.value = "÷";
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
              if (controller.prevOpertor.value == "÷") {
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
                  controller.prevOpertor.value = "÷";
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
              controller.prevOpertor.value = "÷";
              controller.prevOpertor2.value = "÷";
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
              if (controller.prevOpertor.value == "÷") {
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
              if (controller.prevOpertor.value == "÷") {
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
              if (controller.prevOpertor.value == "÷") {
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
                  print("${controller.prevOpertor.value}");
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
          } else if (controller.prevOpertor.value == "÷") {
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
                "CGST ${controller.percentage.value / 2}%   ${controller.CGST.value}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.gstAmount.value / 2;
            controller.value.add(
                "SGST ${controller.percentage.value / 2}%   ${controller.SGST.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
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
                if (controller.prevOpertor2.value == "÷") {
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
                if (controller.prevOpertor2.value == "÷") {
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
                if (controller.prevOpertor2.value == "÷") {
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
                if (controller.prevOpertor2.value == "÷") {
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
                ? InkWell(
                    onTap: () {
                      Get.toNamed('tools');
                    },
                    child: Container(
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
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      Get.toNamed('tools');
                    },
                    child: Container(
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
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.toNamed('tools');
                          },
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
                      InkWell(
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
                                              "Calculate GST %",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 2.h,),
                                            Container(
                                                height: 120, // Adjust height as needed
                                                width: 300,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15),    color: controller.dark.value
                                                  ? Color(0xff202C35)
                                                  : Colors.grey.shade300,),
                                              child: Column(children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(width: 2.w,),
                                                    Container(
                                                      child: Expanded(
                                                        child: TextField(
                                                          keyboardType: TextInputType.number,
                                                          decoration: InputDecoration(
                                                            hintText: '${context.loc.three}',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        decoration: InputDecoration(
                                                          hintText: '',

                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        decoration: InputDecoration(
                                                          hintText: '',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        decoration: InputDecoration(
                                                          hintText: '',

                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        decoration: InputDecoration(
                                                          hintText: '',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.w,),
                                                  ],
                                                ),
                                                SizedBox(height: 0.h,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(width: 2.w,),
                                                    SizedBox(height: 2.h,),
                                                    Container(
                                                      child: Expanded(
                                                        child: TextField(
                                                          keyboardType: TextInputType.number,
                                                          decoration: InputDecoration(
                                                            hintText: '',

                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                          hintText: '',

                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        decoration: InputDecoration(
                                                          hintText: '',

                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        decoration: InputDecoration(
                                                          hintText: '',

                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        decoration: InputDecoration(
                                                          hintText: '',

                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.w,),
                                                  ],
                                                ),

                                              ],),
                                            )
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
                        child: Container(
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
                                      "assets/images/tools/gst.png"),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Change GST%",
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
                      InkWell(
                        onTap: () {
                          Get.toNamed('layout');
                        },
                        child: Container(
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
                                  child: Image.asset("assets/images/cTheme.png"),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Change Layout",
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
                                                "GST ROUNDER SELECT",
                                                style: TextStyle(),
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
                              value: controller.isLoopingCurrentItem.value,
                              onChanged: (value) {
                                controller.stopSound(value);
                                print(
                                    "======stopsound==${controller.isLoopingCurrentItem.value}");
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
                              value: controller.isVibrationEnabled.value,
                              onChanged: (value) {
                                controller.vibrate(value);
                                print(
                                    "========${controller.isVibrationEnabled.value}");
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
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://en.wikipedia.org/wiki/Privacy_policy"));
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://www.termsfeed.com/blog/sample-terms-and-conditions-template/"));
                        },
                        child: Container(
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
                      InkWell(
                        onTap: () {
                          Share.share('Check out this cool app!');
                        },
                        child: Container(
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
            Obx(
              () => controller.modetrue.value
                  ? Container(
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
                                            controller.displayOprater.value ==
                                                    "="
                                                ? ""
                                                : controller
                                                    .displayOprater.value,
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
                                          child: Image.asset(
                                              "assets/images/delet.png",
                                              height: 5.h),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 43, left: 145),
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
                                      "+${context.loc.one}${context.loc.two}%",
                                      "+12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    text:
                                        "+${context.loc.one}${context.loc.two}%",
                                    imagePath: "assets/images/btn1.png"),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(
                                      "+${context.loc.one}${context.loc.eight}%",
                                      "+18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "+${context.loc.one}${context.loc.eight}%",
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
                                      "-${context.loc.one}${context.loc.two}%",
                                      "-12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "-${context.loc.one}${context.loc.two}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: "assets/images/btn1.png"),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(
                                      "-${context.loc.one}${context.loc.eight}%",
                                      "-18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "-${context.loc.one}${context.loc.eight}%",
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
                                  onclick("÷", "÷");
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
                                  double total =
                                      calculateTotal(controller.value);
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
                    )
                  : Container(
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
                                            controller.displayOprater.value ==
                                                    "="
                                                ? ""
                                                : controller
                                                    .displayOprater.value,
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
                                          child: Image.asset(
                                              "assets/images/delet.png",
                                              height: 5.h),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 43, left: 145),
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
                                      "+${context.loc.one}${context.loc.two}%",
                                      "+12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    text:
                                        "+${context.loc.one}${context.loc.two}%",
                                    imagePath: "assets/images/btn1.png"),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(
                                      "+${context.loc.one}${context.loc.eight}%",
                                      "+18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "+${context.loc.one}${context.loc.eight}%",
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
                                      "-${context.loc.one}${context.loc.two}%",
                                      "-12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "-${context.loc.one}${context.loc.two}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: "assets/images/btn1.png"),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(
                                      "-${context.loc.one}${context.loc.eight}%",
                                      "-18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "-${context.loc.one}${context.loc.eight}%",
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
                                  double total =
                                      calculateTotal(controller.value);
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
                                  onclick("÷", "÷");
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
                                Container(
                                  width: 5.w,
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
                                Container(
                                  width: 5.w,
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
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            await controller
                                .saveSelectedValue(controller.selectedValue);
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
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
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
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/mass.dart';
import 'package:units_converter/properties/time.dart';

import '../../controller/calculator_controller.dart';

class Weight_Scrren extends StatefulWidget {
  const Weight_Scrren({super.key});

  @override
  State<Weight_Scrren> createState() => _Weight_ScrrenState();
}

class _Weight_ScrrenState extends State<Weight_Scrren> {
  Calculator_Controller controller = Get.find();
  @override
  void initState() {
    super.initState();
  }

  var TextEditingController1 = new TextEditingController();
  var TextEditingController2 = new TextEditingController();
  var TextEditingController3 = new TextEditingController();
  var TextEditingController4 = new TextEditingController();
  var TextEditingController5 = new TextEditingController();
  var TextEditingController6 = new TextEditingController();
  var TextEditingController7 = new TextEditingController();
  var TextEditingController8 = new TextEditingController();
  var TextEditingController9 = new TextEditingController();
  var TextEditingController10 = new TextEditingController();
  var TextEditingController11 = new TextEditingController();
  var TextEditingController12 = new TextEditingController();
  var TextEditingController13 = new TextEditingController();
  var TextEditingController14 = new TextEditingController();
  var TextEditingController15 = new TextEditingController();

  int selected = 0;

  calculation(List<Unit> unit) {
    if (selected != 1)
      TextEditingController1.text = "${unit[0].value}";
    if (selected != 2)
      TextEditingController2.text = "${unit[1].value}";
    if (selected != 3)
      TextEditingController3.text = "${unit[2].value}";
    if (selected != 4)
      TextEditingController4.text = "${unit[3].value}";
    if (selected != 5)
      TextEditingController5.text = "${unit[4].value}";
    if (selected != 6)
      TextEditingController6.text = "${unit[5].value}";
    if (selected != 7)
      TextEditingController7.text = "${unit[6].value}";
    if (selected != 8)
      TextEditingController8.text = "${unit[7].value}";
    if (selected != 9)
      TextEditingController9.text = "${unit[8].value}";
    if (selected != 10)
      TextEditingController10.text = "${unit[9].value}";
    if (selected != 11)
      TextEditingController11.text = "${unit[10].value}";
    if (selected != 12)
      TextEditingController12.text = "${unit[11].value}";
    if (selected != 13)
      TextEditingController13.text = "${unit[12].value}";
    if (selected != 14)
      TextEditingController14.text = "${unit[13].value}";
    if (selected != 15)
      TextEditingController15.text = "${unit[14].value}";
    setState(() {});
  }

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
            "Weight",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Grams",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController1,
                    onChanged: (value) {
                      selected = 1;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.grams, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ettograms",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController2,
                    onChanged: (value) {
                      selected = 2;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.ettograms, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Kilograms",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(

                    controller: TextEditingController3,
                    onChanged: (value) {
                      selected = 3;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.kilograms, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quintals",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(

                    controller: TextEditingController4,
                    onChanged: (value) {
                      selected = 4;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.quintals, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tons",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(

                    controller: TextEditingController5,
                    onChanged: (value) {
                      selected = 5;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.tons, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Centigrams",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(

                    controller: TextEditingController6,
                    onChanged: (value) {
                      selected = 6;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.centigrams, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Milligrams",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController7,
                    onChanged: (value) {
                      selected = 7;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.milligrams, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Unifield atomic mass unit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController8,
                    onChanged: (value) {
                      selected = 8;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.uma, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Carats",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController9,
                    onChanged: (value) {
                      selected = 9;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.carats, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Pennyweights",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(

                    controller: TextEditingController10,
                    onChanged: (value) {
                      selected = 10;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.pennyweights, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Femtograms",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController11,
                    onChanged: (value) {
                      selected = 11;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.femtograms, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Picograms",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController12,
                    onChanged: (value) {
                      selected = 12;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.picograms, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nanograms",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController13,
                    onChanged: (value) {
                      selected = 13;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.nanograms, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Micrograms",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(

                    controller: TextEditingController14,
                    onChanged: (value) {
                      selected = 14;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = Mass(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(MASS.micrograms, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/digital_data.dart';
import '../../controller/calculator_controller.dart';

class Storage_Screen extends StatefulWidget {
  const Storage_Screen({super.key});

  @override
  State<Storage_Screen> createState() => _Storage_ScreenState();
}

class _Storage_ScreenState extends State<Storage_Screen> {
  Calculator_Controller controller = Get.find();

  @override
  void initState() {

    super.initState();
  }

  var TextEditingController1 = new TextEditingController();
  var TextEditingController2 = new TextEditingController();
  var TextEditingController3 = new TextEditingController();
  var TextEditingController4 = new TextEditingController();
  var TextEditingController5 = new TextEditingController();
  var TextEditingController6 = new TextEditingController();
  var TextEditingController7 = new TextEditingController();
  var TextEditingController8 = new TextEditingController();
  var TextEditingController9 = new TextEditingController();
  var TextEditingController10 = new TextEditingController();
  var TextEditingController11 = new TextEditingController();
  var TextEditingController12 = new TextEditingController();
  var TextEditingController13 = new TextEditingController();
  var TextEditingController14 = new TextEditingController();
  var TextEditingController15 = new TextEditingController();
  var TextEditingController16 = new TextEditingController();
  var TextEditingController17 = new TextEditingController();
  var TextEditingController18 = new TextEditingController();
  var TextEditingController19 = new TextEditingController();
  var TextEditingController20 = new TextEditingController();
  var TextEditingController21 = new TextEditingController();
  var TextEditingController22 = new TextEditingController();
  var TextEditingController23 = new TextEditingController();
  var TextEditingController24 = new TextEditingController();
  var TextEditingController25 = new TextEditingController();
  var TextEditingController26 = new TextEditingController();
  var TextEditingController27 = new TextEditingController();

  int selected = 0;

  calculation(List<Unit> unit) {
    if (selected != 1)
      TextEditingController1.text = "${unit[0].value}";
    if (selected != 2)
      TextEditingController2.text = "${unit[1].value}";
    if (selected != 3)
      TextEditingController3.text = "${unit[2].value}";
    if (selected != 4)
      TextEditingController4.text = "${unit[3].value}";
    if (selected != 5)
      TextEditingController5.text = "${unit[4].value}";
    if (selected != 6)
      TextEditingController6.text = "${unit[5].value}";
    if (selected != 7)
      TextEditingController7.text = "${unit[6].value}";
    if (selected != 8)
      TextEditingController8.text = "${unit[7].value}";
    if (selected != 9)
      TextEditingController9.text = "${unit[8].value}";
    if (selected != 10)
      TextEditingController10.text = "${unit[9].value}";
    if (selected != 11)
      TextEditingController11.text = "${unit[10].value}";
    if (selected != 12)
      TextEditingController12.text = "${unit[11].value}";
    if (selected != 13)
      TextEditingController13.text = "${unit[12].value}";
    if (selected != 14)
      TextEditingController14.text = "${unit[13].value}";
    if (selected != 15)
      TextEditingController15.text = "${unit[14].value}";
    if (selected != 16)
      TextEditingController16.text = "${unit[15].value}";
    if (selected != 17)
      TextEditingController17.text = "${unit[16].value}";
    if (selected != 18)
      TextEditingController18.text = "${unit[17].value}";
    if (selected != 19)
      TextEditingController19.text = "${unit[18].value}";
    if (selected != 20)
      TextEditingController20.text = "${unit[19].value}";
    if (selected != 21)
      TextEditingController21.text = "${unit[20].value}";
    if (selected != 22)
      TextEditingController22.text = "${unit[21].value}";
    if (selected != 23)
      TextEditingController23.text = "${unit[22].value}";
    if (selected != 24)
      TextEditingController24.text = "${unit[23].value}";
    if (selected != 25)
      TextEditingController25.text = "${unit[24].value}";
    if (selected != 26)
      TextEditingController26.text = "${unit[25].value}";
    if (selected != 27)
      TextEditingController27.text = "${unit[26].value}";

    setState(() {});
  }

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
            "Storage",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Bit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController1,
                    onChanged: (value) {
                      selected = 1;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(DIGITAL_DATA.bit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nibble",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController2,
                    onChanged: (value) {
                      selected = 2;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.nibble, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "KiloBit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController3,
                    onChanged: (value) {
                      selected = 3;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          DIGITAL_DATA.kilobit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "MegaBit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController4,
                    onChanged: (value) {
                      selected = 4;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.megabit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "GigaBit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController5,
                    onChanged: (value) {
                      selected = 5;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.gigabit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "TeraBit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController6,
                    onChanged: (value) {
                      selected = 6;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          DIGITAL_DATA.terabit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "PetaBit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController7,
                    onChanged: (value) {
                      selected = 7;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.petabit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ExaBit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController8,
                    onChanged: (value) {
                      selected = 8;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.exabit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Kibibite",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController9,
                    onChanged: (value) {
                      selected = 9;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.kibibit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Byte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController10,
                    onChanged: (value) {
                      selected = 10;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.byte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Mebibit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController11,
                    onChanged: (value) {
                      selected = 11;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.mebibit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Kilobyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController12,
                    onChanged: (value) {
                      selected = 12;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.kilobyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Megabyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController13,
                    onChanged: (value) {
                      selected = 13;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.megabyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gigabyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController14,
                    onChanged: (value) {
                      selected = 14;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.gigabyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Terabyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController15,
                    onChanged: (value) {
                      selected = 15;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          DIGITAL_DATA.terabyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Petabyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController16,
                    onChanged: (value) {
                      selected = 16;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.petabyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Exabyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController17,
                    onChanged: (value) {
                      selected = 17;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.exabyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Kibibyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController18,
                    onChanged: (value) {
                      selected = 18;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.kibibyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gibibit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController19,
                    onChanged: (value) {
                      selected = 19;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.gibibit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Mebibyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController20,
                    onChanged: (value) {
                      selected = 20;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.mebibyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tebibit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController21,
                    onChanged: (value) {
                      selected = 21;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.tebibit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gibibyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController22,
                    onChanged: (value) {
                      selected = 22;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.gibibyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Pebibit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController23,
                    onChanged: (value) {
                      selected = 23;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.pebibit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tebibyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController24,
                    onChanged: (value) {
                      selected = 24;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.tebibyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Exbibit",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController25,
                    onChanged: (value) {
                      selected = 25;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.exbibit, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Pebibyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController26,
                    onChanged: (value) {
                      selected = 26;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.pebibyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Exbibyte",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.5.h,
                  child: TextField(
                    controller: TextEditingController27,
                    onChanged: (value) {
                      selected = 27;
                      if (value == "") {
                        value = "0";
                        return;
                      }
                      var angle = DigitalData(significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(DIGITAL_DATA.exbibyte, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print(
                            'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
                      }
                      // FocusScope.of(context).requestFocus(_etYear.focusNode);
                    },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Layout_Model
{
  String? img;
  Layout_Model({this.img});
}

  List<Layout_Model> layoutList = [
    Layout_Model(img: "assets/images/layout/theme1.png"),
    Layout_Model(img: "assets/images/layout/theme2.png"),
    Layout_Model(img: "assets/images/layout/theme3.png"),
    Layout_Model(img: "assets/images/layout/theme4.png"),
    Layout_Model(img: "assets/images/layout/theme5.png"),
    Layout_Model(img: "assets/images/layout/theme6.png"),
    Layout_Model(img: "assets/images/layout/theme7.png"),
    Layout_Model(img: "assets/images/layout/theme8.png"),
    Layout_Model(img: "assets/images/layout/theme9.png"),
  ];
  RxInt selectedImageIndex = 0.obs;
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';

import '../../controller/calculator_controller.dart';

class Change_Layout_Scrren extends StatefulWidget {
  const Change_Layout_Scrren({super.key});

  @override
  State<Change_Layout_Scrren> createState() => _Change_Layout_ScrrenState();
}

class _Change_Layout_ScrrenState extends State<Change_Layout_Scrren> {
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
            "Choose Theme",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() =>  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                        "${controller.layoutList[controller.selectedImageIndex.value].img}",
                        height: 30.h,
                        width: 40.w,
                        fit: BoxFit.fill,
                      ),
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                height: 23.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: controller.dark.value
                        ? Color(0xff202C35)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Basic Calculator",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Simple calculatore for daily life calculations.",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Text(
                      "Not for memory and gst operation.",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    SizedBox(height: 1.5.h,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 80.w,
                            height: 12.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.selectedImageIndex.value = index;
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Row(children: [
                                        SizedBox(width: 1.5.w,),
                                        Container(height: 12.h,child: Image.asset("${controller.layoutList[index].img}"))
                                      ],),
                                      if (controller.selectedImageIndex.value == index)
                                        Column(
                                          children: [
                                            SizedBox(height: 5.5.h,),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 5.5.w,),
                                                Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
                                                  child: Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: controller.layoutList.length,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 1.5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed('/');
                          },
                          child: Container(
                            height: 5.4.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: Color(0xff4777E3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "FREE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}

