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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/energy.dart';

import '../../controller/calculator_controller.dart';

class Energy_Screen extends StatefulWidget {
  const Energy_Screen({super.key});

  @override
  State<Energy_Screen> createState() => _Energy_ScreenState();
}

class _Energy_ScreenState extends State<Energy_Screen> {
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

  int selected = 0;

  calculation(List<Unit> unit) {
    if (selected != 1)
      TextEditingController1.text = "${unit[0].value!.toStringAsFixed(2)}";
    if (selected != 2)
      TextEditingController2.text = "${unit[1].value!.toStringAsFixed(2)}";
    if (selected != 3)
      TextEditingController3.text = "${unit[2].value!.toStringAsFixed(2)}";
    if (selected != 4)
      TextEditingController4.text = "${unit[3].value!.toStringAsFixed(2)}";
    if (selected != 5)
      TextEditingController5.text = "${unit[4].value!.toStringAsFixed(2)}";
    if (selected != 6)
      TextEditingController6.text = "${unit[5].value!.toStringAsFixed(2)}";


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
            "Energy",
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
                      "Joule",
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
                      var angle = Energy(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(ENERGY.joules, double.parse(value));
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
                      "Calories",
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
                      var angle = Energy(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(ENERGY.calories, double.parse(value));
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
                      "Kilocalories",
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
                      var angle = Energy(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          ENERGY.kilocalories, double.parse(value));
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
                      "Kilowatt hour",
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
                      var angle = Energy(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(ENERGY.kilowattHours, double.parse(value));
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
                      "Electron volt",
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
                      var angle = Energy(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(ENERGY.electronvolts, double.parse(value));
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
                      "Foot pound",
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
                      var angle = Energy(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          ENERGY.energyFootPound, double.parse(value));
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/area.dart';
import '../../controller/calculator_controller.dart';

class Area_Screen extends StatefulWidget {
  const Area_Screen({super.key});

  @override
  State<Area_Screen> createState() => _Area_ScreenState();
}

class _Area_ScreenState extends State<Area_Screen> {
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
            "Area",
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
                      "Square Meters",
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
                    onChanged: (value){
                      selected=1;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareMeters, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Centimeters",
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
                    onChanged: (value){
                      selected=2;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareCentimeters, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Inches",
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
                    onChanged: (value){
                      selected=3;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareInches, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Feet",
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
                    onChanged: (value){
                      selected=4;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareFeet, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Feet (US survey)",
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
                    onChanged: (value){
                      selected=5;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareFeetUs, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Millimeters",
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
                    onChanged: (value){
                      selected=6;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareMillimeters, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Hectares",
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
                    onChanged: (value){
                      selected=7;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.hectares, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Kilometers",
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
                    onChanged: (value){
                      selected=8;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareKilometers, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Yard",
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
                    onChanged: (value){
                      selected=9;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareYard, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Square Miles",
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
                    onChanged: (value){
                      selected=10;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.squareMiles, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Acres",
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
                    onChanged: (value){
                      selected=11;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.acres, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Are",
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
                    onChanged: (value){
                      selected=12;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Area(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(AREA.are, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/fuel_consumption.dart';
import '../../controller/calculator_controller.dart';

class Fuel_Screen extends StatefulWidget {
  const Fuel_Screen({super.key});

  @override
  State<Fuel_Screen> createState() => _Fuel_ScreenState();
}

class _Fuel_ScreenState extends State<Fuel_Screen> {
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

  int selected = 0;

  calculation(List<Unit> unit) {
    if (selected != 1)
      TextEditingController1.text = "${unit[0].value!.toStringAsFixed(2)}";
    if (selected != 2)
      TextEditingController2.text = "${unit[1].value!.toStringAsFixed(2)}";
    if (selected != 3)
      TextEditingController3.text = "${unit[2].value!.toStringAsFixed(2)}";
    if (selected != 4)
      TextEditingController4.text = "${unit[3].value!.toStringAsFixed(2)}";
    if (selected != 5)
      TextEditingController5.text = "${unit[4].value!.toStringAsFixed(2)}";
    if (selected != 6)
      TextEditingController6.text = "${unit[5].value!.toStringAsFixed(2)}";


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
            "Fuel",
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
                      "Kilometers Per Liter",
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
                      var angle = FuelConsumption(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(FUEL_CONSUMPTION.kilometersPerLiter, double.parse(value));
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
                      "Liter Per 100 Km",
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
                      var angle = FuelConsumption(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(FUEL_CONSUMPTION.litersPer100km, double.parse(value));
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
                      "Miles Per US Gallon",
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
                      var angle = FuelConsumption(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          FUEL_CONSUMPTION.milesPerUsGallon, double.parse(value));
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
                      "Miles Per Imperial Gallon",
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
                      var angle = FuelConsumption(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(FUEL_CONSUMPTION.milesPerImperialGallon, double.parse(value));
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
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/area.dart';
import 'package:units_converter/properties/length.dart';

import '../../controller/calculator_controller.dart';

class Length_Screen extends StatefulWidget {
  const Length_Screen({super.key});

  @override
  State<Length_Screen> createState() => _Length_ScreenState();
}

class _Length_ScreenState extends State<Length_Screen> {
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

  int selected = 0;

  calculation(List<Unit> unit) {
    if (selected != 1)
      TextEditingController1.text = "${unit[0].value!.toStringAsFixed(2)}";
    if (selected != 2)
      TextEditingController2.text = "${unit[1].value!.toStringAsFixed(2)}";
    if (selected != 3)
      TextEditingController3.text = "${unit[2].value!.toStringAsFixed(2)}";
    if (selected != 4)
      TextEditingController4.text = "${unit[3].value!.toStringAsFixed(2)}";
    if (selected != 5)
      TextEditingController5.text = "${unit[4].value!.toStringAsFixed(2)}";
    if (selected != 6)
      TextEditingController6.text = "${unit[5].value!.toStringAsFixed(2)}";
    if (selected != 7)
      TextEditingController7.text = "${unit[6].value!.toStringAsFixed(2)}";
    if (selected != 8)
      TextEditingController8.text = "${unit[7].value!.toStringAsFixed(2)}";
    if (selected != 9)
      TextEditingController9.text = "${unit[8].value!.toStringAsFixed(2)}";
    if (selected != 10)
      TextEditingController10.text = "${unit[9].value!.toStringAsFixed(2)}";
    if (selected != 11)
      TextEditingController11.text = "${unit[10].value!.toStringAsFixed(2)}";
    if (selected != 12)
      TextEditingController12.text = "${unit[11].value!.toStringAsFixed(2)}";
    if (selected != 13)
      TextEditingController13.text = "${unit[12].value!.toStringAsFixed(2)}";
    if (selected != 14)
      TextEditingController14.text = "${unit[13].value!.toStringAsFixed(2)}";
    if (selected != 15)
      TextEditingController15.text = "${unit[14].value!.toStringAsFixed(2)}";
    if (selected != 16)
      TextEditingController16.text = "${unit[15].value!.toStringAsFixed(2)}";
    if (selected != 17)
      TextEditingController17.text = "${unit[16].value!.toStringAsFixed(2)}";
    if (selected != 18)
      TextEditingController18.text = "${unit[17].value!.toStringAsFixed(2)}";

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
            "Length",
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
                      "Meters",
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
                    onChanged: (value){
                      selected=1;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }

                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.meters, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Centimeters",
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
                    onChanged: (value){
                      selected=2;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }

                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.centimeters, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Inches",
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
                    onChanged: (value){
                      selected=3;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }

                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.inches, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Feet",
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
                    onChanged: (value){
                      selected=4;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }

                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.feet, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Feet (US survey)",
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
                    onChanged: (value){
                      selected=5;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }

                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.feetUs, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Mils",
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
                    onChanged: (value){
                      selected=6;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }

                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.mils, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Nautical miles",
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
                    onChanged: (value){
                      selected=7;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.nauticalMiles, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Yards",
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
                    onChanged: (value){
                      selected=8;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.yards, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Miles",
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
                    onChanged: (value){
                      selected=9;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.miles, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Millimeters",
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
                    onChanged: (value){
                      selected=10;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.millimeters, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Micrometers",
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
                    onChanged: (value){
                      selected=11;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.micrometers, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Nanometers",
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
                    onChanged: (value){
                      selected=12;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.nanometers, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Angstrom",
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
                    onChanged: (value){
                      selected=13;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.angstroms, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Picometers",
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
                    onChanged: (value){
                      selected=14;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.picometers, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Kilometers",
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
                    onChanged: (value){
                      selected=15;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.kilometers, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Astronomical Units",
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
                    onChanged: (value){
                      selected=16;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.astronomicalUnits, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Light-Years",
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
                    onChanged: (value){
                      selected=17;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.lightYears, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
                      "Parsec",
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
                    onChanged: (value){
                      selected=18;
                      if(value=="")
                      {
                        value="0";
                        return;
                      }
                      var angle = Length(significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(LENGTH.parsec, double.parse(value));
                      var units = angle.getAll();
                      calculation(units);
                      for (var unit in units) {
                        print('name:${unit.name}, value:${unit
                            .value}, stringValue:${unit
                            .stringValue}, symbol:${unit.symbol}');
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
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/VOLUME.dart';
import 'package:units_converter/properties/pressure.dart';

import '../../controller/calculator_controller.dart';

class Pressure_Screen extends StatefulWidget {
  const Pressure_Screen({super.key});

  @override
  State<Pressure_Screen> createState() => _Pressure_ScreenState();
}

class _Pressure_ScreenState extends State<Pressure_Screen> {
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


  int selected = 0;

  calculation(List<Unit> unit) {
    if (selected != 1)
      TextEditingController1.text = "${unit[0].value!.toStringAsFixed(2)}";
    if (selected != 2)
      TextEditingController2.text = "${unit[1].value!.toStringAsFixed(2)}";
    if (selected != 3)
      TextEditingController3.text = "${unit[2].value!.toStringAsFixed(2)}";
    if (selected != 4)
      TextEditingController4.text = "${unit[3].value!.toStringAsFixed(2)}";
    if (selected != 5)
      TextEditingController5.text = "${unit[4].value!.toStringAsFixed(2)}";
    if (selected != 6)
      TextEditingController6.text = "${unit[5].value!.toStringAsFixed(2)}";
    if (selected != 7)
      TextEditingController7.text = "${unit[6].value!.toStringAsFixed(2)}";
    if (selected != 8)
      TextEditingController8.text = "${unit[7].value!.toStringAsFixed(2)}";

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
            "Pressure",
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
                      "Pascal",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(PRESSURE.pascal, double.parse(value));
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
                      "Bar",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(PRESSURE.bar, double.parse(value));
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
                      "Millibar",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          PRESSURE.millibar, double.parse(value));
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
                      "Atmosphere",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(PRESSURE.atmosphere, double.parse(value));
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
                      "Pounds Per Square Inch",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(PRESSURE.psi, double.parse(value));
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
                      "Torriceli",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          PRESSURE.torr, double.parse(value));
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
                      "Inches Of Mercury",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(PRESSURE.inchOfMercury, double.parse(value));
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
                      "Hectopascal",
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
                      var angle = Pressure(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(PRESSURE.hectoPascal, double.parse(value));
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/units_converter.dart';

import '../../controller/calculator_controller.dart';

class Speed_Screen extends StatefulWidget {
  const Speed_Screen({super.key});

  @override
  State<Speed_Screen> createState() => _Speed_ScreenState();
}

class _Speed_ScreenState extends State<Speed_Screen> {
  Calculator_Controller controller = Get.find();
  TextEditingController meterController = TextEditingController();
  TextEditingController kiloController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController knotcontroller = TextEditingController();
  TextEditingController minutController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  double? value;

  @override
  void initState() {
    super.initState();
  }

  void sped() {
    var meter =
    value!.convertFromTo(SPEED.metersPerSecond, SPEED.kilometersPerHour);
    kiloController.text =
        meter!.toStringAsFixed(1).toString();
    print('celsius:${meter}');

    var miles =
    value!.convertFromTo(SPEED.metersPerSecond, SPEED.milesPerHour);
    milesController.text = miles.toString();
    print('miles:${miles}');

    var knot =
    value!.convertFromTo(SPEED.metersPerSecond, SPEED.knots);
    knotcontroller.text =
        knot.toString();
    print('knot:${knot}');

    var minut =
    value!.convertFromTo(SPEED.metersPerSecond, SPEED.minutesPerKilometer);
    minutController.text =
        minut.toString();
    print('minut:${minut}');

    var feet =
    value!.convertFromTo(SPEED.metersPerSecond, SPEED.feetsPerSecond);
    feetController.text =
        feet.toString();
    print('feet:${feet}');
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
            "Speed",
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
                      "Meters Per Secound",
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
                    controller: meterController,
                    onChanged: (v) {
                      if (meterController.text.isEmpty) {
                        kiloController.clear();
                        milesController.clear();
                        knotcontroller.clear();
                        minutController.clear();
                        feetController.clear();
                      } else {
                        value = double.parse(meterController.text);
                        sped();
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
                      "Kilometers Per Hour",
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
                    readOnly: true,
                    controller: kiloController,
                    onChanged: (v) {},
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
                      "Miles Per Hour",
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
                    readOnly: true,
                    controller: milesController,
                    onChanged: (value) {},
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
                      "Knotes",
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
                    readOnly: true,
                    controller: knotcontroller,
                    onChanged: (value) {},
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
                      "Minutes Per Kilometer",
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
                    readOnly: true,
                    controller: minutController,
                    onChanged: (value) {},
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
                      "Feet Per Secound",
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
                    readOnly: true,
                    controller: feetController,
                    onChanged: (value) {},
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
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/units_converter.dart';
import '../../controller/calculator_controller.dart';

class Temprature_Screen extends StatefulWidget {
  const Temprature_Screen({super.key});

  @override
  State<Temprature_Screen> createState() => _Temprature_ScreenState();
}

class _Temprature_ScreenState extends State<Temprature_Screen> {
  Calculator_Controller controller = Get.find();
  TextEditingController fahrenheitController = TextEditingController();
  TextEditingController celsiusController = TextEditingController();
  TextEditingController kelvinController = TextEditingController();
  TextEditingController reamurcontroller = TextEditingController();
  TextEditingController romerController = TextEditingController();
  TextEditingController delisleController = TextEditingController();
  TextEditingController rankineController = TextEditingController();

  double? value;

  @override
  void initState() {
    super.initState();
  }

  void temp() {
    var celsius =
    value!.convertFromTo(TEMPERATURE.fahrenheit, TEMPERATURE.celsius);
    celsiusController.text =
        celsius!.toStringAsFixed(0).toString();
    print('celsius:${celsius}');

    var kelvin =
    value!.convertFromTo(TEMPERATURE.fahrenheit, TEMPERATURE.kelvin);
    kelvinController.text = kelvin.toString();
    print('kelvin:${kelvin}');

    var reamur = value!.convertFromTo(TEMPERATURE.fahrenheit, TEMPERATURE.reamur);
    reamurcontroller.text = reamur.toString();
    print('reamur:${reamur}');

    var romer =
    value!.convertFromTo(TEMPERATURE.fahrenheit, TEMPERATURE.romer);
    romerController.text = romer.toString();
    print('romer:${romer}');

    var delisle =
    value!.convertFromTo(TEMPERATURE.fahrenheit, TEMPERATURE.delisle);
    delisleController.text = delisle!.toStringAsFixed(0).toString();
    print('delisle:${delisle}');

    var rankine =
    value!.convertFromTo(TEMPERATURE.fahrenheit, TEMPERATURE.rankine);
    rankineController.text = rankine.toString();
    print('rankine:${rankine}');
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
            "Temprature",
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
                      "Fahrenheit",
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
                    controller: fahrenheitController,
                    onChanged: (v) {
                      if (fahrenheitController.text.isEmpty) {
                        celsiusController.clear();
                        kelvinController.clear();
                        reamurcontroller.clear();
                        romerController.clear();
                        delisleController.clear();
                        rankineController.clear();
                      } else {
                        value = double.parse(fahrenheitController.text);
                        temp();
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
                      "Celsius",
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
                    readOnly: true,
                    controller: celsiusController,
                    onChanged: (v) {},
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
                      "Kelvin",
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
                    readOnly: true,
                    controller: kelvinController,
                    onChanged: (value) {},
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
                      "Reamur",
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
                    readOnly: true,
                    controller: reamurcontroller,
                    onChanged: (value) {},
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
                      "Romer",
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
                    readOnly: true,
                    controller: romerController,
                    onChanged: (value) {},
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
                      "Delisle",
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
                    readOnly: true,
                    controller: delisleController,
                    onChanged: (value) {},
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
                      "Rankine",
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
                    readOnly: true,
                    controller: rankineController,
                    onChanged: (value) {},
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
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/time.dart';

import '../../controller/calculator_controller.dart';

class Time_Screen extends StatefulWidget {
  const Time_Screen({super.key});

  @override
  State<Time_Screen> createState() => _Time_ScreenState();
}

class _Time_ScreenState extends State<Time_Screen> {
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
      TextEditingController12.text = "${unit[12].value}";
    if (selected != 14)
      TextEditingController12.text = "${unit[13].value}";
    if (selected != 15)
      TextEditingController12.text = "${unit[14].value}";
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
            "Time",
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
                      "Seconds",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.seconds, double.parse(value));
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
                      "Decisecounds",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.deciseconds, double.parse(value));
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
                      "Centisecounds",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.centiseconds, double.parse(value));
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
                      "Millisecound",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.centiseconds, double.parse(value));
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
                      "Microsecound",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.microseconds, double.parse(value));
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
                      "Nanosecound",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.nanoseconds, double.parse(value));
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
                      "Minutes",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.minutes, double.parse(value));
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
                      "Hours",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.hours, double.parse(value));
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
                      "Days",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.days, double.parse(value));
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
                      "Weeks",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.weeks, double.parse(value));
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
                      "Year",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.years365, double.parse(value));
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
                      "Lustrum",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.lustrum, double.parse(value));
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
                      "Decades",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.decades, double.parse(value));
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
                      "Centuries",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.centuries, double.parse(value));
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
                      "Millennium",
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
                      var angle = Time(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(TIME.millennium, double.parse(value));
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
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/VOLUME.dart';

import '../../controller/calculator_controller.dart';

class Volume_Screen extends StatefulWidget {
  const Volume_Screen({super.key});

  @override
  State<Volume_Screen> createState() => _Volume_ScreenState();
}

class _Volume_ScreenState extends State<Volume_Screen> {
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

  int selected = 0;

  calculation(List<Unit> unit) {
    if (selected != 1)
      TextEditingController1.text = "${unit[0].value!.toStringAsFixed(2)}";
    if (selected != 2)
      TextEditingController2.text = "${unit[1].value!.toStringAsFixed(2)}";
    if (selected != 3)
      TextEditingController3.text = "${unit[2].value!.toStringAsFixed(2)}";
    if (selected != 4)
      TextEditingController4.text = "${unit[3].value!.toStringAsFixed(2)}";
    if (selected != 5)
      TextEditingController5.text = "${unit[4].value!.toStringAsFixed(2)}";
    if (selected != 6)
      TextEditingController6.text = "${unit[5].value!.toStringAsFixed(2)}";
    if (selected != 7)
      TextEditingController7.text = "${unit[6].value!.toStringAsFixed(2)}";
    if (selected != 8)
      TextEditingController8.text = "${unit[7].value!.toStringAsFixed(2)}";
    if (selected != 9)
      TextEditingController9.text = "${unit[8].value!.toStringAsFixed(2)}";
    if (selected != 10)
      TextEditingController10.text = "${unit[9].value!.toStringAsFixed(2)}";
    if (selected != 11)
      TextEditingController11.text = "${unit[10].value!.toStringAsFixed(2)}";
    if (selected != 12)
      TextEditingController12.text = "${unit[11].value!.toStringAsFixed(2)}";
    if (selected != 13)
      TextEditingController13.text = "${unit[12].value!.toStringAsFixed(2)}";
    if (selected != 14)
      TextEditingController14.text = "${unit[13].value!.toStringAsFixed(2)}";
    if (selected != 15)
      TextEditingController15.text = "${unit[14].value!.toStringAsFixed(2)}";
    if (selected != 16)
      TextEditingController16.text = "${unit[15].value!.toStringAsFixed(2)}";
    if (selected != 17)
      TextEditingController17.text = "${unit[16].value!.toStringAsFixed(2)}";
    if (selected != 18)
      TextEditingController18.text = "${unit[17].value!.toStringAsFixed(2)}";

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
            "VOLUME",
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
                      "Cubic Meters",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: true); // conversion
                      angle.convert(VOLUME.cubicMeters, double.parse(value));
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
                      "Liters",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.liters, double.parse(value));
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
                      "Imperial gallons",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          VOLUME.imperialGallons, double.parse(value));
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
                      "US Gallons",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.usGallons, double.parse(value));
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
                      "Imperial Pints",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.imperialPints, double.parse(value));
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
                      "Imperial Fluid Ounces",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          VOLUME.imperialFluidOunces, double.parse(value));
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
                      "Imperial Gill",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.imperialGill, double.parse(value));
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
                      "US Pints",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.usPints, double.parse(value));
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
                      "US Fluid Ounces",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.usFluidOunces, double.parse(value));
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
                      "US Gill",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.usGill, double.parse(value));
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
                      "Milliliters",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.milliliters, double.parse(value));
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
                      "Tablespoons US",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.tablespoonsUs, double.parse(value));
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
                      "Australian Tablespoons",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.tablespoonsUs, double.parse(value));
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
                      "Cups",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.cups, double.parse(value));
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
                      "Cubic Centimeters",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          VOLUME.cubicCentimeters, double.parse(value));
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
                      "Cubic Inches",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.cubicInches, double.parse(value));
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
                      "Cubic Feet",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(VOLUME.cubicFeet, double.parse(value));
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
                      "Cubic Millimeters",
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
                      var angle = Volume(
                          significantFigures: 7,
                          removeTrailingZeros: false); // conversion
                      angle.convert(
                          VOLUME.cubicMillimeters, double.parse(value));
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


