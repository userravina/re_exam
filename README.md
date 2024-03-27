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
apply plugin: 'com.google.gms.google-services'

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
  RxList<String> value =<String>[].obs;
  RxList operator =[].obs;
  RxList grandTotal =[].obs;
  RxDouble result = 0.0.obs;
  RxDouble memory = 0.0.obs;
  RxDouble currentValue = 0.0.obs;
  RxDouble percentage =0.0.obs;
  RxDouble gstAmount =0.0.obs;
  RxList<String> histary =<String>[].obs;
  RxString IGST ="".obs;
  RxDouble SGST =0.0.obs;
  RxDouble CGST =0.0.obs;


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

}
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  String display = "";
  bool gst = false;
  String twonumber = "";
  String gstnumber = "";
  String gstoperator = "";
  bool dotAdded = false;
  bool update = false;

  @override
  void initState() {
    controller.value.clear();
    super.initState();
  }

  void scrolle()
  {

    scrollcontroller.animateTo(scrollcontroller.position.maxScrollExtent,duration: Duration(milliseconds: 300),curve: Curves.easeOut);
  }

  double subtractAndRound(double value1, double value2) {
    print("value1${value1}");
    print("value2${value2}");
    double result = value1 - value2;
    print("===========${result}==================");
    // Find the maximum number of decimal places in the input values
    int maxDecimalPlaces = (value1.toString().split('.').length == 2 || value2.toString().split('.').length == 2)
        ? (value1.toString().split('.').length > value2.toString().split('.').length
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
          controller.display.value = "";
          controller.displayEnglish.value = "";
        }
        if (controller.displayOprater.value == "MU") {
          onetime = true;
          controller.display.value = "";
          controller.displayEnglish.value = "";

          controller.value[2];
        }
        controller.displayOprater.value = "";

        if(update == true)
          {
            print("Update diplay ${ controller.display.value}");
            print("Update diplay + number ${ controller.display.value + number}");
            print("jhdjkh${ controller.updatevalue.value}");
            controller.updatevalue.value = controller.display.value + number;
            print("jhdjkh${ controller.updatevalue.value}");
            print("jhdjkh${ controller.prevOpertor.value}");
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
        print(onetime);
        dotAdded = false;
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
          controller.display.value = controller.display.value.substring(0, controller.display.value.length - 1);
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
          controller.display.value = controller.memory.value.toString();
          break;
        }
      case "M-":
        {
          scrolle();
          dotAdded = false;
          controller.memory.value -=
              double.parse(controller.displayEnglish.value);
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M-";

          break;
        }

      case "M+":
        {
          scrolle();
          dotAdded = false;
          controller.memory.value +=
              double.parse(controller.displayEnglish.value);
          controller.displayOprater.value = number;
          controller.prevOpertor.value = "M+";

          break;
        }
      case "MU":
        {
          scrolle();
          dotAdded = false;
          display = controller.display.value;
          controller.display.value = controller.value[2];
          controller.displayOprater.value = number;
          controller.value.add(controller.displayEnglish.value +
              controller.displayOprater.value);
          controller.saveValueListToPrefs();
          controller.prevOpertor.value = "MU";
          break;
        }
      case "undo":
        {
          scrolle();
          dotAdded = false;
          // Check if there are any entries in the history
          if (controller.value.isNotEmpty) {
            // Remove the last entry from the history
            if(controller.value.length>2){
            controller.value.removeAt(controller.value.length-1);}
            String lastEntry = controller.value.removeAt(controller.value.length-1);
            controller.prevOpertor.value=lastEntry[0];
            print("lastEntry");
            print(lastEntry);
            controller.display.value = lastEntry;
            print(controller.display.value);
            // Update the display to the last entry in the history
            print("Update the display to the last ${controller.display.value}");
            // controller.display.value = lastEntry.substring(controller.value.length==1||controller.value.isEmpty?0:1,lastEntry.length);
            print(controller.display.value);
            controller.displayEnglish.value = lastEntry;
          }
          break;
        }
      case "GT":
        {
          scrolle();
          dotAdded = false;
          // controller.display.value = number.toString();
          // controller.displayEnglish.value = number.toString();
          // controller.displayOprater.value = number;
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
          if (onetime == false) {
            print("ffffffffffffffffffffffffff");
            scrolle();
            dotAdded = false;
            if (controller.prevOpertor.value == "+") {
              String display = controller.display.value;
              print(display);
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              print(controller.value.value);
              print("currentValue ${controller.currentValue.value}");
              controller.currentValue.value = double.parse(controller.value[0]);
              print("currentValue ${controller.currentValue.value}");

              double percentageValue =
                  controller.currentValue.value * double.parse(display);
              print("percentageValue ${percentageValue}");
              percentageValue /= 100;
              print("percentageValue ${percentageValue}");
              double newValue = controller.currentValue.value + percentageValue;

              print("newValue ${newValue}");
              // Update the display with the new value
              controller.display.value = newValue.toString();

              controller.displayEnglish.value = newValue.toString();
            } else if (controller.prevOpertor.value == "-") {
              String display = controller.display.value;
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              print(controller.value.value);
              print("currentValue ${controller.currentValue.value}");
              controller.currentValue.value = double.parse(controller.value[0]);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue =
                  controller.currentValue.value * double.parse(display);
              print("percentageValue ${percentageValue}");
              percentageValue /= 100;
              print("percentageValue ${percentageValue}");
              double newValue = controller.currentValue.value - percentageValue;

              print("newValue ${newValue}");
              // Update the display with the new value
              controller.display.value = newValue.toString();

              controller.displayEnglish.value = newValue.toString();
            } else if (controller.prevOpertor.value == "*") {
              String display = controller.display.value;
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              print(controller.value.value);
              print("currentValue ${controller.currentValue.value}");
              controller.currentValue.value = double.parse(controller.value[0]);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue =
                  controller.currentValue.value * double.parse(display);
              print("percentageValue ${percentageValue}");
              percentageValue /= 100;
              print("percentageValue ${percentageValue}");
              print('************');
              double newValue = controller.currentValue.value * percentageValue;

              print("newValue ${newValue}");
              // Update the display with the new value
              controller.display.value = percentageValue.toString();

              controller.displayEnglish.value = percentageValue.toString();
            } else if (controller.prevOpertor.value == "/") {
              String display = controller.display.value;
              controller.value
                  .add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              print(controller.value.value);
              print("currentValue ${controller.currentValue.value}");
              controller.currentValue.value = double.parse(controller.value[0]);
              print("currentValue ${controller.currentValue.value}");
              double percentageValue =
                  controller.currentValue.value / double.parse(display);
              print("percentageValue ${percentageValue}");
              percentageValue *= 100;
              print("percentageValue ${percentageValue}");
              double newValue = controller.currentValue.value / percentageValue;

              print("newValue ${newValue}");
              // Update the display with the new value
              controller.display.value = percentageValue.toString();

              controller.displayEnglish.value = percentageValue.toString();
            }

            print(controller.displayEnglish);
            controller.displayOprater.value = "=";
            // print(controller.result);
            controller.value.add(controller.displayOprater.value +
                controller.displayEnglish.value);
            controller.saveValueListToPrefs();
          } else if (onetime == true) {
            controller.prevOpertor.value = "=";
            print("tttttttttttttttttttttttttttt");
            controller.displayOprater.value = number;
            print(controller.displayOprater.value);
            print(" 4000000000000000000${controller.display.value}");
            print("4444444444444${display}");

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
            controller.value.add(controller.prevOpertor.value + r1.toString());
            controller.saveValueListToPrefs();
            print(controller.value.value);
          }
          // else if (controller.prevOpertor.value == "-") {
          //   controller.displayOprater.value ="=";
          //   controller.value.add(controller.prevOpertor.value+controller.display.value);
          //   controller.saveValueListToPrefs();
          //   controller.result.value -= double.parse(controller.displayEnglish.value);
          //   controller.value.add(controller.displayOprater.value+controller.result.value.toString());
          //   controller.saveValueListToPrefs();
          // } else if (controller.prevOpertor.value == "*") {
          //   controller.displayOprater.value ="=";
          //   controller.value.add(controller.prevOpertor.value+controller.display.value);
          //   controller.saveValueListToPrefs();
          //   controller.result.value *= double.parse(controller.displayEnglish.value);
          //   controller.value.add(controller.displayOprater.value+controller.result.value.toString());
          //   controller.saveValueListToPrefs();
          // } else if (controller.prevOpertor.value == "/") {
          //   controller.displayOprater.value ="=";
          //   controller.value.add(controller.prevOpertor.value+controller.display.value);
          //   controller.saveValueListToPrefs();
          //   controller.result.value /= double.parse(controller.displayEnglish.value);
          //   controller.value.add(controller.displayOprater.value+controller.result.value.toString());
          //   controller.saveValueListToPrefs();
          //
          // }
          // controller.currentValue.value = double.parse(controller.value[0]);
          // double percentageValue = controller.currentValue.value * 0.20;
          //
          // // Calculate the new value (current value plus the percentage value)
          // double newValue = controller.currentValue.value + percentageValue;
          //
          // // Update the display with the new value
          // controller.display.value = newValue.toString();
          // controller.displayEnglish.value = newValue.toString();
          controller.displayOprater.value = number;
          controller.operator.add(controller.displayOprater.value);
          // controller.prevOpertor.value = "%";
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
          if(controller.prevOpertor.value=="+")
          {
            controller.result.value +=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="-")
          {
            controller.result.value -=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="*")
          {
            controller.result.value *=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="/")
          {
            controller.result.value /=
                double.parse(controller.displayEnglish.value);
          } if(controller.prevOpertor.value=="")
          {
            controller.result.value =
                double.parse(controller.displayEnglish.value);
          }

          dotAdded = false;
          controller.prevOpertor.value == "="?controller.value.add(controller.display.value):controller.value.add(controller.prevOpertor.value+controller.display.value);
          controller.saveValueListToPrefs();
          controller.memory.value /=
              double.parse(controller.displayEnglish.value);
          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.displayOprater.value = number;
          controller.operator.add(controller.displayOprater.value);
          controller.prevOpertor.value = "/";
          break;
        }
      case "*":
        {
          scrolle();
          if(controller.prevOpertor.value=="+")
          {
            controller.result.value +=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="-")
          {
            controller.result.value -=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="*")
          {
            controller.result.value *=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="/")
          {
            controller.result.value /=
                double.parse(controller.displayEnglish.value);
          } if(controller.prevOpertor.value=="")
          {
            controller.result.value =
                double.parse(controller.displayEnglish.value);
          }
          dotAdded = false;
          controller.prevOpertor.value == "="?controller.value.add(controller.display.value):controller.value.add(controller.prevOpertor.value+controller.display.value);
          controller.saveValueListToPrefs();
          controller.memory.value *=
              double.parse(controller.displayEnglish.value);
          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.displayOprater.value = number;
          controller.operator.add(controller.displayOprater.value);
          controller.prevOpertor.value = "*";
          break;
        }
      case "-":
        {
          scrolle();

          dotAdded = false;
          if(controller.prevOpertor.value=="+")
            {
              controller.result.value +=
                  double.parse(controller.displayEnglish.value);
            }
          if(controller.prevOpertor.value=="-")
          {
            controller.result.value -=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="*")
          {
            controller.result.value *=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="/")
          {
            controller.result.value /=
                double.parse(controller.displayEnglish.value);
          } if(controller.prevOpertor.value=="")
          {
            controller.result.value =
                double.parse(controller.displayEnglish.value);
          }
          controller.prevOpertor.value == "="?controller.value.add(controller.display.value):controller.value.add(controller.prevOpertor.value+controller.display.value);
          controller.saveValueListToPrefs();
          controller.memory.value -= double.parse(controller.displayEnglish.value);
          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.displayOprater.value = number;
          controller.operator.add(controller.displayOprater.value);
          controller.prevOpertor.value = "-";
          break;
        }
      case "+":
        {
          dotAdded = false;
          scrolle();

          if(controller.prevOpertor.value=="+")
          {
            controller.result.value +=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="-")
          {
            controller.result.value -=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="*")
          {
            controller.result.value *=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="/")
          {
            controller.result.value /=
                double.parse(controller.displayEnglish.value);
          }
          if(controller.prevOpertor.value=="")
            {
              controller.result.value =
                  double.parse(controller.displayEnglish.value);
            }

          controller.prevOpertor.value == "="?controller.value.add(controller.display.value):controller.value.add(controller.prevOpertor.value+controller.display.value);
          controller.saveValueListToPrefs();
          controller.memory.value +=
              double.parse(controller.displayEnglish.value);
          controller.display.value = "";
          controller.displayEnglish.value = "";
          controller.displayOprater.value = number;
          controller.operator.add(controller.displayOprater.value);
          controller.prevOpertor.value = "+";
          break;
        }
      case "=":
        {
          scrolle();
          dotAdded = false;
          controller.displayOprater.value = number;
          if (controller.prevOpertor.value == "+") {
            scrolle();
            if(update == true)
              {
                print("========= update +++++++++++");
                controller.value.add(controller.display.value);
                controller.saveValueListToPrefs();

                controller.updatevalue.value = controller.updatevalue.value.substring(1);
                controller.displayEnglish.value = controller.displayEnglish.value.substring(1);
                print(controller.display.value);
                print("jhdjkh${ controller.updatevalue.value}");


                if(controller.value.length==2) {
                print("length${ double.parse(
                      controller.value[controller.value.length - 2])}");
                  controller.result.value = double.parse(
                      controller.value[controller.value.length - 2]) +  double.parse(controller.updatevalue.value);
                }else {

                  // print("length${ double.parse( controller.value[controller.value.length])}");
                  double total = 0.0;

                  for (int i = 0; i < controller.value.length; i++) {
                    double elementValue = double.parse(controller.value[i]);
                    total += elementValue;
                  }

                  controller.result.value = total;
                }
                print(controller.result.value);
                controller.value.add(controller.displayOprater.value + controller.result.value.toString());
                controller.saveValueListToPrefs();
                scrolle();
              }

            else{
              controller.value.add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();
              controller.result.value += double.parse(controller.displayEnglish.value);
              controller.value.add(controller.displayOprater.value + controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            }

          } else if (controller.prevOpertor.value == "-") {

            scrolle();
            if(update == true)
            {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value = controller.updatevalue.value.substring(1);
              controller.displayEnglish.value = controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${ controller.updatevalue.value}");


              if(controller.value.length==2) {
                print("length${ double.parse(
                    controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                    controller.value[controller.value.length - 2]) -  double.parse(controller.updatevalue.value);
              }else {

                // print("length${ double.parse( controller.value[controller.value.length])}");
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  total -= elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value + controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            }else{
              controller.value.add(controller.prevOpertor.value + controller.display.value);
              controller.saveValueListToPrefs();

              controller.result.value = subtractAndRound(controller.result.value,double.parse(controller.display.value));
              controller.value.add(controller.displayOprater.value +  controller.result.value.toString());
              controller.saveValueListToPrefs();
            }


          } else if (controller.prevOpertor.value == "*") {
            scrolle();
            if(update == true)
            {
              print("========= update +++++++++++");
              controller.value.add(controller.display.value);
              controller.saveValueListToPrefs();

              controller.updatevalue.value = controller.updatevalue.value.substring(1);
              controller.displayEnglish.value = controller.displayEnglish.value.substring(1);
              print(controller.display.value);
              print("jhdjkh${ controller.updatevalue.value}");


              if(controller.value.length==2) {
                print("length${ double.parse(
                    controller.value[controller.value.length - 2])}");
                controller.result.value = double.parse(
                    controller.value[controller.value.length - 2]) *  double.parse(controller.updatevalue.value);
              }else {

                // print("length${ double.parse( controller.value[controller.value.length])}");
                double total = 0.0;

                for (int i = 0; i < controller.value.length; i++) {
                  double elementValue = double.parse(controller.value[i]);
                  total *= elementValue;
                }

                controller.result.value = total;
              }
              print(controller.result.value);
              controller.value.add(controller.displayOprater.value + controller.result.value.toString());
              controller.saveValueListToPrefs();
              scrolle();
            }else {
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
            controller.value
                .add(controller.prevOpertor.value + controller.display.value);
            controller.saveValueListToPrefs();
            controller.result.value /=
                double.parse(controller.displayEnglish.value);
            controller.value.add(controller.displayOprater.value +
                controller.result.value.toString());
            controller.saveValueListToPrefs();
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
          } else if(controller.prevOpertor.value == "update")
            {
              print("========= update ==========");

              print("jhdjkh${ controller.updatevalue.value}");
            }
          controller.display.value = "";
          // controller.display.value = controller.result.value.toString();
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
                itemCount: controller.value.length+1,
                itemBuilder: (context, index) {
                  if(index == controller.value.length)
                    {
                      return Container(height: 8.h,);
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
                                decoration: controller.value[index].contains("=")
                                    ? BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(5))
                                    : BoxDecoration(),
                                child: Text(
                                  " ${controller.value[index]}",
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
                                Text(
                                  "${controller.displayOprater.value == "=" ? "" : controller.displayOprater.value}",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: controller.dark.value
                                          ? Colors.black
                                          : Colors.black,
                                      fontWeight: FontWeight.w500),
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
