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
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/calculator_controller.dart';

class Age_Calcu_Screen extends StatefulWidget {
  const Age_Calcu_Screen({Key? key}) : super(key: key); // Fixed the syntax for the constructor

  @override
  State<Age_Calcu_Screen> createState() => _Age_Calcu_ScreenState();
}

class _Age_Calcu_ScreenState extends State<Age_Calcu_Screen> {
  Calculator_Controller controller = Get.find();
  DateTime? _selectedDate;
  DateTime? _currentDate;
  String _age = '';
  String _daysUntilNextBirthday = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
          centerTitle: true,
          title: Text(
            "Age Calculator",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/images/tools/setting.png",
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
          child: Column(
            children: [
              // Date of Birth
              Row(
                children: [
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    "Date of Birth",
                    style: TextStyle(
                      color: controller.dark.value ? Colors.white : Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: SizedBox(
                  height: 6.77.h,
                  child: TextField(
                    enabled: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: controller.dark.value ? Colors.grey.shade200 : Colors.black,
                        ),
                      ),
                      hintText: _selectedDate == null
                          ? 'Select Date Of Birth'
                          : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                      suffixIcon: Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              // Age at the Date of
              Row(
                children: [
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    "Age at the Date of",
                    style: TextStyle(
                      color: controller.dark.value ? Colors.white : Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () => _selectCurrentDate(context),
                child: SizedBox(
                  height: 6.77.h,
                  child: TextField(
                    enabled: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: controller.dark.value ? Colors.grey.shade200 : Colors.black,
                        ),
                      ),
                      hintText: _currentDate == null
                          ? 'Select Current Date'
                          : DateFormat('dd-MM-yyyy').format(_currentDate!),
                      suffixIcon: Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              // Clear and Calculate Buttons
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedDate = null;
                          _currentDate = null;
                          _age = '';
                          controller.ageresult.value = false;
                        });
                      },
                      child: Container(
                        height: 6.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: controller.dark.value ? Color(0xff202C35) : Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Clear",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
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
                        if (_selectedDate != null && _currentDate != null) {
                          _calculateAge(_selectedDate!, _currentDate!);
                        } else {
                          // Show error or prompt to select dates
                        }
                        controller.ageresult.value = true;
                      },
                      child: Container(
                        height: 6.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: Color(0xff4777E3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
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
              // Result Section
              Obx(
                    () => controller.ageresult.value
                    ? Column(
                  children: [
                    Container(
                      height: 41.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 0.7,
                          color: controller.dark.value ? Colors.grey.shade600 : Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Result Header
                          Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: controller.dark.value ? Color(0xff1C242C) : Colors.grey.shade300,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "Result",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Born on
                          Row(
                            children: [
                              SizedBox(width: 3.w,),
                              Text("Born on:", style: TextStyle(fontWeight: FontWeight.w500),),
                              SizedBox(width: 5.w,),
                              Text("${_selectedDate != null ? DateFormat('dd-MM-yyyy').format(_selectedDate!) : ''}"),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          // Age
                          Row(
                            children: [
                              SizedBox(width: 3.w,),
                              Text("Age on", style: TextStyle(fontWeight: FontWeight.w500),),
                              SizedBox(width: 5.w,),
                              Text("$_age"),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          // Divider
                          Container(
                            height: 1,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: controller.dark.value ? Colors.grey.shade600 : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text("Your Current Age"),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Current Age: Years, Months, Days
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              // Years
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${_age}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "YEARS",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              // Months
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${_calculateMonths(_selectedDate!, _currentDate!)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "MONTHS",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              // Days
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${_calculateDays(_selectedDate!, _currentDate!)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "DAYS",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          // Divider
                          Container(
                            height: 1,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: controller.dark.value ? Colors.grey.shade600 : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text("Your Next Birthday days"),
                          SizedBox(
                            height: 1.h,
                          ),
                          // Days Until Next Birthday
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${_daysUntilNextBirthday}",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 2.w,),
                              Text(
                                "Days",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
                    : Column(children: []),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectCurrentDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _currentDate) {
      setState(() {
        _currentDate = picked;
      });
    }
  }

  void _calculateAge(DateTime birthDate, DateTime currentDate) {
    // Calculate age
    final int years = currentDate.year - birthDate.year;
    final int months = currentDate.month - birthDate.month;
    final int days = currentDate.day - birthDate.day;

    // Adjust age if birth date hasn't occurred yet this year
    if (months < 0 || (months == 0 && days < 0)) {
      setState(() {
        _age = '${years - 1} years';
      });
    } else {
      setState(() {
        _age = '$years years';
      });
    }

    // Calculate next birthday date
    DateTime nextBirthday = DateTime(currentDate.year, birthDate.month, birthDate.day);
    if (nextBirthday.isBefore(currentDate)) {
      nextBirthday = DateTime(currentDate.year + 1, birthDate.month, birthDate.day);
    }

    // Calculate days until next birthday
    final daysUntilNextBirthday = nextBirthday.difference(currentDate).inDays;

    // Update UI with current age and days until next birthday
    setState(() {
      _daysUntilNextBirthday = daysUntilNextBirthday.toString();
    });
  }

  int _calculateMonths(DateTime birthDate, DateTime currentDate) {
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months = 12 - birthDate.month + currentDate.month;
    } else {
      months = currentDate.month - birthDate.month;
    }

    return months;
  }

  int _calculateDays(DateTime birthDate, DateTime currentDate) {
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months = 12 - birthDate.month + currentDate.month;
      days = 31 - birthDate.day + currentDate.day; // Assuming all months have 31 days
    } else {
      days = currentDate.day - birthDate.day;
    }

    return days;
  }
}

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
  Calculator_Controller controller = Get.find();
  int total = 0;

  void calculateTotal() {
    int newTotal = 0;
    controller.notes.forEach((denomination, count) {
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
              setState(() {
                controller.notes.forEach((denomination, _) {
                  print(controller.notes[denomination]);
                  controller.notes[denomination] = 0;
                });

                // Reset the total to zero
                total = 0;
              });
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
                      itemCount: controller.notes.length,
                      itemBuilder: (context, index) {
                        int denomination = controller.notes.keys.elementAt(index);
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
                                            controller: TextEditingController(text: controller.notes[denomination] == 0 ? '' : controller.notes[denomination].toString()),
                                            onChanged: (value) {
                                              setState(() {
                                                controller.notes[denomination] = int.tryParse(value) ?? 0 ;
                                                if (controller.notes[denomination] == 0) {
                                                  value = ''; // Clear the text field if the value is 0
                                                }
                                                calculateTotal();
                                              });
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide:  const BorderSide(color: Colors.grey),
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
                                    Expanded(flex: 3,child: Center(child: Text("${controller.notes[denomination]! * denomination}"))),
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
   
