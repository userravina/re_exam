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

units_converter 3.0.0 
https://converter-now.web.app/#/conversions/time


   import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/calculator_controller.dart';

class Currency_Convert_Screen extends StatefulWidget {
  const Currency_Convert_Screen({super.key});

  @override
  State<Currency_Convert_Screen> createState() =>
      _Currency_Convert_ScreenState();
}

class _Currency_Convert_ScreenState extends State<Currency_Convert_Screen> {
  Calculator_Controller controller = Get.find();
  TextEditingController firstcontroller = TextEditingController();
  TextEditingController secoundcontroller = TextEditingController();
  double firstAmount = 0.0;
  double secondAmount = 0.0;

  // Other existing code...

  // Function to handle the conversion based on the entered amount
  void convertCurrency() {
    // Get the entered amount from the first text field
    double amountInINR = double.tryParse(firstcontroller.text) ?? 0.0;
    print("amountInINR${amountInINR}");
    double exchangeRate1 = controller.getAPiRate(controller.selectedCurrency.value.substring(0, 3).toUpperCase(),controller.currancyReta);
    print("exchangeRate1${exchangeRate1}");
    // Get the exchange rate for the selected currency
    double exchangeRate2 = controller.getAPiRate(controller.selectedCurrency2.value.substring(0, 3).toUpperCase(),controller.currancyReta);
    print("exchangeRate2${exchangeRate2}");
    double amountInSelectedCurrency1 = amountInINR / exchangeRate1;
    // Convert the entered amount from INR to the selected currency
    double amountInSelectedCurrency = exchangeRate2 * amountInSelectedCurrency1;
    print("amountInSelectedCurrency${amountInSelectedCurrency}");
    // Display the converted amount in the second text field

    secoundcontroller.text = amountInSelectedCurrency.toStringAsFixed(2);
  }

  @override
  void initState() {
    controller.apiLoad();
    super.initState();
  }
  void swapCurrencies() {
    // Swap selected currencies
    String tempCurrency = firstcontroller.text;
    firstcontroller.text = secoundcontroller.text;
    secoundcontroller.text = tempCurrency;

    // Swap selected flags
    String tempFlag = controller.selectedflag.value;
    controller.selectedflag.value = controller.selectedflag2.value;
    controller.selectedflag2.value = tempFlag;
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
            child: Icon(Icons.arrow_back_ios_new),
          ),
          centerTitle: true,
          title: Text(
            "Currency Converter",
            style: TextStyle(
              color: controller.dark.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        body: Obx(
          () => controller.iscalled.value
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showCurrencySelectorBottomSheet(context);
                            },
                            child: Container(
                              height: 17.h,
                              width: 55.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Container(
                                        height: 8.h,
                                        width: 65,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://athh.co/gst_calc_divine_mongo_new/flag1/${controller.selectedflag.value}"),
                                              fit: BoxFit.cover),
                                        ),),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.selectedCurrency.value,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showCurrencySelectorBottomSheet2(context);
                            },
                            child: SizedBox(
                              height: 17.h,
                              width: 55.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipOval(clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      height: 8.h,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(150),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://athh.co/gst_calc_divine_mongo_new/flag1/${controller.selectedflag2.value}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.selectedCurrency2.value,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 6.h,
                            width: 30.w,
                            child: Center(
                              child: TextField(
                                onChanged: (v) {
                                  setState(() {
                                    controller.getAPiRate(controller.selectedCurrency.value.substring(0,3).toUpperCase(),controller.currancyReta);
                                    convertCurrency();
                                  });

                                },
                                controller: firstcontroller,
                                keyboardType: TextInputType.number,
                                cursorWidth: 2,
                                cursorColor: Colors.grey.shade600,
                                cursorHeight: 3.h,
                                decoration: InputDecoration(
                                  hintText: 'Enter no',
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade400),
                                  prefixText:
                                      "${controller.selectedCurrency.value.substring(0, 3).toUpperCase() + '  '}",
                                  prefixStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                  // prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(onTap: () {
                          swapCurrencies();
                        },child: Icon(Icons.swap_horiz)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 6.h,
                            width: 43.w,
                            child: Center(
                              child: TextField(
                                controller: secoundcontroller,
                                keyboardType: TextInputType.number,
                                cursorWidth: 2,
                                cursorColor: Colors.grey.shade600,
                                cursorHeight: 3.h,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'Enter no',
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade400),
                                  prefixText:
                                      "${controller.selectedCurrency2.value.substring(0, 3).toUpperCase() + '  '}",
                                  prefixStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                  // prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),

                      ],
                    ),
                    SizedBox(height: 3.h,),

                  ],
                )
              : Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void _showCurrencySelectorBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        String searchText = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 50.h, // Adjust the height as needed
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: TextField(
                            style: TextStyle(),
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ListView.builder(
                        itemCount: controller.flagJsonList!.length,
                        itemBuilder: (context, index) {
                          final flag = controller.flagJsonList![index];
                          if (flag.name!
                              .toLowerCase()
                              .contains(searchText.toLowerCase())) {
                            return ListTile(
                              onTap: () {
                                setState(() {
                                  controller.selectedCurrency.value = flag.name!;
                                  final splitted = controller.selectedCurrency.value.split(' ');
                                  controller.selectedCurrency.value = splitted[0];
                                  print(" =========== ${controller.selectedCurrency.value} ======== ");

                                  controller.selectedflag.value = flag.flag!;
                                });
                                Navigator.pop(context);
                              },
                              leading: Image.network(
                                "https://athh.co/gst_calc_divine_mongo_new/flag1/${flag.flag}",
                                width: 20, // Adjust the width as needed
                                height: 20, // Adjust the height as needed
                              ),
                              title: Text(flag.name!),
                            );
                          } else {
                            return SizedBox(); // Return empty container if not matching search
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showCurrencySelectorBottomSheet2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        String searchText = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 80.h, // Adjust the height as needed
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: TextField(
                            style: TextStyle(),
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ListView.builder(
                        itemCount: controller.flagJsonList!.length,
                        itemBuilder: (context, index) {
                          final flag = controller.flagJsonList![index];
                          if (flag.name!.toLowerCase().contains(searchText.toLowerCase())) {
                            return ListTile(
                              onTap: () {
                                setState(() {
                                  controller.selectedCurrency2.value = flag.name!;
                                  final splitted = controller.selectedCurrency2.value.split(' ');
                                  controller.selectedCurrency2.value = splitted[0];
                                  print(" =========== ${controller.selectedCurrency2.value} ======== ");
                                  controller.selectedflag2.value = flag.flag!;
                                });
                                Navigator.pop(context);
                              },
                              leading: Image.network(
                                "https://athh.co/gst_calc_divine_mongo_new/flag1/${flag.flag}",
                                width: 20, // Adjust the width as needed
                                height: 20, // Adjust the height as needed
                              ),
                              title: Text(flag.name!),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

