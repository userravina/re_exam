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
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gst_calculator/calculator/model/country_model.dart';
import 'package:gst_calculator/calculator/model/flag_model.dart';
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
  RxString twonumber = "".obs;
  RxString twonumber2 = "".obs;
  RxBool showsiptotal = false.obs;
  RxBool showlumtotal = false.obs;
  RxBool ageresult = false.obs;
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
        rateValue = currancyReta!.uSD;
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
      case '':
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
        rateValue=0;
        break;
    }
    if(rateValue==null)
      rateValue=1;
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
        List<FlagModel> flags = data!.data!.map((datum) => FlagModel(flag: datum.flag)).toList();

        // Convert each FlagModel object to JSON and encode
        flagJsonList = flagModelFromJson(data!.data![0].flag!);

        // Now you have a list of JSON strings representing the flag data
        print("${flags}");
        print(flagJsonList);
        currancyReta=CurrancyReta.fromJson(jsonDecode(data!.data![0].currency!));

        iscalled.value = true;
      }
    });
  }
}
// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  int? status;
  String? message;
  List<Datum>? data;

  CountryModel({
    this.status,
    this.message,
    this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? name;
  String? currency;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? flag;

  Datum({
    this.id,
    this.name,
    this.currency,
    this.createdAt,
    this.updatedAt,
    this.flag,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    currency: json["currency"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "currency": currency,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "flag": flag,
  };
}

class CurrancyReta {
  double? uSD;
  double? aED;
  double? aFN;
  double? aLL;
  double? aMD;
  double? aNG;
  double? aOA;
  double? aRS;
  double? aUD;
  double? aWG;
  double? aZN;
  double? bAM;
  double? bBD;
  double? bDT;
  double? bGN;
  double? bHD;
  double? bIF;
  double? bMD;
  double? bND;
  double? bOB;
  double? bRL;
  double? bSD;
  double? bTN;
  double? bWP;
  double? bYN;
  double? bZD;
  double? cAD;
  double? cDF;
  double? cHF;
  double? cLP;
  double? cNY;
  double? cOP;
  double? cRC;
  double? cUP;
  double? cVE;
  double? cZK;
  double? dJF;
  double? dKK;
  double? dOP;
  double? dZD;
  double? eGP;
  double? eRN;
  double? eTB;
  double? eUR;
  double? fJD;
  double? fKP;
  double? fOK;
  double? gBP;
  double? gEL;
  double? gGP;
  double? gHS;
  double? gIP;
  double? gMD;
  double? gNF;
  double? gTQ;
  double? gYD;
  double? hKD;
  double? hNL;
  double? hRK;
  double? hTG;
  double? hUF;
  double? iDR;
  double? iLS;
  double? iMP;
  double? iNR;
  double? iQD;
  double? iRR;
  double? iSK;
  double? jEP;
  double? jMD;
  double? jOD;
  double? jPY;
  double? kES;
  double? kGS;
  double? kHR;
  double? kID;
  double? kMF;
  double? kRW;
  double? kWD;
  double? kYD;
  double? kZT;
  double? lAK;
  double? lBP;
  double? lKR;
  double? lRD;
  double? lSL;
  double? lYD;
  double? mAD;
  double? mDL;
  double? mGA;
  double? mKD;
  double? mMK;
  double? mNT;
  double? mOP;
  double? mRU;
  double? mUR;
  double? mVR;
  double? mWK;
  double? mXN;
  double? mYR;
  double? mZN;
  double? nAD;
  double? nGN;
  double? nIO;
  double? nOK;
  double? nPR;
  double? nZD;
  double? oMR;
  double? pAB;
  double? pEN;
  double? pGK;
  double? pHP;
  double? pKR;
  double? pLN;
  double? pYG;
  double? qAR;
  double? rON;
  double? rSD;
  double? rUB;
  double? rWF;
  double? sAR;
  double? sBD;
  double? sCR;
  double? sDG;
  double? sEK;
  double? sGD;
  double? sHP;
  double? sLE;
  double? sLL;
  double? sOS;
  double? sRD;
  double? sSP;
  double? sTN;
  double? sYP;
  double? sZL;
  double? tHB;
  double? tJS;
  double? tMT;
  double? tND;
  double? tOP;
  double? tRY;
  double? tTD;
  double? tVD;
  double? tWD;
  double? tZS;
  double? uAH;
  double? uGX;
  double? uYU;
  double? uZS;
  double? vES;
  double? vND;
  double? vUV;
  double? wST;
  double? xAF;
  double? xCD;
  double? xDR;
  double? xOF;
  double? xPF;
  double? yER;
  double? zAR;
  double? zMW;
  double? zWL;

  CurrancyReta({this.uSD,
    this.aED,
    this.aFN,
    this.aLL,
    this.aMD,
    this.aNG,
    this.aOA,
    this.aRS,
    this.aUD,
    this.aWG,
    this.aZN,
    this.bAM,
    this.bBD,
    this.bDT,
    this.bGN,
    this.bHD,
    this.bIF,
    this.bMD,
    this.bND,
    this.bOB,
    this.bRL,
    this.bSD,
    this.bTN,
    this.bWP,
    this.bYN,
    this.bZD,
    this.cAD,
    this.cDF,
    this.cHF,
    this.cLP,
    this.cNY,
    this.cOP,
    this.cRC,
    this.cUP,
    this.cVE,
    this.cZK,
    this.dJF,
    this.dKK,
    this.dOP,
    this.dZD,
    this.eGP,
    this.eRN,
    this.eTB,
    this.eUR,
    this.fJD,
    this.fKP,
    this.fOK,
    this.gBP,
    this.gEL,
    this.gGP,
    this.gHS,
    this.gIP,
    this.gMD,
    this.gNF,
    this.gTQ,
    this.gYD,
    this.hKD,
    this.hNL,
    this.hRK,
    this.hTG,
    this.hUF,
    this.iDR,
    this.iLS,
    this.iMP,
    this.iNR,
    this.iQD,
    this.iRR,
    this.iSK,
    this.jEP,
    this.jMD,
    this.jOD,
    this.jPY,
    this.kES,
    this.kGS,
    this.kHR,
    this.kID,
    this.kMF,
    this.kRW,
    this.kWD,
    this.kYD,
    this.kZT,
    this.lAK,
    this.lBP,
    this.lKR,
    this.lRD,
    this.lSL,
    this.lYD,
    this.mAD,
    this.mDL,
    this.mGA,
    this.mKD,
    this.mMK,
    this.mNT,
    this.mOP,
    this.mRU,
    this.mUR,
    this.mVR,
    this.mWK,
    this.mXN,
    this.mYR,
    this.mZN,
    this.nAD,
    this.nGN,
    this.nIO,
    this.nOK,
    this.nPR,
    this.nZD,
    this.oMR,
    this.pAB,
    this.pEN,
    this.pGK,
    this.pHP,
    this.pKR,
    this.pLN,
    this.pYG,
    this.qAR,
    this.rON,
    this.rSD,
    this.rUB,
    this.rWF,
    this.sAR,
    this.sBD,
    this.sCR,
    this.sDG,
    this.sEK,
    this.sGD,
    this.sHP,
    this.sLE,
    this.sLL,
    this.sOS,
    this.sRD,
    this.sSP,
    this.sTN,
    this.sYP,
    this.sZL,
    this.tHB,
    this.tJS,
    this.tMT,
    this.tND,
    this.tOP,
    this.tRY,
    this.tTD,
    this.tVD,
    this.tWD,
    this.tZS,
    this.uAH,
    this.uGX,
    this.uYU,
    this.uZS,
    this.vES,
    this.vND,
    this.vUV,
    this.wST,
    this.xAF,
    this.xCD,
    this.xDR,
    this.xOF,
    this.xPF,
    this.yER,
    this.zAR,
    this.zMW,
    this.zWL});

  CurrancyReta.fromJson(Map<String, dynamic> json) {
    uSD = double.parse(json['USD'].toString());
    aED = double.parse(json['AED'].toString());
    aFN = double.parse(json['AFN'].toString());
    aLL = double.parse(json['ALL'].toString());
    aMD = double.parse(json['AMD'].toString());
    aNG = double.parse(json['ANG'].toString());
    aOA = double.parse(json['AOA'].toString());
    aRS = double.parse(json['ARS'].toString());
    aUD = double.parse(json['AUD'].toString());
    aWG = double.parse(json['AWG'].toString());
    aZN = double.parse(json['AZN'].toString());
    bAM = double.parse(json['BAM'].toString());
    bBD = double.parse(json['BBD'].toString());
    bDT = double.parse(json['BDT'].toString());
    bGN = double.parse(json['BGN'].toString());
    bHD = double.parse(json['BHD'].toString());
    bIF = double.parse(json['BIF'].toString());
    bMD = double.parse(json['BMD'].toString());
    bND = double.parse(json['BND'].toString());
    bOB = double.parse(json['BOB'].toString());
    bRL = double.parse(json['BRL'].toString());
    bSD = double.parse(json['BSD'].toString());
    bTN = double.parse(json['BTN'].toString());
    bWP = double.parse(json['BWP'].toString());
    bYN = double.parse(json['BYN'].toString());
    bZD = double.parse(json['BZD'].toString());
    cAD = double.parse(json['CAD'].toString());
    cDF = double.parse(json['CDF'].toString());
    cHF = double.parse(json['CHF'].toString());
    cLP = double.parse(json['CLP'].toString());
    cNY = double.parse(json['CNY'].toString());
    cOP = double.parse(json['COP'].toString());
    cRC = double.parse(json['CRC'].toString());
    cUP = double.parse(json['CUP'].toString());
    cVE = double.parse(json['CVE'].toString());
    cZK = double.parse(json['CZK'].toString());
    dJF = double.parse(json['DJF'].toString());
    dKK = double.parse(json['DKK'].toString());
    dOP = double.parse(json['DOP'].toString());
    dZD = double.parse(json['DZD'].toString());
    eGP = double.parse(json['EGP'].toString());
    eRN = double.parse(json['ERN'].toString());
    eTB = double.parse(json['ETB'].toString());
    eUR = double.parse(json['EUR'].toString());
    fJD = double.parse(json['FJD'].toString());
    fKP = double.parse(json['FKP'].toString());
    fOK = double.parse(json['FOK'].toString());
    gBP = double.parse(json['GBP'].toString());
    gEL = double.parse(json['GEL'].toString());
    gGP = double.parse(json['GGP'].toString());
    gHS = double.parse(json['GHS'].toString());
    gIP = double.parse(json['GIP'].toString());
    gMD = double.parse(json['GMD'].toString());
    gNF = double.parse(json['GNF'].toString());
    gTQ = double.parse(json['GTQ'].toString());
    gYD = double.parse(json['GYD'].toString());
    hKD = double.parse(json['HKD'].toString());
    hNL = double.parse(json['HNL'].toString());
    hRK = double.parse(json['HRK'].toString());
    hTG = double.parse(json['HTG'].toString());
    hUF = double.parse(json['HUF'].toString());
    iDR = double.parse(json['IDR'].toString());
    iLS = double.parse(json['ILS'].toString());
    iMP = double.parse(json['IMP'].toString());
    iNR = double.parse(json['INR'].toString());
    iQD = double.parse(json['IQD'].toString());
    iRR = double.parse(json['IRR'].toString());
    iSK = double.parse(json['ISK'].toString());
    jEP = double.parse(json['JEP'].toString());
    jMD = double.parse(json['JMD'].toString());
    jOD = double.parse(json['JOD'].toString());
    jPY = double.parse(json['JPY'].toString());
    kES = double.parse(json['KES'].toString());
    kGS = double.parse(json['KGS'].toString());
    kHR = double.parse(json['KHR'].toString());
    kID = double.parse(json['KID'].toString());
    kMF = double.parse(json['KMF'].toString());
    kRW = double.parse(json['KRW'].toString());
    kWD = double.parse(json['KWD'].toString());
    kYD = double.parse(json['KYD'].toString());
    kZT = double.parse(json['KZT'].toString());
    lAK = double.parse(json['LAK'].toString());
    lBP = double.parse(json['LBP'].toString());
    lKR = double.parse(json['LKR'].toString());
    lRD = double.parse(json['LRD'].toString());
    lSL = double.parse(json['LSL'].toString());
    lYD = double.parse(json['LYD'].toString());
    mAD = double.parse(json['MAD'].toString());
    mDL = double.parse(json['MDL'].toString());
    mGA = double.parse(json['MGA'].toString());
    mKD = double.parse(json['MKD'].toString());
    mMK = double.parse(json['MMK'].toString());
    mNT = double.parse(json['MNT'].toString());
    mOP = double.parse(json['MOP'].toString());
    mRU = double.parse(json['MRU'].toString());
    mUR = double.parse(json['MUR'].toString());
    mVR = double.parse(json['MVR'].toString());
    mWK = double.parse(json['MWK'].toString());
    mXN = double.parse(json['MXN'].toString());
    mYR = double.parse(json['MYR'].toString());
    mZN = double.parse(json['MZN'].toString());
    nAD = double.parse(json['NAD'].toString());
    nGN = double.parse(json['NGN'].toString());
    nIO = double.parse(json['NIO'].toString());
    nOK = double.parse(json['NOK'].toString());
    nPR = double.parse(json['NPR'].toString());
    nZD = double.parse(json['NZD'].toString());
    oMR = double.parse(json['OMR'].toString());
    pAB = double.parse(json['PAB'].toString());
    pEN = double.parse(json['PEN'].toString());
    pGK = double.parse(json['PGK'].toString());
    pHP = double.parse(json['PHP'].toString());
    pKR = double.parse(json['PKR'].toString());
    pLN = double.parse(json['PLN'].toString());
    pYG = double.parse(json['PYG'].toString());
    qAR = double.parse(json['QAR'].toString());
    rON = double.parse(json['RON'].toString());
    rSD = double.parse(json['RSD'].toString());
    rUB = double.parse(json['RUB'].toString());
    rWF = double.parse(json['RWF'].toString());
    sAR = double.parse(json['SAR'].toString());
    sBD = double.parse(json['SBD'].toString());
    sCR = double.parse(json['SCR'].toString());
    sDG = double.parse(json['SDG'].toString());
    sEK = double.parse(json['SEK'].toString());
    sGD = double.parse(json['SGD'].toString());
    sHP = double.parse(json['SHP'].toString());
    sLE = double.parse(json['SLE'].toString());
    sLL = double.parse(json['SLL'].toString());
    sOS = double.parse(json['SOS'].toString());
    sRD = double.parse(json['SRD'].toString());
    sSP = double.parse(json['SSP'].toString());
    sTN = double.parse(json['STN'].toString());
    sYP = double.parse(json['SYP'].toString());
    sZL = double.parse(json['SZL'].toString());
    tHB = double.parse(json['THB'].toString());
    tJS = double.parse(json['TJS'].toString());
    tMT = double.parse(json['TMT'].toString());
    tND = double.parse(json['TND'].toString());
    tOP = double.parse(json['TOP'].toString());
    tRY = double.parse(json['TRY'].toString());
    tTD = double.parse(json['TTD'].toString());
    tVD = double.parse(json['TVD'].toString());
    tWD = double.parse(json['TWD'].toString());
    tZS = double.parse(json['TZS'].toString());
    uAH = double.parse(json['UAH'].toString());
    uGX = double.parse(json['UGX'].toString());
    uYU = double.parse(json['UYU'].toString());
    uZS = double.parse(json['UZS'].toString());
    vES = double.parse(json['VES'].toString());
    vND = double.parse(json['VND'].toString());
    vUV = double.parse(json['VUV'].toString());
    wST = double.parse(json['WST'].toString());
    xAF = double.parse(json['XAF'].toString());
    xCD = double.parse(json['XCD'].toString());
    xDR = double.parse(json['XDR'].toString());
    xOF = double.parse(json['XOF'].toString());
    xPF = double.parse(json['XPF'].toString());
    yER = double.parse(json['YER'].toString());
    zAR = double.parse(json['ZAR'].toString());
    zMW = double.parse(json['ZMW'].toString());
    zWL = double.parse(json['ZWL'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USD'] = this.uSD;
    data['AED'] = this.aED;
    data['AFN'] = this.aFN;
    data['ALL'] = this.aLL;
    data['AMD'] = this.aMD;
    data['ANG'] = this.aNG;
    data['AOA'] = this.aOA;
    data['ARS'] = this.aRS;
    data['AUD'] = this.aUD;
    data['AWG'] = this.aWG;
    data['AZN'] = this.aZN;
    data['BAM'] = this.bAM;
    data['BBD'] = this.bBD;
    data['BDT'] = this.bDT;
    data['BGN'] = this.bGN;
    data['BHD'] = this.bHD;
    data['BIF'] = this.bIF;
    data['BMD'] = this.bMD;
    data['BND'] = this.bND;
    data['BOB'] = this.bOB;
    data['BRL'] = this.bRL;
    data['BSD'] = this.bSD;
    data['BTN'] = this.bTN;
    data['BWP'] = this.bWP;
    data['BYN'] = this.bYN;
    data['BZD'] = this.bZD;
    data['CAD'] = this.cAD;
    data['CDF'] = this.cDF;
    data['CHF'] = this.cHF;
    data['CLP'] = this.cLP;
    data['CNY'] = this.cNY;
    data['COP'] = this.cOP;
    data['CRC'] = this.cRC;
    data['CUP'] = this.cUP;
    data['CVE'] = this.cVE;
    data['CZK'] = this.cZK;
    data['DJF'] = this.dJF;
    data['DKK'] = this.dKK;
    data['DOP'] = this.dOP;
    data['DZD'] = this.dZD;
    data['EGP'] = this.eGP;
    data['ERN'] = this.eRN;
    data['ETB'] = this.eTB;
    data['EUR'] = this.eUR;
    data['FJD'] = this.fJD;
    data['FKP'] = this.fKP;
    data['FOK'] = this.fOK;
    data['GBP'] = this.gBP;
    data['GEL'] = this.gEL;
    data['GGP'] = this.gGP;
    data['GHS'] = this.gHS;
    data['GIP'] = this.gIP;
    data['GMD'] = this.gMD;
    data['GNF'] = this.gNF;
    data['GTQ'] = this.gTQ;
    data['GYD'] = this.gYD;
    data['HKD'] = this.hKD;
    data['HNL'] = this.hNL;
    data['HRK'] = this.hRK;
    data['HTG'] = this.hTG;
    data['HUF'] = this.hUF;
    data['IDR'] = this.iDR;
    data['ILS'] = this.iLS;
    data['IMP'] = this.iMP;
    data['INR'] = this.iNR;
    data['IQD'] = this.iQD;
    data['IRR'] = this.iRR;
    data['ISK'] = this.iSK;
    data['JEP'] = this.jEP;
    data['JMD'] = this.jMD;
    data['JOD'] = this.jOD;
    data['JPY'] = this.jPY;
    data['KES'] = this.kES;
    data['KGS'] = this.kGS;
    data['KHR'] = this.kHR;
    data['KID'] = this.kID;
    data['KMF'] = this.kMF;
    data['KRW'] = this.kRW;
    data['KWD'] = this.kWD;
    data['KYD'] = this.kYD;
    data['KZT'] = this.kZT;
    data['LAK'] = this.lAK;
    data['LBP'] = this.lBP;
    data['LKR'] = this.lKR;
    data['LRD'] = this.lRD;
    data['LSL'] = this.lSL;
    data['LYD'] = this.lYD;
    data['MAD'] = this.mAD;
    data['MDL'] = this.mDL;
    data['MGA'] = this.mGA;
    data['MKD'] = this.mKD;
    data['MMK'] = this.mMK;
    data['MNT'] = this.mNT;
    data['MOP'] = this.mOP;
    data['MRU'] = this.mRU;
    data['MUR'] = this.mUR;
    data['MVR'] = this.mVR;
    data['MWK'] = this.mWK;
    data['MXN'] = this.mXN;
    data['MYR'] = this.mYR;
    data['MZN'] = this.mZN;
    data['NAD'] = this.nAD;
    data['NGN'] = this.nGN;
    data['NIO'] = this.nIO;
    data['NOK'] = this.nOK;
    data['NPR'] = this.nPR;
    data['NZD'] = this.nZD;
    data['OMR'] = this.oMR;
    data['PAB'] = this.pAB;
    data['PEN'] = this.pEN;
    data['PGK'] = this.pGK;
    data['PHP'] = this.pHP;
    data['PKR'] = this.pKR;
    data['PLN'] = this.pLN;
    data['PYG'] = this.pYG;
    data['QAR'] = this.qAR;
    data['RON'] = this.rON;
    data['RSD'] = this.rSD;
    data['RUB'] = this.rUB;
    data['RWF'] = this.rWF;
    data['SAR'] = this.sAR;
    data['SBD'] = this.sBD;
    data['SCR'] = this.sCR;
    data['SDG'] = this.sDG;
    data['SEK'] = this.sEK;
    data['SGD'] = this.sGD;
    data['SHP'] = this.sHP;
    data['SLE'] = this.sLE;
    data['SLL'] = this.sLL;
    data['SOS'] = this.sOS;
    data['SRD'] = this.sRD;
    data['SSP'] = this.sSP;
    data['STN'] = this.sTN;
    data['SYP'] = this.sYP;
    data['SZL'] = this.sZL;
    data['THB'] = this.tHB;
    data['TJS'] = this.tJS;
    data['TMT'] = this.tMT;
    data['TND'] = this.tND;
    data['TOP'] = this.tOP;
    data['TRY'] = this.tRY;
    data['TTD'] = this.tTD;
    data['TVD'] = this.tVD;
    data['TWD'] = this.tWD;
    data['TZS'] = this.tZS;
    data['UAH'] = this.uAH;
    data['UGX'] = this.uGX;
    data['UYU'] = this.uYU;
    data['UZS'] = this.uZS;
    data['VES'] = this.vES;
    data['VND'] = this.vND;
    data['VUV'] = this.vUV;
    data['WST'] = this.wST;
    data['XAF'] = this.xAF;
    data['XCD'] = this.xCD;
    data['XDR'] = this.xDR;
    data['XOF'] = this.xOF;
    data['XPF'] = this.xPF;
    data['YER'] = this.yER;
    data['ZAR'] = this.zAR;
    data['ZMW'] = this.zMW;
    data['ZWL'] = this.zWL;
    return data;
  }
}
// To parse this JSON data, do
//
//     final flagModel = flagModelFromJson(jsonString);

import 'dart:convert';

List<FlagModel> flagModelFromJson(String str) => List<FlagModel>.from(json.decode(str).map((x) => FlagModel.fromJson(x)));

String flagModelToJson(List<FlagModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlagModel {
  String? name;
  String? flag;

  FlagModel({
    this.name,
    this.flag,
  });

  factory FlagModel.fromJson(Map<String, dynamic> json) => FlagModel(
    name: json["name"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "flag": flag,
  };
}
import 'dart:convert';

import 'package:gst_calculator/calculator/model/country_model.dart';
import 'package:http/http.dart' as http;
class Api_helper
{
  static final Api_helper api_helper = Api_helper();

    Future<CountryModel> getApi()
    async {
      String? like = "https://groworbit.in/toolscalculter/api/toolscalc/country/";

      var responce = await http.get(Uri.parse(like),
      headers: {"app_secret":"wQSLrTQtTJwvU26v"});

      
      var json = jsonDecode(responce.body);
      print("-----------${json}");
      CountryModel data = CountryModel.fromJson(json);
      return data;
    }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/calculator_controller.dart';

class MoneyCashCounter extends StatefulWidget {
  @override
  _MoneyCashCounterState createState() => _MoneyCashCounterState();
}

class _MoneyCashCounterState extends State<MoneyCashCounter> {
  Calculator_Controller controller = Get.find();
  int total = 0;

  // Initialize text editing controllers for each denomination
  Map<int, TextEditingController> textEditingControllerMap = {};
  int notesTotal = 0;
  @override
  void initState() {
    super.initState();
    // Initialize text editing controllers with initial values
    controller.notes.forEach((denomination, count) {
      textEditingControllerMap[denomination] =
          TextEditingController(text: count == 0 ? '' : count.toString());
    });
    notesTotal = 0;
    controller.notes.keys.forEach((denomination) {
      notesTotal += denomination ;
    });
  }
  int newTotal =0 ;

  void calculateTotal() {
   newTotal = 0;
    controller.notes.forEach((denomination, count) {
      newTotal += denomination * count;
      print("newTotal${newTotal}");
    });


    setState(() {
      total = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  controller.notes[denomination] = 0;
                });
                controller.notes.forEach((denomination, _) {
                  textEditingControllerMap[denomination] =
                      TextEditingController(text: "");
                });
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Notes Total:",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "${notesTotal}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Grand Total:",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "${total}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 67.h,
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
                          int denomination =
                          controller.notes.keys.elementAt(index);
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
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text('$denomination')),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(child: Text("x")),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: SizedBox(
                                          height: 4.h,
                                          width: 25.w,
                                          child: Center(
                                            child: TextField(
                                              style: TextStyle(fontSize: 12),
                                              cursorHeight: 2.h,
                                              keyboardType:
                                              TextInputType.number,
                                              controller:
                                              textEditingControllerMap[
                                              denomination],
                                              onChanged: (v) {
                                                if (v.length > 9) {
                                                  // Limiting the input to 9 digits
                                                  textEditingControllerMap[denomination]!.text = v.substring(0, 9);
                                                  textEditingControllerMap[denomination]!.selection = TextSelection.collapsed(offset: 9);
                                                }
                                                setState(() {
                                                  controller.notes[denomination] = int.tryParse(v) ?? 0;
                                                  calculateTotal();
                                                });
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0),
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0),
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
                                      Expanded(
                                          flex: 1,
                                          child: Center(child: Text("="))),
                                      Expanded(
                                          flex: 3,
                                          child: Center(
                                              child: Text(
                                                  "${controller.notes[denomination]! * denomination}"))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/calculator_controller.dart';

class Currency_Convert_Screen extends StatefulWidget {
  const Currency_Convert_Screen({super.key});

  @override
  State<Currency_Convert_Screen> createState() => _Currency_Convert_ScreenState();
}

class _Currency_Convert_ScreenState extends State<Currency_Convert_Screen> {
  Calculator_Controller controller = Get.find();

  @override
  void initState() {
    controller.apiLoad();
    super.initState();
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
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                "${controller.data!.data![index].name}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          );
                        },
                        itemCount: controller.data!.data!.length,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Column(children: [
                          Text('${controller.flagJsonList![index].name}'),
                          Image.network("${controller.flagJsonList![index].flag}"),
                        ],);
                      },itemCount: controller.flagJsonList!.length,),
                    ),
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
}


   
