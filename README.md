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
import 'package:flutter/material.dart';
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
import '../utils/ads_helper/ads_helper.dart';

String? str;
String? str1;
String? str2;
String? str3;
String? str4;
String? str5;
String? str6;
String? str7;
TextEditingController gst1 = TextEditingController();
TextEditingController gst2 = TextEditingController();
TextEditingController gst3 = TextEditingController();
TextEditingController gst4 = TextEditingController();
TextEditingController gst5 = TextEditingController();
TextEditingController gst6 = TextEditingController();
TextEditingController gst7 = TextEditingController();
TextEditingController gst8 = TextEditingController();

class Calculator_Home extends StatefulWidget {
  const Calculator_Home({super.key});

  @override
  State<Calculator_Home> createState() => _Calculator_HomeState();
}

class _Calculator_HomeState extends State<Calculator_Home> {
  Calculator_Controller controller = Get.find();
  Ads_Helper adsController = Get.find();
  ScrollController scrollcontroller = ScrollController();

  bool onetime = false;
  bool onetime2 = false;
  bool onetime3 = false;
  bool arathmeticoperator = false;
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
  bool mplus = false;
  bool m1 = false;
  bool m2 = false;
  bool eqval = false;
  bool mrprint = false;
  bool rootprint = false;

  String? convertHindiToEnglish(String hindiNumber) {
    switch (controller.selectedIndexLanguage.value) {
      case 0:
        {
          Map<String, String> conversionMap = {
            '૦': '0',
            '૧': '1',
            '૨': '2',
            '૩': '3',
            '૪': '4',
            '૫': '5',
            '૬': '6',
            '૭': '7',
            '૮': '8',
            '૯': '9',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
      case 1:
        {
          Map<String, String> conversionMap = {
            '0': '0',
            '1': '1',
            '2': '2',
            '3': '3',
            '4': '4',
            '5': '5',
            '6': '6',
            '7': '7',
            '8': '8',
            '9': '9',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
      case 2:
        {
          Map<String, String> conversionMap = {
            '٠': '0',
            '١': '1',
            '٢': '2',
            '٣': '3',
            '٤': '4',
            '٥': '5',
            '٦': '6',
            '٧': '7',
            '٨': '8',
            '٩': '9',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
      case 3:
        {
          Map<String, String> conversionMap = {
            '०': '0',
            '१': '1',
            '२': '2',
            '३': '3',
            '४': '4',
            '५': '5',
            '६': '6',
            '७': '7',
            '८': '8',
            '९': '9',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
    }
    setState(() {});
    return null;
    //return result;
  }

  String? englishToHindi(String englishNumber) {
    String hindiNumber = englishNumber;
    print(hindiNumber); // Output: १००

    switch (controller.selectedIndexLanguage.value) {
      case 0:
        {
          Map<String, String> conversionMap = {
            '0': '૦',
            '1': '૧',
            '2': '૨',
            '3': '૩',
            '4': '૪',
            '5': '૫',
            '6': '૬',
            '7': '૭',
            '8': '૮',
            '9': '૯',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
      case 1:
        {
          Map<String, String> conversionMap = {
            '0': '0',
            '1': '1',
            '2': '2',
            '3': '3',
            '4': '4',
            '5': '5',
            '6': '6',
            '7': '7',
            '8': '8',
            '9': '9',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
      case 2:
        {
          Map<String, String> conversionMap = {
            '0': '٠',
            '1': '١',
            '2': '٢',
            '3': '٣',
            '4': '٤',
            '5': '٥',
            '6': '٦',
            '7': '٧',
            '8': '٨',
            '9': '٩',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
      case 3:
        {
          Map<String, String> conversionMap = {
            '0': '०',
            '1': '१',
            '2': '२',
            '3': '३',
            '4': '४',
            '5': '५',
            '6': '६',
            '7': '७',
            '8': '८',
            '9': '९',
          };

          String result = '';
          for (int i = 0; i < hindiNumber.length; i++) {
            String digit = hindiNumber[i];

            String? hindiDigit = conversionMap[digit];

            if (hindiDigit != null) {
              result += hindiDigit;
              print("result ${result}");
            } else {
              result += digit;
              print("result2 ${result}");
            }
          }
          return result;
        }
    }
    scrolle();
    setState(() {});
    return null;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() async {
        controller.initPrefs();
        await controller.savetheme();
        print("=== ${controller.selectedImageIndex.value}");
        controller.saveSelectedImageIndex(controller.selectedImageIndex.value);
        controller.changetheme();
        controller.value.clear();
        controller.loadSound();
        colorchangebg();
        controller.loadSelectedLanguageIndex();
        print(
            "======controller.selectedIndexLanguage.value=======${controller.selectedIndexLanguage.value}===============");
      });
    });
    super.initState();
  }

  Future<void> callAdmob() async {
    adsController.loadAd();
  }

  void colorchangebg() {
    print(
        "==controller.selectedImageIndex.value ${controller.selectedImageIndex.value}");
    switch (controller.selectedImageIndex.value) {
      case 0:
        {
          controller.backgroundColor.value = Colors.white;
        }
      case 1:
        {
          controller.backgroundColor.value = Color(0xfff5f6f7);
        }
      case 2:
        {
          controller.backgroundColor.value = Color(0xfff5eeeb);
        }
      case 3:
        {
          controller.backgroundColor.value = Color(0xffEEEEEE);
        }
      case 4:
        {
          controller.backgroundColor.value = Color(0xffFFFBEF);
        }
      case 5:
        {
          controller.backgroundColor.value = Color(0xfffaf1eb);
        }
      case 6:
        {
          controller.backgroundColor.value = Color(0xfff2fafc);
        }
      case 7:
        {
          controller.backgroundColor.value = Color(0xfff9f2fa);
        }
      case 8:
        {
          controller.backgroundColor.value = Color(0xfff9f2fa);
        }
    }
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
      print("++++++++++++++++ true ++++++++++++++");
    } else {
      print("++++++++++++++++ false ++++++++++++++");
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
          display =
              controller.memory.value.toString() + controller.prevOpertor.value;
          print("display$display");
          print("display${controller.memory.value}");
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
          // controller.display.value = "";
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
        mplus = false;
        rootprint = false;
        arathmeticoperator = false;
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
        m1 = false;
        m2 = false;
        update = false;
        eqval = false;
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
        if (controller.displayEnglish.value.isEmpty &&
            controller.value.isEmpty) {
        } else {
          if (controller.displayEnglish.value == "") {
            if (controller.prevOpertor.value == "+") {
            } else if (controller.prevOpertor.value == "-") {
            } else if (controller.prevOpertor.value == "*") {
            } else if (controller.prevOpertor.value == "÷") {
            } else {
              int lastIndex = -1;
              for (int i = controller.value.length - 1; i >= 0; i--) {
                if (controller.value[i].contains('=')) {
                  lastIndex = i;
                  break;
                }
              }
              print("------- lastIndex ------ ${lastIndex}");
              if (controller.value[lastIndex].contains('=')) {
                controller.displayEnglish.value =
                    controller.value[lastIndex].replaceAll("=", '');
                dotcheck = true;
              } else {
                controller.currentValue.value =
                    double.parse(controller.displayEnglish.value);
              }
            }
          } else {
            controller.currentValue.value =
                double.parse(controller.displayEnglish.value);
          }

          if (click == "+3%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(+3%)";
            controller.value.add(controller.displayEnglish.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.displayEnglish.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            twonumber = "0.0" + double.parse('$str').toStringAsFixed(0);
            print(
                " --------------- ${"0.0" + double.parse('$str').toStringAsFixed(0)} ------------------------ ");
            controller.percentage.value =
                controller.currentValue.value * double.parse('$twonumber');
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
            controller.value.add(
                "IGST ${double.parse('${str}').toStringAsFixed(0)}%  ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            double divid = double.parse('$str').roundToDouble();
            controller.value.add("CGST ${divid / 2}%   ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST ${divid / 2}%   ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add(" = ${controller.result.value}");
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
            print("display ${controller.display.value}");

            controller.currentValue.value =
                double.parse(controller.displayEnglish.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            twonumber = "0.0" + double.parse('$str1').toStringAsFixed(0);
            print(
                " --------------- ${"0.0" + double.parse('$str1').toStringAsFixed(0)} ------------------------ ");
            controller.percentage.value =
                controller.currentValue.value * double.parse('$twonumber');
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
            controller.value.add(
                "IGST ${double.parse('$str1').toStringAsFixed(0)}%   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            double divid = double.parse('$str1');

            controller.value
                .add("CGST ${divid / 2}%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());

            controller.value
                .add("SGST ${divid / 2}%   " + twonumber.toString());
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            print("result 5 ${controller.result.value}");
            controller.value.add(" = ${controller.result.value}");
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
                double.parse(controller.displayEnglish.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            twonumber = "0.0" + double.parse('$str2').toStringAsFixed(0);
            print(
                " --------------- ${"0.0" + double.parse('$str2').toStringAsFixed(0)} ------------------------ ");
            controller.percentage.value =
                controller.currentValue.value * double.parse('$twonumber');
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
            controller.value.add(
                "IGST ${double.parse('$str2').toStringAsFixed(0)}%   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            double divid = double.parse('$str2');
            controller.value.add("CGST ${divid / 2}%     ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST ${divid / 2}%     ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add(" = ${controller.result.value}");
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
                double.parse(controller.displayEnglish.value);
            print("currentValue ${controller.currentValue.value}");
            print("percentage ${controller.percentage.value}");
            twonumber = "0.0" + double.parse('$str3').toStringAsFixed(0);
            print(
                " --------------- ${"0.0" + double.parse('$str3').toStringAsFixed(0)} ------------------------ ");
            controller.percentage.value =
                controller.currentValue.value * double.parse('$twonumber');
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
            controller.value.add(
                "IGST ${double.parse('$str3').toStringAsFixed(0)}%   ${twonumber}");
            controller.saveValueListToPrefs();

            controller.CGST.value = controller.percentage.value / 2;
            twonumber = controller.CGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            double divid = double.parse('$str3');
            controller.value.add("CGST ${divid / 2}%    ${twonumber}");
            controller.saveValueListToPrefs();
            controller.SGST.value = controller.percentage.value / 2;
            twonumber = controller.SGST.value
                .toStringAsFixed(controller.currentSliderValue.value.toInt());
            controller.value.add("SGST ${divid / 2}%    ${twonumber}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.percentage.value;
            controller.value.add(" = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;
            controller.prevOpertor2.value = number;
            print(controller.percentage.value);
          } else if (click == "+GST") {
            scrolle();
            dotAdded = false;
            gst = true;
            controller.displayOprater.value = number;
            print("currentValue ${controller.currentValue}");

            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
          }

          print(controller.currentValue.value);
          print(controller.result.value);
          controller.prevOpertor.value = "+GST";
          controller.display.value = "";
          // controller.displayEnglish.value = controller.result.value.toString();
        }

        break;

      case "-3%":
      case "-5%":
      case "-12%":
      case "-18%":
      case "-GST":
        if (controller.displayEnglish.value.isEmpty &&
            controller.value.isEmpty) {
        } else {
          if (controller.displayEnglish.value == "") {
            if (controller.prevOpertor.value == "+") {
            } else if (controller.prevOpertor.value == "-") {
            } else if (controller.prevOpertor.value == "*") {
            } else if (controller.prevOpertor.value == "÷") {
            } else {
              int lastIndex = -1;
              for (int i = controller.value.length - 1; i >= 0; i--) {
                if (controller.value[i].contains('=')) {
                  lastIndex = i;
                  break;
                }
              }
              print("------- lastIndex ------ ${lastIndex}");
              if (controller.value[lastIndex].contains('=')) {
                controller.displayEnglish.value =
                    controller.value[lastIndex].replaceAll("=", '');
                dotcheck = true;
              } else {
                controller.currentValue.value =
                    double.parse(controller.displayEnglish.value);
              }
            }
          } else {
            controller.currentValue.value =
                double.parse(controller.displayEnglish.value);
          }

          if (click == "-3%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-3%)";
            controller.value.add(controller.displayEnglish.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.displayEnglish.value);

            print("=========== -gst ${str4}");
            double discountPercentage = double.parse('$str4');

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
            controller.value.add("  = $formattedTotalAmount");

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
                double.parse(controller.displayEnglish.value);

            double discountPercentage = double.parse('$str5');

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
            controller.value.add("  = $formattedTotalAmount");

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
                double.parse(controller.displayEnglish.value);

            double discountPercentage = double.parse('$str6');

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
            controller.value.add("  = $formattedTotalAmount");

            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
          } else if (click == "-18%") {
            scrolle();
            dotAdded = false;
            controller.prevOpertor.value = "(-18%)";
            controller.value.add(controller.display.value);
            controller.saveValueListToPrefs();
            controller.currentValue.value =
                double.parse(controller.displayEnglish.value);

            double discountPercentage = double.parse('$str7');

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
            controller.value.add("  = $formattedTotalAmount");

            controller.saveValueListToPrefs();
            controller.prevOpertor2.value = number;
          } else if (click == "-GST") {
            dotAdded = false;
            gst = true;
            controller.displayOprater.value = number;
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
                  .replaceAll("MR÷", "");
              print("iiiiii");
            } else {
              if (controller.memory.value == 0.0) {
              } else {
                print('vvvvvvvvvvvvvvv ${controller.memory.value}');
                controller.display.value = controller.memory.value.toString();
              }
            }
            controller.prevOpertor.value = "MR ";
            print('mrrrrrrrrrrrrrrrrrr');
          } else {
            if (controller.memory.value == 0.0) {
              controller.display.value = "";
              controller.value.clear();
            } else {
              print('mrrrrrrrrrrrrrrrrrr11111111');
              controller.display.value = controller.memory.value.toString();
              print("eeeeeeeeeee");
            }
          }

          break;
        }
      case "M-":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            print('dtfsdtgfstdgfsgdfy');

            if (controller.value.isEmpty) {
            } else {
              controller.display.value =
                  controller.value.last.replaceAll("=", "");
              print(" controller.display.value${controller.display.value}");
              print(
                  'MMMMMMMMMMMMMMMxxxxxxxx${controller.memory.value}++++++++++');
              controller.display.value.isEmpty
                  ? ""
                  : controller.memory.value -=
                      double.parse(controller.display.value);
              print(
                  'MMMMMMMMMMMMMMMxxxxxxxxx${controller.memory.value}++++++++++');
              mplus = true;
              print('ddddddd----${controller.prevOpertor2.value}');
              if (controller.prevOpertor2.value == '+') {
                print('ddddddd----');
                m1 = true;
              } else if (controller.prevOpertor2.value == '-') {
                print('----dddddddd-------');
                m2 = true;
              }
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "M-";
              controller.m.value = "M-";
            }
          } else {
            if (controller.prevOpertor.value == '+') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);
              controller.result.value +=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(0);
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value -=
                  double.parse(controller.displayEnglish.value);
              mplus = true;
              m1 = true;
              m2 = false;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else if (controller.prevOpertor.value == '-') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);
              controller.result.value -=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(0);
              m1 = false;
              m2 = true;
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value -=
                  double.parse(controller.displayEnglish.value);
              mplus = true;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else if (controller.prevOpertor.value == '*') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);
              controller.result.value *=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(0);
              m1 = false;
              m2 = true;
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value -=
                  double.parse(controller.displayEnglish.value);
              mplus = true;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else if (controller.prevOpertor.value == '÷') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);
              controller.result.value /=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(1);
              m1 = false;
              m2 = true;
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value -=
                  double.parse(controller.displayEnglish.value);
              mplus = true;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else {
              if (mplus == true) {
                print(
                    'MMMMMMMMMMMMMMM${controller.displayEnglish.value}++++++++++');
                controller.memory.value -=
                    double.parse(controller.displayEnglish.value);
                print('MMMMMMMMMMMMMMM${controller.memory.value}++++++++++');
              } else {
                print('MMMMMMMMMMMMMMM++++++++++');
                print(
                    'MMMMMMMMMMMMMMM${controller.displayEnglish.value}++++++++++');
                controller.memory.value -=
                    double.parse(controller.displayEnglish.value);
                print('MMMMMMMMMMMMMMM${controller.memory.value}++++++++++');
              }
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "M-";
              controller.m.value = "M-";
            }
          }

          break;
        }

      case "M+":
        {
          scrolle();
          dotAdded = false;
          if (controller.displayEnglish.value.isEmpty) {
            print('dtfsdtgfstdgfsgdfy');

            if (controller.value.isEmpty) {
            } else {
              controller.display.value =
                  controller.value.last.replaceAll("=", "");
              print(" controller.display.value${controller.display.value}");
              print(
                  'MMMMMMMMMMMMMMMxxxxxxxx${controller.memory.value}++++++++++');
              controller.display.value.isEmpty
                  ? ""
                  : controller.memory.value +=
                      double.parse(controller.display.value);
              print(
                  'MMMMMMMMMMMMMMMxxxxxxxxx${controller.memory.value}++++++++++');
              mplus = true;
              print('ddddddd----${controller.prevOpertor2.value}');
              if (controller.prevOpertor2.value == '+') {
                print('ddddddd----');
                m1 = true;
              } else if (controller.prevOpertor2.value == '-') {
                print('----dddddddd-------');
                m2 = true;
              }
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "M+";
              controller.m.value = "M+";
            }
          } else {
            if (controller.prevOpertor.value == '+') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);
              controller.result.value +=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(0);
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value +=
                  double.parse(controller.displayEnglish.value);

              mplus = true;
              m1 = true;
              m2 = false;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else if (controller.prevOpertor.value == '-') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);
              controller.result.value -=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(0);
              m1 = false;
              m2 = true;
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value +=
                  double.parse(controller.displayEnglish.value);
              mplus = true;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else if (controller.prevOpertor.value == '*') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);

              controller.result.value *=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(0);
              m1 = false;
              m2 = true;
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value +=
                  double.parse(controller.displayEnglish.value);
              mplus = true;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else if (controller.prevOpertor.value == '÷') {
              print('kkkkkkkkkkkkkkk');

              print(controller.prevOpertor.value);

              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);

              controller.saveValueListToPrefs();
              print("jjjjjjjj11rrrrrrrrr");
              print(controller.displayEnglish.value);
              print(controller.result.value);

              controller.result.value /=
                  double.parse(controller.displayEnglish.value);
              twonumber = controller.result.value.toStringAsFixed(1);
              m1 = false;
              m2 = true;
              controller.value.add("= " + twonumber.toString());
              controller.saveValueListToPrefs();
              scrolle();
              print(controller.result.value);
              controller.display.value = controller.result.value.toString();
              controller.displayEnglish.value =
                  controller.result.value.toString();
              controller.memory.value +=
                  double.parse(controller.displayEnglish.value);
              mplus = true;
              controller.displayOprater.value = number;
              controller.prevOpertor.value = '';
            } else {
              if (mplus == true) {
                print(
                    'MMMMMMMMMMMMMMM${controller.displayEnglish.value}++++++++++');
                controller.memory.value +=
                    double.parse(controller.displayEnglish.value);
                print('MMMMMMMMMMMMMMM${controller.memory.value}++++++++++');
              } else {
                print('MMMMMMMMMMMMMMM++++++++++');
                print(
                    'MMMMMMMMMMMMMMM${controller.displayEnglish.value}++++++++++');
                controller.memory.value +=
                    double.parse(controller.displayEnglish.value);
                print('MMMMMMMMMMMMMMM${controller.memory.value}++++++++++');
              }

              controller.displayOprater.value = number;
              controller.prevOpertor.value = "M+";
              controller.m.value = "M+";
            }
          }

          break;
        }
      case "MU":
        {
          scrolle();
          dotAdded = false;

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
                  print('ccccccccccccccccccccc');
                  controller.display.value =
                      controller.value.last.replaceAll("=", "");
                  controller.displayOprater.value = number;
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
                if (controller.prevOpertor.value == '+') {
                  print('kkkkkkkkkkkkkkk');

                  print(controller.prevOpertor.value);

                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);

                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11rrrrrrrrr");
                  print(controller.displayEnglish.value);
                  print(controller.result.value);
                  controller.result.value +=
                      double.parse(controller.displayEnglish.value);
                  twonumber = controller.result.value.toStringAsFixed(0);
                  controller.value.add("= " + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                  print(controller.result.value);
                  controller.display.value = controller.result.value.toString();
                  controller.displayOprater.value = number;

                  controller.value.add(controller.display.value +
                      controller.displayOprater.value);
                  controller.saveValueListToPrefs();
                  controller.prevOpertor.value = '';
                } else if (controller.prevOpertor.value == '-') {
                  print('kkkkkkkkkkkkkkk');

                  print(controller.prevOpertor.value);

                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);

                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11rrrrrrrrr");
                  print(controller.displayEnglish.value);
                  print(controller.result.value);
                  controller.result.value -=
                      double.parse(controller.displayEnglish.value);
                  twonumber = controller.result.value.toStringAsFixed(0);

                  controller.value.add("= " + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                  print(controller.result.value);
                  controller.display.value = controller.result.value.toString();

                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = '';
                } else if (controller.prevOpertor.value == '*') {
                  print('kkkkkkkkkkkkkkk');

                  print(controller.prevOpertor.value);

                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);

                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11rrrrrrrrr");
                  print(controller.displayEnglish.value);
                  print(controller.result.value);
                  controller.result.value *=
                      double.parse(controller.displayEnglish.value);
                  twonumber = controller.result.value.toStringAsFixed(0);

                  controller.value.add("= " + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                  print(controller.result.value);
                  controller.display.value = controller.result.value.toString();

                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = '';
                } else if (controller.prevOpertor.value == '÷') {
                  print('kkkkkkkkkkkkkkk');

                  print(controller.prevOpertor.value);

                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);

                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11rrrrrrrrr");
                  print(controller.displayEnglish.value);
                  print(controller.result.value);
                  controller.result.value /=
                      double.parse(controller.displayEnglish.value);
                  twonumber = controller.result.value.toStringAsFixed(1);

                  controller.value.add("= " + twonumber.toString());
                  controller.saveValueListToPrefs();
                  scrolle();
                  print(controller.result.value);
                  controller.display.value = controller.result.value.toString();

                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = '';
                } else {
                  print('MMMMMMMMMMMMMMMfffffffffff++++++++++');
                  onetime3 = false;
                  display = controller.display.value;
                  controller.display.value = controller.value[2];
                  controller.displayOprater.value = number;
                  controller.value.add(controller.displayEnglish.value +
                      controller.displayOprater.value);
                  controller.saveValueListToPrefs();

                  controller.displayOprater.value = number;
                  controller.prevOpertor.value = "M+";
                  controller.m.value = "M+";
                }
                controller.displayOprater.value = number;
                controller.prevOpertor.value = "MU";
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
              int lastIndex = -1;
              for (int i = controller.value.length - 1; i >= 0; i--) {
                if (controller.value[i].contains('=')) {
                  lastIndex = i;
                  break;
                }
              }
              print("------- lastIndex ------ ${lastIndex}");
              if (controller.value[lastIndex].contains('=')) {
                controller.display.value =
                    controller.value[lastIndex - 4].replaceAll("=", "");
                controller.value.removeAt(controller.value.length - 5);
                controller.value.removeAt(controller.value.length - 4);
                controller.value.removeAt(controller.value.length - 3);
                controller.value.removeAt(controller.value.length - 2);
                controller.value.removeAt(controller.value.length - 1);
              } else {
                controller.display.value = controller.value[0];
              }
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
                      print("controller.value[0] ${controller.value[0]}");

                      controller.currentValue.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!);
                      print("currentValue ${controller.currentValue.value}");
                      print("display ${display}");
                      print("display ${controller.displayEnglish.value}");

                      double percentageValue = controller.currentValue.value *
                          double.parse(controller.displayEnglish.value);

                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue ${percentageValue}");
                      double newValue =
                          controller.currentValue.value + percentageValue;

                      print("newValue1 $newValue");
                      // Update the display with the new value
                      controller.display.value = "";

                      controller.displayEnglish.value =
                          newValue.toStringAsFixed(0).toString();
                      controller.displayOprater.value = "=";
                      controller.prevOpertor.value = "%";
                      arathmeticoperator = true;
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                      controller.prevOpertor.value = "";
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
                      controller.currentValue.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue = controller.currentValue.value *
                          double.parse(controller.displayEnglish.value);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue $percentageValue");
                      double newValue =
                          controller.currentValue.value - percentageValue;

                      print("newValue2 $newValue");
                      // Update the display with the new value
                      controller.display.value = "";

                      controller.displayEnglish.value =
                          newValue.toStringAsFixed(0).toString();
                      controller.displayOprater.value = "=";
                      controller.prevOpertor.value = "%";
                      print("nnnnnnnnnnn ${controller.result.value}");
                      arathmeticoperator = true;
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
                      controller.currentValue.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue = controller.currentValue.value *
                          double.parse(controller.displayEnglish.value);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue $percentageValue");
                      print('************');
                      double newValue =
                          controller.currentValue.value * percentageValue;

                      print("newValue3 $newValue");
                      // Update the display with the new value
                      controller.display.value = "";

                      controller.displayEnglish.value =
                          percentageValue.toStringAsFixed(0).toString();
                      controller.displayOprater.value = "=";
                      controller.prevOpertor.value = "%";
                      arathmeticoperator = true;
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
                      controller.currentValue.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!);
                      print("currentValue ${controller.currentValue.value}");
                      double percentageValue = controller.currentValue.value *
                          double.parse(controller.displayEnglish.value);
                      print("percentageValue $percentageValue");
                      percentageValue /= 100;
                      print("percentageValue $percentageValue");
                      double newValue =
                          controller.currentValue.value / percentageValue;

                      print("newValue4 $newValue");
                      // Update the display with the new value
                      controller.display.value = "";

                      controller.displayEnglish.value =
                          percentageValue.toStringAsFixed(1).toString();
                      controller.displayOprater.value = "=";
                      controller.prevOpertor.value = "%";
                      arathmeticoperator = true;
                      // print(controller.result);
                      controller.displayEnglish.value.isEmpty
                          ? ""
                          : controller.value.add(
                              controller.displayOprater.value +
                                  controller.displayEnglish.value);
                      controller.saveValueListToPrefs();
                    }
                  } else {
                    print('1111111111111111111111');
                    if (controller.display.value == "") {
                      controller.display.value =
                          controller.value.last.replaceAll("=", "");
                      controller.value
                          .add(controller.display.value.replaceAll("=", ""));
                      controller.saveValueListToPrefs();
                    } else {
                      controller.value.add(controller.prevOpertor.value +
                          controller.display.value.replaceAll("=", ""));
                      controller.saveValueListToPrefs();
                    }

                    print(controller.value);
                    double percentageValue =
                        double.parse(controller.display.value);

                    print("percentageValue $percentageValue");
                    percentageValue /= 100;
                    print("percentageValue ${percentageValue}");
                    double newValue =
                        controller.currentValue.value + percentageValue;

                    print("newValue1 $newValue");

                    // Update the display with the new value
                    controller.display.value = "";

                    controller.displayEnglish.value =
                        percentageValue.toString();
                    controller.displayOprater.value = "=";
                    controller.prevOpertor.value = "%";
                    controller.value.add(controller.prevOpertor.value);
                    controller.saveValueListToPrefs();
                    arathmeticoperator = true;
                    // print(controller.result);
                    controller.displayEnglish.value.isEmpty
                        ? ""
                        : controller.value.add(controller.displayOprater.value +
                            controller.displayEnglish.value);
                    controller.saveValueListToPrefs();
                    controller.displayEnglish.value = "";
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
                        double.parse(convertHindiToEnglish(
                            controller.display.value.replaceAll("%", ""))!);
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

                    controller.currentValue.value =
                        double.parse(controller.value[3].replaceAll("MU", ""));
                    print("currentValue ${controller.currentValue.value}");
                    double percentageValue =
                        controller.currentValue.value * 100;
                    print("percentageValue $percentageValue");
                    print(
                        "percentageValue1111111111111111 ${controller.display.value}");
                    double r = 100 -
                        double.parse(
                            convertHindiToEnglish(controller.display.value)!);
                    print(percentageValue);
                    print(r);
                    double r1 = percentageValue / r;
                    print(r1);
                    controller.value
                        .add(controller.prevOpertor.value + r1.toString());
                    controller.saveValueListToPrefs();
                    print(controller.value);
                    controller.display.value = "";
                    controller.displayEnglish.value = "";
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
              controller.currentValue.value =
                  double.parse(convertHindiToEnglish(display)!);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              print("display ${controller.display.value}");
              double r = 100 -
                  double.parse(convertHindiToEnglish(controller.display.value)!
                      .replaceAll("%", ""));
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

              controller.currentValue.value =
                  double.parse(convertHindiToEnglish(display)!);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue = controller.currentValue.value * 100;
              print("percentageValue $percentageValue");
              double r = 100 -
                  double.parse(
                      convertHindiToEnglish(controller.display.value)!);
              print(percentageValue);
              print(r);
              double r1 = percentageValue / r;
              print(r1);
              controller.value
                  .add(controller.prevOpertor.value + r1.toString());
              controller.saveValueListToPrefs();
              print(controller.value);
              controller.display.value = "";
              controller.displayEnglish.value = "";
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
              print("4000000000000000000${controller.display.value}");
              print("4444444444444${controller.value[3].replaceAll("MU", "")}");
              controller.value[2].contains('=')
                  ? display = controller.value[3].replaceAll("MU", "")
                  : display = controller.value[0].replaceAll("MU", "");
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
              controller.displayEnglish.value = "";
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
            if (controller.value[0].isEmpty) {
            } else {
              int lastIndex = -1;
              for (int i = controller.value.length - 1; i >= 0; i--) {
                if (controller.value[i].contains('=')) {
                  lastIndex = i;
                  break;
                }
              }
              print("------- lastIndex ------ ${lastIndex}");
              if (controller.value[lastIndex].contains('=')) {
                print('5555555555555555555555');
                controller.displayEnglish.value =
                    controller.value[lastIndex].replaceAll("=", '');
                controller.value.add(controller.value[lastIndex - 2]);
                controller.value
                    .add("√" + controller.displayEnglish.value.toString());
                controller.saveValueListToPrefs();
                double squareRoot =
                    sqrt(double.parse(controller.displayEnglish.value));

                controller.display.value = squareRoot.toString();
                double secoundvalue = double.parse(controller.display.value);
                controller.prevOpertor.value = "=";
                controller.value.add(controller.prevOpertor.value +
                    secoundvalue.toStringAsFixed(3));
                controller.saveValueListToPrefs();
                controller.display.value = "";
                controller.displayEnglish.value = "";
              } else {
                print('3333333333333333333333');
              }
            }
          } else {
            rootprint = true;
            print('444444444444444333333333333333333333333344444444');
            controller.value
                .add("√" + controller.displayEnglish.value.toString());
            controller.saveValueListToPrefs();
            double currentValue = double.parse(controller.displayEnglish.value);

            if (currentValue >= 0) {
              print('currentValue ${currentValue}');

              double squareRoot = sqrt(currentValue);

              print('3333333333333333333333');
              controller.display.value = squareRoot.toString();
              double secoundvalue = double.parse(controller.display.value);
              controller.prevOpertor.value = "=";
              controller.value.add(controller.prevOpertor.value +
                  secoundvalue.toStringAsFixed(3));
              controller.saveValueListToPrefs();
              controller.display.value = "";
              controller.displayEnglish.value = "";
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
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                if (controller.prevOpertor.value == "+") {
                } else if (controller.prevOpertor.value == "-") {
                } else if (controller.prevOpertor.value == "*") {
                } else if (controller.prevOpertor.value == "÷") {
                } else {
                  int lastIndex = -1;
                  for (int i = controller.value.length - 1; i >= 0; i--) {
                    if (controller.value[i].contains('=')) {
                      lastIndex = i;
                      break;
                    }
                  }
                  print("------- lastIndex ------ ${lastIndex}");
                  if (controller.value[lastIndex].contains('=')) {
                    controller.value
                        .add(controller.value[lastIndex].replaceAll("=", ''));
                    controller.saveValueListToPrefs();
                    controller.result.value = double.parse(
                        controller.value[lastIndex].replaceAll("=", ''));
                  } else {
                    controller.result.value = double.parse(controller.value[0]);
                  }
                }
                print('------- ${controller.result.value}');
              }
            }
            controller.display.value = "";
            controller.displayEnglish.value = "";
            controller.displayOprater.value = number;
            controller.prevOpertor.value = "÷";
            controller.prevOpertor2.value = "÷";
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
              if (controller.prevOpertor.value == "%") {
                controller.result.value =
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
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

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
                      controller.prevOpertor.value == "%" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    // controller.value.add(controller.display.value);
                    // controller.saveValueListToPrefs();
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
                        convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));
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
                }
              }
            } else {
              if (controller.value[0].isEmpty) {
              } else {
                if (controller.prevOpertor.value == "+") {
                } else if (controller.prevOpertor.value == "-") {
                } else if (controller.prevOpertor.value == "*") {
                } else if (controller.prevOpertor.value == "÷") {
                } else {
                  int lastIndex = -1;
                  for (int i = controller.value.length - 1; i >= 0; i--) {
                    if (controller.value[i].contains('=')) {
                      lastIndex = i;
                      break;
                    }
                  }
                  print("------- lastIndex ------ ${lastIndex}");
                  if (controller.value[lastIndex].contains('=')) {
                    controller.value
                        .add(controller.value[lastIndex].replaceAll("=", ''));
                    controller.saveValueListToPrefs();
                    controller.result.value = double.parse(
                        controller.value[lastIndex].replaceAll("=", ''));
                  } else {
                    controller.result.value = double.parse(controller.value[0]);
                  }
                }
                print('------- ${controller.result.value}');
              }
            }
            controller.display.value = "";
            controller.displayEnglish.value = "";
            controller.displayOprater.value = number;
            controller.prevOpertor.value = "*";
            controller.prevOpertor2.value = "*";
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
              if (controller.prevOpertor.value == "%") {
                controller.result.value =
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
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

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
                      controller.prevOpertor.value == "%" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    // controller.value.add(controller.display.value);
                    // controller.saveValueListToPrefs();
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
                        convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));
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
                if (controller.prevOpertor.value == "+") {
                } else if (controller.prevOpertor.value == "-") {
                } else if (controller.prevOpertor.value == "*") {
                } else if (controller.prevOpertor.value == "÷") {
                } else {
                  int lastIndex = -1;
                  for (int i = controller.value.length - 1; i >= 0; i--) {
                    if (controller.value[i].contains('=')) {
                      lastIndex = i;
                      break;
                    }
                  }
                  print("nnnnnnnnnnn2222222222 ${controller.result.value}");
                  print("------- lastIndex ------ ${lastIndex}");
                  if (controller.value[lastIndex].contains('=')) {
                    controller.value
                        .add(controller.value[lastIndex].replaceAll("=", ''));
                    controller.saveValueListToPrefs();
                    controller.result.value = double.parse(
                        controller.value[lastIndex].replaceAll("=", ''));
                  } else {
                    controller.result.value = double.parse(controller.value[0]);
                  }
                }
                print('nnnnnnnnnnn3333333333 ${controller.result.value}');
              }

              controller.display.value = "";
              controller.displayEnglish.value = "";
              controller.displayOprater.value = number;
              controller.prevOpertor.value = "-";
              controller.prevOpertor2.value = "-";
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
                print('bbbbbbbbbbbbbbbbbbbbbb');
                print(
                    'nnnnnnnnnnn3333333333111111111 ${controller.result.value}');
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
              if (controller.prevOpertor.value == "%") {
                controller.result.value =
                    double.parse(controller.displayEnglish.value);
                print('nnnnnnnnnnn44444444444 ${controller.result.value}');
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
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

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
                      controller.prevOpertor.value == "%" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    // controller.value.add(controller.display.value);
                    // controller.saveValueListToPrefs();
                  } else {
                    controller.value.add(controller.prevOpertor.value +
                        controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              print("c234 ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                print('cccccc${display}');
                print('cccccc1111111${controller.display.value}');
                print('cccccc222222${controller.displayEnglish.value}');

                display.isEmpty
                    ? ""
                    : controller.memory.value = double.parse(
                        convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));

                print('cccccc33333333${controller.memory.value}');
              }
              print('nnnnnnnnnnn555555555555555555 ${controller.result.value}');
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
          print("==+==11 ${controller.prevOpertor.value}");
          print("==+==33 ${controller.displayEnglish.value}");

          if (controller.displayEnglish.value.isEmpty) {
            print(
                "controller.displayEnglish.value1 ${controller.display.value}");
            print("==+==22 ${controller.display.value}");
            if (controller.value.isEmpty) {
            } else {
              if (controller.value[0].isEmpty) {
                print("vvvvvvvvv");
              } else {
                if (controller.prevOpertor.value == "+") {
                } else if (controller.prevOpertor.value == "-") {
                } else if (controller.prevOpertor.value == "*") {
                } else if (controller.prevOpertor.value == "÷") {
                } else if (controller.prevOpertor.value == "+GST") {
                } else if (controller.prevOpertor.value == "-GST") {
                } else {
                  int lastIndex = -1;
                  for (int i = controller.value.length - 1; i >= 0; i--) {
                    if (controller.value[i].contains('=')) {
                      lastIndex = i;
                      break;
                    }
                  }
                  print("------- lastIndex ------ ${lastIndex}");
                  if (controller.value[lastIndex].contains('=')) {
                    controller.value
                        .add(controller.value[lastIndex].replaceAll("=", ''));
                    controller.saveValueListToPrefs();
                    controller.result.value = double.parse(
                        controller.value[lastIndex].replaceAll("=", ''));
                    dotcheck = true;
                  } else {
                    controller.result.value = double.parse(controller.value[0]);
                  }
                }

                print('------- ${controller.result.value}');
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
                print("++++++GT");
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
                print("++++++===");
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "+GST") {
                print("++++++GST");
                controller.displayEnglish.value =
                    controller.value.last.replaceAll("=", "");
                print(controller.displayEnglish.value =
                    controller.value.last.replaceAll("=", ""));
                print(
                    "controller.displayEnglish.value1 ${controller.displayEnglish.value}");
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
              }
              if (controller.prevOpertor.value == "%") {
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
                  print("ppppp3++++++++");
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

                  if (displayNumber == displayNumber.toInt()) {
                    print("displayNumber++++++++++1${displayNumber.toInt()}");
                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toInt().toString());
                  } else {
                    print("displayNumber2${displayNumber}");

                    controller.value.add(controller.prevOpertor.value +
                        displayNumber.toString());
                    dotcheck = true;
                  }

                  controller.saveValueListToPrefs();
                  dotAdded2 = false;
                } else {
                  if (controller.prevOpertor.value == "+GST" ||
                      controller.prevOpertor.value == "(-5%)" ||
                      controller.prevOpertor.value == "(-3%)" ||
                      controller.prevOpertor.value == "(-12%)" ||
                      controller.prevOpertor.value == "(-18%)") {
                    print("11111111");
                    // controller.value.add(controller.displayEnglish.value);
                    // controller.saveValueListToPrefs();
                  } else {
                    arathmeticoperator == true
                        ? controller.value.add(controller.display.value)
                        : controller.value.add(controller.prevOpertor.value +
                            controller.display.value);
                    controller.saveValueListToPrefs();
                  }
                }
              }
              print("c234 ${controller.prevOpertor.value}");
              if (controller.prevOpertor.value == "M+" ||
                  controller.prevOpertor.value == "M-") {
                mrprint = true;
                print('cccccc${display}');
                print('cccccc1111111${controller.display.value}');
                print('cccccc222222${controller.displayEnglish.value}');
                print('cccccc222222${controller.memory.value}');
                display.isEmpty
                    ? ""
                    : controller.memory.value = double.parse(
                        convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));

                print('cccccc33333333${controller.memory.value}');
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
              print(
                  "========= update ${controller.prevOpertor.value}+++++++++++");
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
                    "length${double.parse(convertHindiToEnglish(controller.value[controller.value.length - 2])!)}");
                controller.result.value = double.parse(convertHindiToEnglish(
                        controller.value[controller.value.length - 2])!) +
                    double.parse(
                        convertHindiToEnglish(controller.updatevalue.value)!);
              } else {
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue =
                      double.parse(convertHindiToEnglish(controller.value[i])!);
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
                print('-----hhhhhhhhhh------');

                twonumber = controller.result.value.toStringAsFixed(2);
                controller.value.add(
                    controller.displayOprater.value + twonumber.toString());
                controller.saveValueListToPrefs();
                scrolle();
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

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
                  print('kkkkkkkkkkkkkkk');

                  print("${controller.prevOpertor.value}");
                  controller.value.add(
                      controller.prevOpertor.value + controller.display.value);
                  controller.saveValueListToPrefs();
                  print("jjjjjjjj11rrrrrrrrr");
                }
                print(controller.displayEnglish.value);
                print(controller.result.value);
                controller.result.value +=
                    double.parse(controller.displayEnglish.value);
                twonumber = controller.result.value.toStringAsFixed(0);

                print(twonumber);
                print(dotAdded);
                print(dotcheck);

                print(dotAdded == true || dotcheck == true);

                if (dotAdded == true || dotcheck == true) {
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
                    print("eee eee eee");
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
                    "length${double.parse(convertHindiToEnglish(controller.value[controller.value.length - 2])!)}");
                controller.result.value = double.parse(convertHindiToEnglish(
                        controller.value[controller.value.length - 2])!) -
                    double.parse(
                        convertHindiToEnglish(controller.updatevalue.value)!);
              } else {
                double total = 0.0;
                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue =
                      double.parse(convertHindiToEnglish(controller.value[i])!);
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
                print('-----hhhhhhhhhh------');
                print('nnnnnnnnnnn777777777777 ${controller.result.value}');
                twonumber = controller.result.value.toStringAsFixed(0);
                controller.value.add(
                    controller.displayOprater.value + twonumber.toString());
                controller.saveValueListToPrefs();
                scrolle();
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

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
                    double.parse(
                        convertHindiToEnglish(controller.display.value)!));
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
                    "length${double.parse(convertHindiToEnglish(controller.value[controller.value.length - 2])!)}");
                controller.result.value = double.parse(convertHindiToEnglish(
                        controller.value[controller.value.length - 2])!) *
                    double.parse(
                        convertHindiToEnglish(controller.updatevalue.value)!);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;
                total =
                    double.parse(convertHindiToEnglish(controller.value[0])!);
                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(
                        convertHindiToEnglish(controller.value[i])!);
                    print("1total: $total");
                    total += elementValue;
                    print("1elementValue: $elementValue");
                    print("1total: $total");
                    print("1total: ${controller.value[i]}");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(
                        convertHindiToEnglish(controller.value[i])!
                            .replaceAll(RegExp('-'), ''));
                    print("2total: $total");
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                    print("2total: $total");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        convertHindiToEnglish(controller.value[i])!
                            .replaceAll(RegExp('[*+-.÷]'), ''));
                    total *= elementValue;
                    print("3elementValue: $elementValue");
                    print("3total: $total");
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
                print('-----hhhhhhhhhh------');
                twonumber = controller.result.value.toStringAsFixed(0);
                controller.value.add(
                    controller.displayOprater.value + twonumber.toString());
                controller.saveValueListToPrefs();
                scrolle();
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

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
                    "length${double.parse(convertHindiToEnglish(controller.value[controller.value.length - 2])!)}");
                controller.result.value = double.parse(convertHindiToEnglish(
                        controller.value[controller.value.length - 2])!) /
                    double.parse(
                        convertHindiToEnglish(controller.updatevalue.value)!);
              } else {
                print("Value to parse: ${controller.updatevalue.value}");
                double total = 0.0;
                total =
                    double.parse(convertHindiToEnglish(controller.value[0])!);
                for (int i = 0; i < controller.value.length; i++) {
                  if (controller.value[i].contains("+")) {
                    double elementValue = double.parse(
                        convertHindiToEnglish(controller.value[i])!);
                    print("1total: $total");
                    total += elementValue;
                    print("1elementValue: $elementValue");
                    print("1total: $total");
                  } else if (controller.value[i].contains("-")) {
                    double elementValue = double.parse(
                        convertHindiToEnglish(controller.value[i])!
                            .replaceAll(RegExp('-'), ''));
                    print("2total: $total");
                    total -= elementValue;
                    print("2elementValue: $elementValue");
                    print("2total: $total");
                  } else if (controller.value[i].contains("*")) {
                    double elementValue = double.parse(
                        convertHindiToEnglish(controller.value[i])!
                            .replaceAll(RegExp('[*+-.÷]'), ''));
                    print("3total: $total");
                    total *= elementValue;
                    print("3elementValue: $elementValue");
                    print("3total: $total");
                  } else if (controller.value[i].contains("÷")) {
                    double elementValue = double.parse(
                        convertHindiToEnglish(controller.value[i])!
                            .replaceAll(RegExp('[*+-.÷]'), ''));
                    print("3total: $total");
                    total /= elementValue;
                    print("3elementValue: $elementValue");
                    print("3total: $total");
                  }
                }
                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value +
                  controller.result.value.toStringAsFixed(2).toString());
              print(
                  " dshjgsyftg dgbdbfuhsyd ${controller.result.value.toStringAsFixed(2).toString()}");
              controller.saveValueListToPrefs();
              scrolle();
            } else {
              if (controller.displayEnglish.value.isEmpty) {
                print('-----hhhhhhhhhh------');
                twonumber = controller.result.value.toStringAsFixed(0);
                controller.value.add(
                    controller.displayOprater.value + twonumber.toString());
                controller.saveValueListToPrefs();
                scrolle();
              } else {
                if (dotAdded2 == true) {
                  print("ppppp3");
                  double displayNumber = double.parse(
                      convertHindiToEnglish(controller.display.value)!);

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
                print("jjjjjjjj11222${controller.result.value}");

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
                      controller.result.value.toStringAsFixed(2).toString());
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
            // controller.displayEnglish.value = controller.display.value;
            print(" 234345435 ${controller.displayEnglish.value}");
            double secoundvalue = double.parse(controller.displayEnglish.value);
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
            controller.value.add(" = ${controller.result.value}");
            controller.saveValueListToPrefs();
            controller.result.value =
                controller.currentValue.value + controller.gstAmount.value;

            print(controller.percentage.value);
            print("==${controller.currentValue.value}");
          } else if (controller.prevOpertor.value == "-GST") {
            scrolle();
            print(controller.display.value);
            double secoundvalue = double.parse(controller.displayEnglish.value);
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
          } else if (controller.prevOpertor.value == "MR ") {
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
              print(
                  "jhdjkh1111111111111111${convertHindiToEnglish(controller.value[0])}");
              display = convertHindiToEnglish(controller.value[0])!
                  .replaceAll("M+", "")
                  .replaceAll("M-", " ");
              print("jhdjkh222222222222222${display}");

              controller.currentValue.value = double.parse(display);
              print("currentValue ${controller.currentValue.value}");
              print("prevOpertor ${controller.updatevalue.value}");
              if (controller.m.value == "M-") {
                if (controller.prevOpertor2.value == "+") {
                  controller.result.value = controller.currentValue.value -
                      double.parse(
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R+ - ", ""));
                }
                if (controller.prevOpertor2.value == "-") {
                  controller.result.value = controller.currentValue.value +
                      double.parse(
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R- - ", ""));
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = controller.currentValue.value *
                      double.parse(
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R* -", ""));
                }
                if (controller.prevOpertor2.value == "÷") {
                  controller.result.value = controller.currentValue.value /
                      double.parse(
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R÷ -", ""));
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
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R+", ""));
                  print("prevOpertor2 ${controller.updatevalue.value}");
                }
                if (controller.prevOpertor2.value == "-") {
                  print("prevOpertor3 ${controller.currentValue.value}");
                  controller.result.value = controller.currentValue.value -
                      double.parse(
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R-", ""));
                  print("prevOpertor4 ${controller.currentValue.value}");
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = controller.currentValue.value *
                      double.parse(
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R*", ""));
                }
                if (controller.prevOpertor2.value == "÷") {
                  controller.result.value = controller.currentValue.value /
                      double.parse(
                          convertHindiToEnglish(controller.updatevalue.value)!
                              .replaceAll("R÷", ""));
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
                    display.replaceAll("M+", "").replaceAll("M-", ""));
                controller.saveValueListToPrefs();
                if (controller.prevOpertor2.value == "+") {
                  print('bb${controller.display.value}');
                  print('bb22${controller.displayEnglish.value}');
                  print('bb33${controller.result.value}');
                  if (mplus == true) {
                    if (m1 == true) {
                      print(
                          'mmm1111111111111111111111111111111111mmmmmmmmmmmmm');
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) +
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    } else if (m2 == true) {
                      print('mmm2222222222222222222mmmmmmmmmmmmm');
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) +
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    }
                  } else {
                    controller.result.value = double.parse(
                            convertHindiToEnglish(controller.value[0])!) +
                        double.parse(convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));
                  }

                  print('bb44${controller.result.value}');
                }
                if (controller.prevOpertor2.value == "-") {
                  print('zz${controller.display.value}');
                  print('zz22${controller.displayEnglish.value}');
                  print('zz33${controller.result.value}');
                  if (mplus == true) {
                    if (m1 == true) {
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) -
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    } else if (m2 == true) {
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) -
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    }
                  } else {
                    controller.result.value = double.parse(
                            convertHindiToEnglish(controller.value[0])!) -
                        double.parse(convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));
                  }

                  print('bb44${controller.result.value}');
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!) *
                      double.parse(convertHindiToEnglish(display)!
                          .replaceAll("M+", "")
                          .replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "÷") {
                  controller.result.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!) /
                      double.parse(convertHindiToEnglish(display)!
                          .replaceAll("M+", "")
                          .replaceAll("M-", ""));
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
                  print('bb${controller.display.value}');
                  print('bb22${controller.displayEnglish.value}');
                  print('bb33${controller.result.value}');
                  if (mplus == true) {
                    if (m1 == true) {
                      print(
                          'mmm1111111111111111111111111111111111mmmmmmmmmmmmm');
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) +
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    } else if (m2 == true) {
                      print('mmm2222222222222222222mmmmmmmmmmmmm');
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) +
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    }
                  } else {
                    controller.result.value = double.parse(
                            convertHindiToEnglish(controller.value[0])!) +
                        double.parse(convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));
                  }

                  print('bb44${controller.result.value}');
                }
                if (controller.prevOpertor2.value == "-") {
                  print('zz${controller.display.value}');
                  print('zz22${controller.displayEnglish.value}');
                  print('zz33${controller.result.value}');
                  if (mplus == true) {
                    if (m1 == true) {
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) +
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    } else if (m2 == true) {
                      controller.result.value = double.parse(
                              convertHindiToEnglish(controller.value[3])!) -
                          double.parse(convertHindiToEnglish(display)!
                              .replaceAll("M+", "")
                              .replaceAll("M-", ""));
                      display = '';
                    }
                  } else {
                    controller.result.value = double.parse(
                            convertHindiToEnglish(controller.value[0])!) -
                        double.parse(convertHindiToEnglish(display)!
                            .replaceAll("M+", "")
                            .replaceAll("M-", ""));
                  }

                  print('bb44${controller.result.value}');
                }
                if (controller.prevOpertor2.value == "*") {
                  controller.result.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!) *
                      double.parse(convertHindiToEnglish(display)!
                          .replaceAll("M+", "")
                          .replaceAll("M-", ""));
                }
                if (controller.prevOpertor2.value == "÷") {
                  controller.result.value = double.parse(
                          convertHindiToEnglish(controller.value[0])!) /
                      double.parse(convertHindiToEnglish(display)!
                          .replaceAll("M+", "")
                          .replaceAll("M-", ""));
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
    if (str == null ||
        str1 == null ||
        str2 == null ||
        str3 == null ||
        str4 == null ||
        str5 == null ||
        str6 == null ||
        str7 == null) {
      // callAdmob();
      print("hsghjgsghjgjgjg");
      str = context.loc.three;
      str1 = context.loc.five;
      str2 = "${context.loc.one}${context.loc.two}";
      str3 = "${context.loc.one}${context.loc.eight}";
      str4 = context.loc.three;
      str5 = context.loc.five;
      str6 = "${context.loc.one}${context.loc.two}";
      str7 = "${context.loc.one}${context.loc.eight}";
    }

    gst1 = TextEditingController(text: "${str}");
    gst2 = TextEditingController(text: "${str1}");
    gst3 = TextEditingController(text: "${str2}");
    gst4 = TextEditingController(text: "${str3}");

    gst5 = TextEditingController(text: "${str4}");
    gst6 = TextEditingController(text: "${str5}");
    gst7 = TextEditingController(text: "${str6}");
    gst8 = TextEditingController(text: "${str7}");

    return SafeArea(
      child: Scaffold(
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
                  : InkWell(
                      onTap: () {
                        launchUrl(Uri.parse('https://poki.com/'));
                      },
                      child: Image.asset(
                        "assets/images/game_icon.png",
                        height: 4.h,
                      ),
                    ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(''));
                },
                child: Image.asset(
                  "assets/images/queen.png",
                  height: 7.h,
                ),
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
                                        child: Container(
                                          height: 52.h,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    bottom: 15,
                                                    right: 30),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 4.h,
                                                    width: 8.7.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
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
                                                    itemCount:
                                                        controller.lang.length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 4,
                                                            childAspectRatio:
                                                                1.0),
                                                    itemBuilder:
                                                        (context, index) {
                                                      print(
                                                          "================= onCLOSING =====================");
                                                      return Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 5,
                                                                horizontal: 5),
                                                        decoration: BoxDecoration(
                                                            border: controller
                                                                        .lang[
                                                                            index]
                                                                        .isselect ==
                                                                    true
                                                                ? Border.all(
                                                                    color: Colors
                                                                        .white)
                                                                : Border.all(
                                                                    color: Colors
                                                                        .black),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.1)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                for (int i = 0;
                                                                    i <
                                                                        controller
                                                                            .lang
                                                                            .length;
                                                                    i++) {
                                                                  controller
                                                                          .lang[i]
                                                                          .isselect =
                                                                      false;
                                                                }
                                                                controller
                                                                    .lang[index]
                                                                    .isselect = true;
                                                                setState(() {});

                                                                controller
                                                                    .saveSelectedLaunguageIndex(
                                                                        index);
                                                                await controller
                                                                    .loadSelectedLanguageIndex();
                                                                Locale locale =
                                                                    await setLocale(controller
                                                                        .lang[
                                                                            index]
                                                                        .languageCode!);
                                                                MyApp.setLocale(
                                                                    context,
                                                                    locale);
                                                                controller.value
                                                                    .clear();
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 60,
                                                                child: Center(
                                                                  child: Text(
                                                                    "${controller.lang[index].flag}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "${controller.lang[index].name}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
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
                                              ),
                                            ],
                                          ),
                                        ));
                                  },
                                  onClosing: () {},
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
                      InkWell(
                        onTap: () {
                          Get.back();
                          Get.toNamed('gst');
                          showDialog(
                            barrierDismissible: false,
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
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Container(
                                              height: 120,
                                              // Adjust height as needed
                                              width: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: controller.dark.value
                                                    ? Color(0xff202C35)
                                                    : Colors.grey.shade300,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Container(
                                                        child: Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 10,
                                                                    bottom: 7,
                                                                    right: 2,
                                                                    left: 2),
                                                            child: Container(
                                                              child: TextField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                controller:
                                                                    gst1,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  prefixText:
                                                                      "+",
                                                                ),
                                                                onChanged:
                                                                    (value) {
                                                                  gst1.text =
                                                                      value;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Expanded(
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller: gst2,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                            prefixText: "+",
                                                          ),
                                                          onChanged: (value) {
                                                            gst2.text = value;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Expanded(
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller: gst3,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                            prefixText: "+",
                                                          ),
                                                          onChanged: (value) {
                                                            gst3.text = value;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Expanded(
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller: gst4,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                            prefixText: "+",
                                                          ),
                                                          onChanged: (value) {
                                                            gst4.text = value;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 0.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Container(
                                                        child: Expanded(
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: gst5,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration: InputDecoration(
                                                                prefixText: "-",
                                                                prefixStyle:
                                                                    TextStyle(
                                                                        fontSize:
                                                                            20)),
                                                            onChanged: (value) {
                                                              gst5.text = value;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Expanded(
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller: gst6,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration: InputDecoration(
                                                              prefixText: "-",
                                                              prefixStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          20)),
                                                          onChanged: (value) {
                                                            gst6.text = value;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Expanded(
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller: gst7,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration: InputDecoration(
                                                              prefixText: "-",
                                                              prefixStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          20)),
                                                          onChanged: (value) {
                                                            gst7.text = value;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Expanded(
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller: gst8,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration: InputDecoration(
                                                              prefixText: "-",
                                                              prefixStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          20)),
                                                          onChanged: (value) {
                                                            gst8.text = value;
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              print(
                                                  "=========================");

                                              print(
                                                  "=========================222222222222");
                                              print(gst1.text);
                                              print(gst2.text);
                                              if (gst1.text == gst2.text ||
                                                  gst1.text == gst3.text ||
                                                  gst1.text == gst4.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst1.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else if (gst2.text ==
                                                      gst1.text ||
                                                  gst2.text == gst3.text ||
                                                  gst2.text == gst4.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst2.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else if (gst3.text ==
                                                      gst1.text ||
                                                  gst3.text == gst2.text ||
                                                  gst3.text == gst4.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst3.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else if (gst4.text ==
                                                      gst1.text ||
                                                  gst4.text == gst2.text ||
                                                  gst4.text == gst3.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst4.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else if (gst5.text ==
                                                      gst6.text ||
                                                  gst5.text == gst7.text ||
                                                  gst5.text == gst8.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst5.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else if (gst6.text ==
                                                      gst5.text ||
                                                  gst6.text == gst7.text ||
                                                  gst6.text == gst8.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst6.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else if (gst7.text ==
                                                      gst5.text ||
                                                  gst7.text == gst6.text ||
                                                  gst7.text == gst8.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst7.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else if (gst8.text ==
                                                      gst5.text ||
                                                  gst8.text == gst6.text ||
                                                  gst8.text == gst7.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "value is all ready Enter ${gst8.text}"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              } else {
                                                str = gst1.text;
                                                str1 = gst2.text;
                                                str2 = gst3.text;
                                                str3 = gst4.text;
                                                str4 = gst5.text;
                                                str5 = gst6.text;
                                                str6 = gst7.text;
                                                str7 = gst8.text;
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusScope.of(context)
                                                    .unfocus();
                                                Get.back();
                                                Get.back();
                                              }
                                              print("asasasasasasa");
                                              print("asasasasasasa $str");
                                              setState(() {});
                                            },
                                            child: Text("Done"),
                                          ),
                                          Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              Get.back();
                                              Get.back();
                                            },
                                            child: Text("Close"),
                                          ),
                                          Spacer(),
                                        ],
                                      )
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
                                  child:
                                      Image.asset("assets/images/cTheme.png"),
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
            Expanded(
              child: Container(
                color: controller.backgroundColor.value,
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
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
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                gst == true
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: controller
                                                        .value[index]
                                                        .contains("=")
                                                    ? 10
                                                    : 5,
                                                vertical: controller
                                                        .value[index]
                                                        .contains("=")
                                                    ? 3
                                                    : 0),
                                            decoration: controller.value[index]
                                                    .contains("=")
                                                ? BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))
                                                : BoxDecoration(),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "${englishToHindi(controller.value[index])} ",
                                                style: TextStyle(
                                                    fontSize: controller
                                                            .value[index]
                                                            .contains("=")
                                                        ? 16
                                                        : 15,
                                                    fontWeight: controller
                                                            .value[index]
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
                                            horizontal: controller.value[index]
                                                    .contains("=")
                                                ? 7
                                                : 0),
                                        decoration: controller.value[index]
                                                .contains("=")
                                            ? BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(5))
                                            : BoxDecoration(),
                                        child: Text(
                                          " ${englishToHindi(controller.value[index])} ",
                                          style: TextStyle(
                                            color: controller.dark.value
                                                ? Colors.black
                                                : Colors.black,
                                            fontSize: 18,
                                            fontWeight: controller.value[index]
                                                    .contains("=")
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
                  ],
                ),
              ),
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
                                              "${englishToHindi(controller.display.value)}",
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
                                  onclick("+${englishToHindi(str!)}%", "+3%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "+${englishToHindi(str!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("+${englishToHindi(str1!)}%", "+5%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "+${englishToHindi(str1!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("+${englishToHindi(str2!)}%", "+12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    text: "+${englishToHindi(str2!)}%",
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("+${englishToHindi(str3!)}%", "+18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "+${englishToHindi(str3!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
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
                                    imagePath: controller.btn1.value),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str4!)}%", "-3%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str4!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str5!)}%", "-5%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str5!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str6!)}%", "-12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str6!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str7!)}%", "-18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str7!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
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
                                    imagePath: controller.btn1.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                    imagePath: controller.btn2.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.seven, "7");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "${englishToHindi(context.loc.seven)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.eight, "8");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "${englishToHindi(context.loc.eight)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.nine, "9");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "${englishToHindi(context.loc.nine)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                    imagePath: controller.btn2.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.four, "4");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "${englishToHindi(context.loc.four)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.five, "5");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "${englishToHindi(context.loc.five)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.six, "6");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "${englishToHindi(context.loc.six)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
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
                                            color:
                                                controller.btnTextColor.value,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                        imagePath: controller.btn2.value),
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
                                        imagePath: controller.btn3.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                    imagePath: controller.btn4.value),
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
                                        text:
                                            "${englishToHindi(context.loc.one)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
                                  ),
                                  Bouncing(
                                    onPress: () {
                                      onclick(context.loc.zero, "0");
                                    },
                                    child: clickableContainer(
                                        onTap: () {},
                                        width: 20.w,
                                        height: 7.2.h,
                                        text:
                                            "${englishToHindi(context.loc.zero)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
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
                                        text:
                                            "${englishToHindi(context.loc.two)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
                                  ),
                                  Bouncing(
                                    onPress: () {
                                      onclick(context.loc.zero1, "00");
                                    },
                                    child: clickableContainer(
                                        onTap: () {},
                                        width: 20.w,
                                        height: 7.2.h,
                                        text:
                                            "${englishToHindi(context.loc.zero1)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
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
                                        text:
                                            "${englishToHindi(context.loc.three)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
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
                                        imagePath: controller.btn1.value),
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
                                              "${englishToHindi(controller.display.value)}",
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
                            ],
                          ),
                          Row(
                            children: [
                              Bouncing(
                                onPress: () {
                                  onclick("+${englishToHindi(str!)}%", "+3%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "+${englishToHindi(str!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("+${englishToHindi(str1!)}%", "+5%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "+${englishToHindi(str1!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("+${englishToHindi(str2!)}%", "+12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    text: "+${englishToHindi(str2!)}%",
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("+${englishToHindi(str3!)}%", "+18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "+${englishToHindi(str3!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
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
                                    imagePath: controller.btn1.value),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str4!)}%", "-3%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str4!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str5!)}%", "-5%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str5!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str6!)}%", "-12%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str6!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick("-${englishToHindi(str7!)}%", "-18%");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "-${englishToHindi(str7!)}%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    imagePath: controller.btn1.value),
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
                                    imagePath: controller.btn1.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    imagePath: controller.btn2.value),
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
                                    text:
                                        "${englishToHindi(context.loc.seven)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.eight, "8");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text:
                                        "${englishToHindi(context.loc.eight)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.nine, "9");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "${englishToHindi(context.loc.nine)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    imagePath: controller.btn2.value),
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
                                    text: "${englishToHindi(context.loc.four)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.five, "5");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "${englishToHindi(context.loc.five)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
                              ),
                              Bouncing(
                                onPress: () {
                                  onclick(context.loc.six, "6");
                                },
                                child: clickableContainer(
                                    onTap: () {},
                                    width: 20.w,
                                    height: 7.2.h,
                                    text: "${englishToHindi(context.loc.six)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                    imagePath: controller.btn1.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                    imagePath: controller.btn2.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    imagePath: controller.btn2.value),
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
                                        text:
                                            "${englishToHindi(context.loc.one)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
                                  ),
                                  Bouncing(
                                    onPress: () {
                                      onclick(context.loc.zero, "0");
                                    },
                                    child: clickableContainer(
                                        onTap: () {},
                                        width: 20.w,
                                        height: 7.2.h,
                                        text:
                                            "${englishToHindi(context.loc.zero)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
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
                                        text:
                                            "${englishToHindi(context.loc.two)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
                                  ),
                                  Bouncing(
                                    onPress: () {
                                      onclick(context.loc.zero1, "00");
                                    },
                                    child: clickableContainer(
                                        onTap: () {},
                                        width: 20.w,
                                        height: 7.2.h,
                                        text:
                                            "${englishToHindi(context.loc.zero1)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
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
                                        text:
                                            "${englishToHindi(context.loc.three)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23),
                                        imagePath: controller.btn1.value),
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
                                        imagePath: controller.btn1.value),
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
                                        color: controller.btnTextColor.value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                    imagePath: controller.btn4.value),
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
                                            color:
                                                controller.btnTextColor.value,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                        imagePath: controller.btn2.value),
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
                                        imagePath: controller.btn3.value),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
            //
            // Container(
            //   height: 50,
            //   width: double.infinity,
            //   child: AdWidget(
            //     ad: adsController.bannerAd!,
            //   ),
            // ),
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
import 'package:gst_calculator/calculator/model/country_model.dart';
import 'package:gst_calculator/calculator/model/flag_model.dart';
import 'package:gst_calculator/calculator/model/layout_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../class/language.dart';
import '../model/histary_model.dart';
import '../utils/api_helper/api_helper.dart';

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
  RxString twonumber = "1".obs;
  RxString twonumber2 = "".obs;
  RxBool showsiptotal = false.obs;
  RxBool showlumtotal = false.obs;
  RxBool ageresult = false.obs;
  RxDouble totalValue = 0.0.obs;
  RxDouble totalInvestedAmount = 0.0.obs;
  RxDouble estimatedReturn = 0.0.obs;
  RxString selectedCurrency = "INR - Indian Rupee".obs;
  RxString selectedflag = "INR.png".obs;
  RxString selectedCurrency2 = "USD - U.S. Dollar".obs;
  RxString selectedflag2 = "USD.png".obs;
  Rx<Color> backgroundColor = Colors.white.obs;
  RxInt selectedIndexLanguage = 1.obs;

  RxList<Tools_Model> mytools = <Tools_Model>[
    Tools_Model(name: "SIP", img: "assets/images/tools/sip.png"),
    Tools_Model(
        name: "Currency Con..", img: "assets/images/tools/currency.png"),
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


  RxMap<int, int> notes = {
    500: 0,
    200: 0,
    100: 0,
    50: 0,
    20: 0,
    10: 0,
    5: 0,
    2: 0,
    1: 0,
  }.obs;

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

  Future<void> saveSelectedLaunguageIndex(int selectedIndex) async {
    SharedPreferences selectlanguage = await SharedPreferences.getInstance();
    await selectlanguage.setInt('selectedLangIndex', selectedIndex);
  }

  Future<void> loadSelectedLanguageIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      selectedIndexLanguage.value = prefs.getInt('selectedLangIndex') ?? 0;



      print("===============================$selectedIndexLanguage");

  }

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

  RxString btn1 = "".obs;
  RxString btn2 = "".obs;
  RxString btn3 = "".obs;
  RxString btn4 = "".obs;

  RxInt selectedImageIndex = 0.obs;
  Rx<Color> btnTextColor = Colors.black.obs;
  SharedPreferences? save;

  Future<void> savetheme() async {
    save = await SharedPreferences.getInstance();
    // Load selected image index from shared preferences
    int? storedIndex = await save?.getInt('selected_theme_index');
    if (storedIndex != null) {
      print("====== not null ==========");
      selectedImageIndex.value = storedIndex;
    }
  }

  void saveSelectedImageIndex(int index) {
    save?.setInt('selected_theme_index', index);
  }
  void changetheme()
  {

    switch(selectedImageIndex.value)
    {
      case 0:
        {
            btnTextColor.value  = Colors.black;
            btn1.value = "assets/images/btn1.png";
            btn2.value = "assets/images/btn2.png";
            btn3.value = "assets/images/btn4.png";
            btn4.value = "assets/images/btn3.png";
        }
      case 1:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme2/th2b1.png";
          btn2.value = "assets/images/layout/theme2/th2b3.png";
          btn3.value = "assets/images/layout/theme2/th2b1.png";
          btn4.value = "assets/images/layout/theme2/th2b4.png";
        }
      case 2:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme4/th4b1.png";
          btn2.value = "assets/images/layout/theme4/th4b3.png";
          btn3.value = "assets/images/layout/theme4/th4b1.png";
          btn4.value = "assets/images/layout/theme4/th4b4.png";
        }
      case 3:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme5/th5b1.png";
          btn2.value = "assets/images/layout/theme5/th5b3.png";
          btn3.value = "assets/images/layout/theme5/th5b1.png";
          btn4.value = "assets/images/layout/theme5/th5b4.png";
        }
      case 4:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme6/th6b1.png";
          btn2.value = "assets/images/layout/theme6/th6b3.png";
          btn3.value = "assets/images/layout/theme6/th6b1.png";
          btn4.value = "assets/images/layout/theme6/th6b4.png";
        }
      case 5:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme7/th7b1.png";
          btn2.value = "assets/images/layout/theme7/th7b3.png";
          btn3.value = "assets/images/layout/theme7/th7b1.png";
          btn4.value = "assets/images/layout/theme7/th7b4.png";
        }
      case 6:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme8/th8b1.png";
          btn2.value = "assets/images/layout/theme8/th8b3.png";
          btn3.value = "assets/images/layout/theme8/th8b1.png";
          btn4.value = "assets/images/layout/theme8/th8b4.png";
        }
      case 7:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme9/th9b1.png";
          btn2.value = "assets/images/layout/theme9/th9b3.png";
          btn3.value = "assets/images/layout/theme9/th9b1.png";
          btn4.value = "assets/images/layout/theme9/th9b4.png";
        }
      case 8:
        {
          btnTextColor.value  = Colors.white;
          btn1.value = "assets/images/layout/theme10/th10b1.png";
          btn2.value = "assets/images/layout/theme10/th10b3.png";
          btn3.value = "assets/images/layout/theme10/th10b1.png";
          btn4.value = "assets/images/layout/theme10/th10b4.png";
        }
        saveSelectedImageIndex(selectedImageIndex.value);
    }
  }

  getAPiRate(value, CurrancyReta? currancyReta) {
    double? rateValue;
    switch (value.toString().toUpperCase()) {
      case 'AED':
        rateValue = currancyReta!.aED;
        break;
      case 'AFN':
        rateValue = currancyReta!.aFN;
        break;
      case 'ALL':
        rateValue = currancyReta!.aLL;
        break;
      case 'AMD':
        rateValue = currancyReta!.aMD;
        break;
      case 'ANG':
        rateValue = currancyReta!.aNG;
        break;
      case 'AOA':
        rateValue = currancyReta!.aOA;
        break;
      case 'ARS':
        rateValue = currancyReta!.aRS;
        break;
      case 'AUD':
        rateValue = currancyReta!.aUD;
        break;
      case 'AWG':
        rateValue = currancyReta!.aWG;
        break;
      case 'AZN':
        rateValue = currancyReta!.aZN;
        break;
      case 'BAM':
        rateValue = currancyReta!.bAM;
        break;
      case 'BBD':
        rateValue = currancyReta!.bBD;
        break;
      case 'BDT':
        rateValue = currancyReta!.bDT;
        break;
      case 'BGN':
        rateValue = currancyReta!.bGN;
        break;
      case 'BHD':
        rateValue = currancyReta!.bHD;
        break;
      case 'BIF':
        rateValue = currancyReta!.bIF;
        break;
      case 'BMD':
        rateValue = currancyReta!.aMD;
        break;
      case 'BND':
        rateValue = currancyReta!.bND;
        break;
      case 'BOB':
        rateValue = currancyReta!.bOB;
        break;
      case 'BRL':
        rateValue = currancyReta!.bRL;
        break;
      case 'BTC':
        rateValue = currancyReta!.bTN;
        break;
      case 'BTC':
        rateValue = currancyReta!.bTN;
        break;
      case 'BSD':
        rateValue = currancyReta!.bSD;
        break;
      case 'BYN':
        rateValue = currancyReta!.bYN;
        break;
      case 'BZD':
        rateValue = currancyReta!.bZD;
        break;
      case 'CAD':
        rateValue = currancyReta!.cAD;
        break;
      case 'CDF':
        rateValue = currancyReta!.cDF;
        break;
      case 'CHF':
        rateValue = currancyReta!.cHF;
        break;
      case 'CLP':
        rateValue = currancyReta!.cLP;
        break;
      case 'CNY':
        rateValue = currancyReta!.cNY;
        break;
      case 'COP':
        rateValue = currancyReta!.cOP;
        break;
      case 'CRC':
        rateValue = currancyReta!.cRC;
        break;
      case 'CUP':
        rateValue = currancyReta!.cUP;
        break;
      case 'CVE':
        rateValue = currancyReta!.cVE;
        break;
      case 'CZK':
        rateValue = currancyReta!.cZK;
        break;
      case 'DJF':
        rateValue = currancyReta!.dJF;
        break;
      case 'DKK':
        rateValue = currancyReta!.dKK;
        break;
      case 'DOP':
        rateValue = currancyReta!.dOP;
        break;
      case 'DZD':
        rateValue = currancyReta!.dZD;
        break;
      case 'EGP':
        rateValue = currancyReta!.eGP;
        break;
      case 'ERN':
        rateValue = currancyReta!.eRN;
        break;
      case 'ETB':
        rateValue = currancyReta!.eTB;
        break;
      case 'EUR':
        rateValue = currancyReta!.eUR;
        break;
      case 'FJD':
        rateValue = currancyReta!.fJD;
        break;
      case 'FKP':
        rateValue = currancyReta!.fKP;
        break;
      case 'GBP':
        rateValue = currancyReta!.gBP;
        break;
      case 'GEL':
        rateValue = currancyReta!.gEL;
        break;
      case 'GGL':
        rateValue = currancyReta!.gGP;
        break;
      case 'GHS':
        rateValue = currancyReta!.gHS;
        break;
      case 'GIP':
        rateValue = currancyReta!.gIP;
        break;
      case 'GMD':
        rateValue = currancyReta!.gMD;
        break;
      case 'GNF':
        rateValue = currancyReta!.gNF;
        break;
      case 'GTQ':
        rateValue = currancyReta!.gTQ;
        break;
      case 'GYD':
        rateValue = currancyReta!.gYD;
        break;
      case 'HKD':
        rateValue = currancyReta!.hKD;
        break;
      case 'HNL':
        rateValue = currancyReta!.hNL;
        break;
      case 'HRK':
        rateValue = currancyReta!.hRK;
        break;
      case 'HTG':
        rateValue = currancyReta!.hTG;
        break;
      case 'HUF':
        rateValue = currancyReta!.hUF;
        break;
      case 'IDR':
        rateValue = currancyReta!.iDR;
        break;
      case 'ILS':
        rateValue = currancyReta!.iLS;
        break;
      case 'IMP':
        rateValue = currancyReta!.iMP;
        break;
      case 'INR':
        rateValue = currancyReta!.iNR;
        break;
      case 'IQD':
        rateValue = currancyReta!.iQD;
        break;
      case 'IRR':
        rateValue = currancyReta!.iRR;
        break;
      case 'ISK':
        rateValue = currancyReta!.iSK;
        break;
      case 'JEP':
        rateValue = currancyReta!.jEP;
        break;
      case 'JMD':
        rateValue = currancyReta!.jMD;
        break;
      case 'JOD':
        rateValue = currancyReta!.jOD;
        break;
      case 'JPY':
        rateValue = currancyReta!.jPY;
        break;
      case 'KES':
        rateValue = currancyReta!.kES;
        break;
      case 'KGS':
        rateValue = currancyReta!.kGS;
        break;
      case 'KHR':
        rateValue = currancyReta!.kHR;
        break;
      case 'KMF':
        rateValue = currancyReta!.kMF;
        break;
      case 'KRW':
        rateValue = currancyReta!.kRW;
        break;
      case 'KWD':
        rateValue = currancyReta!.kWD;
        break;
      case 'KYD':
        rateValue = currancyReta!.kYD;
        break;
      case 'KZT':
        rateValue = currancyReta!.kZT;
        break;
      case 'LAK':
        rateValue = currancyReta!.lAK;
        break;
      case 'LBP':
        rateValue = currancyReta!.lBP;
        break;
      case 'LKR':
        rateValue = currancyReta!.lKR;
        break;
      case 'LRD':
        rateValue = currancyReta!.lRD;
        break;
      case 'LSL':
        rateValue = currancyReta!.lSL;
        break;
      case 'LYD':
        rateValue = currancyReta!.lYD;
        break;
      case 'MAD':
        rateValue = currancyReta!.mAD;
        break;
      case 'MDL':
        rateValue = currancyReta!.mDL;
        break;
      case 'MGA':
        rateValue = currancyReta!.mGA;
        break;
      case 'MKD':
        rateValue = currancyReta!.mKD;
        break;
      case 'MMK':
        rateValue = currancyReta!.mMK;
        break;
      case 'MNT':
        rateValue = currancyReta!.mNT;
        break;
      case 'MOP':
        rateValue = currancyReta!.mOP;
        break;
      case 'MUR':
        rateValue = currancyReta!.mUR;
        break;
      case 'MVR':
        rateValue = currancyReta!.mVR;
        break;
      case 'MWK':
        rateValue = currancyReta!.mWK;
        break;
      case 'MXN':
        rateValue = currancyReta!.mXN;
        break;
      case 'MYR':
        rateValue = currancyReta!.mYR;
        break;
      case 'MZN':
        rateValue = currancyReta!.mZN;
        break;
      case 'NAD':
        rateValue = currancyReta!.nAD;
        break;
      case 'NGN':
        rateValue = currancyReta!.nGN;
        break;
      case 'NIO':
        rateValue = currancyReta!.nIO;
        break;
      case 'NOK':
        rateValue = currancyReta!.nOK;
        break;
      case 'NPR':
        rateValue = currancyReta!.nPR;
        break;
      case 'NZD':
        rateValue = currancyReta!.nZD;
        break;
      case 'OMR':
        rateValue = currancyReta!.oMR;
        break;
      case 'PAB':
        rateValue = currancyReta!.pAB;
        break;
      case 'PEN':
        rateValue = currancyReta!.pEN;
        break;
      case 'PGK':
        rateValue = currancyReta!.pGK;
        break;
      case 'PHP':
        rateValue = currancyReta!.pHP;
        break;
      case 'PKR':
        rateValue = currancyReta!.pKR;
        break;
      case 'PLN':
        rateValue = currancyReta!.pLN;
        break;
      case 'PYG':
        rateValue = currancyReta!.pYG;
        break;
      case 'QAR':
        rateValue = currancyReta!.qAR;
        break;
      case 'RON':
        rateValue = currancyReta!.rON;
        break;
      case 'RSD':
        rateValue = currancyReta!.rSD;
        break;
      case 'RUB':
        rateValue = currancyReta!.rUB;
        break;
      case 'RWF':
        rateValue = currancyReta!.rWF;
        break;
      case 'SAR':
        rateValue = currancyReta!.sAR;
        break;
      case 'SBD':
        rateValue = currancyReta!.sBD;
        break;
      case 'SCR':
        rateValue = currancyReta!.sCR;
        break;
      case 'SDG':
        rateValue = currancyReta!.sDG;
        break;
      case 'SEK':
        rateValue = currancyReta!.sEK;
        break;
      case 'SGD':
        rateValue = currancyReta!.sGD;
        break;
      case 'SHP':
        rateValue = currancyReta!.sHP;
        break;
      case 'SLL':
        rateValue = currancyReta!.sLL;
        break;
      case 'SOS':
        rateValue = currancyReta!.sOS;
        break;
      case 'SRD':
        rateValue = currancyReta!.sRD;
        break;
      case 'SYP':
        rateValue = currancyReta!.sYP;
        break;
      case 'SZL':
        rateValue = currancyReta!.sZL;
        break;
      case 'THB':
        rateValue = currancyReta!.tHB;
        break;
      case 'TJS':
        rateValue = currancyReta!.tJS;
        break;
      case 'TMT':
        rateValue = currancyReta!.tMT;
        break;
      case 'TND':
        rateValue = currancyReta!.tND;
        break;
      case 'TOP':
        rateValue = currancyReta!.tOP;
        break;
      case 'TRY':
        rateValue = currancyReta!.tRY;
        break;
      case 'TTD':
        rateValue = currancyReta!.tTD;
        break;
      case 'TWD':
        rateValue = currancyReta!.tWD;
        break;
      case 'TZS':
        rateValue = currancyReta!.tZS;
        break;
      case 'UAH':
        rateValue = currancyReta!.uAH;
        break;
      case 'UGX':
        rateValue = currancyReta!.uGX;
        break;
      case 'USD':
        rateValue = currancyReta!.uSD;
        break;
      case 'UYU':
        rateValue = currancyReta!.uYU;
        break;
      case 'UZS':
        rateValue = currancyReta!.uZS;
        break;
      case 'VND':
        rateValue = currancyReta!.vND;
        break;
      case 'VUV':
        rateValue = currancyReta!.vUV;
        break;
      case 'WST':
        rateValue = currancyReta!.wST;
        break;
      case 'XAF':
        rateValue = currancyReta!.xAF;
        break;
      case 'XCD':
        rateValue = currancyReta!.xCD;
        break;
      case 'XDR':
        rateValue = currancyReta!.xDR;
        break;
      case 'XOF':
        rateValue = currancyReta!.xOF;
        break;
      case 'XPF':
        rateValue = currancyReta!.xPF;
        break;
      case 'YER':
        rateValue = currancyReta!.yER;
        break;
      case 'ZAR':
        rateValue = currancyReta!.zAR;
        break;
      case 'ZMW':
        rateValue = currancyReta!.zMW;
        break;
      case 'ZWL':
        rateValue = currancyReta!.zWL;
        break;
      case 'BTN':
        rateValue = currancyReta!.bTN;
        break;
      default:
        rateValue = 0;
        break;
    }
    if (rateValue == null) rateValue = 1;
    print('Rate in API => $rateValue');
    print('Rate in API => ${value.toString().toUpperCase()}');
    return rateValue;
  }

  // country api called

  RxBool iscalled = false.obs;
  List<FlagModel>? flagJsonList;
  CountryModel? data;
  CurrancyReta? currancyReta;

  Future apiLoad() async {
    iscalled.value = false;

    await Api_helper.api_helper.getApi().then((value) {
      data = value;

      if (data != null && data!.data != null) {
        // Extract flag data and convert to FlagModel objects
        List<FlagModel> flags =
            data!.data!.map((datum) => FlagModel(flag: datum.flag)).toList();

        // Convert each FlagModel object to JSON and encode
        flagJsonList = flagModelFromJson(data!.data![0].flag!);

        // Now you have a list of JSON strings representing the flag data
        print("${flags}");
        print(flagJsonList);
        currancyReta =
            CurrancyReta.fromJson(jsonDecode(data!.data![0].currency!));

        iscalled.value = true;
      }
    });
  }
}
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ads_Helper extends GetxController{
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RxInt count = 0.obs;
  RxInt totalCount = 0.obs;
  RxBool intertital = false.obs;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2934735716';

  void loadAd() {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');

        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadInterstitialAd() {
    print(" -------------- load intertital =================");
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          intertital.value = true;
        },
      ),
    );
  }
}
    

