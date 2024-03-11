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
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InstalController extends GetxController{


  NativeAd? nativeAd;
  RxBool isLoading=true.obs;

  void loadNativeAd()
  {

    nativeAd = NativeAd(
      adUnitId: '/6499/example/native',
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          print('============================= $NativeAd loaded. =====================================');
          update();
          isLoading.value=false;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$NativeAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$NativeAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$NativeAd onAdClosed.'),
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: Colors.white12,
        callToActionTextStyle: NativeTemplateTextStyle(
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.black38,
          backgroundColor: Colors.white70,
        ),
      ),
    )..load();
  }
}
import 'package:gallary_app/flore_databse/dao/databaseDAO.dart';
import 'package:gallary_app/utils/api_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../model/version_model.dart';
import '../utils/ads_helper.dart';
import 'instal_controller.dart';

class Version_Controller extends GetxController {
  InstalController installController = Get.put(InstalController());
  RxInt enable = 1.obs;
  RxBool adsnameb = false.obs;
  RxBool keybool = false.obs;
  RxInt bannereeneble = 0.obs;
  RxBool islodin = false.obs;
  int i = 0;
  int j = 0;
  String? name = "APP_OPEN";
  String adkeyword = "Google";
  VersionModel? data;
  late AppLifecycleReactor _appLifecycleReactor;
  VersionModelDao? dao;
  List<AdChield> allVersions =[];

  Future versionload(VersionModelDao deo) async {
    islodin.value = true;

    dao=deo;
    await Api_helper.api_helper.version().then((value) async {
      data = value;

      // dao.insertEmployee(data);

      for (i = 0; i < data!.data!.adMaster!.length; i++) {
        for (j = 0; j < data!.data!.adMaster![i].adChield!.length; j++) {
          print("==================================");
          dao!.insertVersionModel(AdChield(
              adname: data!.data!.adMaster![i].admName,
              count: data!.data!.adMaster![i].count,
              admaenable: data!.data!.adMaster![i].enable,
              id: data!.data!.adMaster![i].adChield![j].id,
              enable: data!.data!.adMaster![i].adChield![j].enable,
              adKeyword: data!.data!.adMaster![i].adChield![j].adKeyword,
              adToken: data!.data!.adMaster![i].adChield![j].adToken,
              tag: data!.data!.adMaster![i].adChield![j].tag,
              versionAdMastersId: data!.data!.adMaster![i].adChield![j].versionAdMastersId,
              versionId: data!.data!.adMaster![i].adChield![j].versionId,
          ));

          print("===================== $allVersions =========================================");
        }
      }
      allVersions = await dao!.getAllVersions();
      // for (i = 0; i < data!.data!.adMaster!.length; i++) {
      //   if (name == data!.data!.adMaster![i].admName) {
      //     if (data!.data!.adMaster![i].enable == 1) {
      //       for (j = 0; j < data!.data!.adMaster![i].adChield!.length; j++) {
      //         if (name == data!.data!.adMaster![i].admName) {
      //           if (adkeyword ==
      //               data!.data!.adMaster![i].adChield![j].adKeyword) {
      //             if (data!.data!.adMaster![i].adChield![j].enable == 1) {
      //               keybool.value = true;
      //               Ads_helper.ads_helper.loadBannerAd3();
      //               Ads_helper.ads_helper.loadInterstitialAd();
      //               installController.loadNativeAd();
      //
      //               Ads_helper.ads_helper.loadAppOpenAd();
      //               Ads_helper ads_helper = Ads_helper()
      //                 ..loadAppOpenAd();
      //               _appLifecycleReactor =
      //                   AppLifecycleReactor(ads_helper: ads_helper);
      //               _appLifecycleReactor.listenToAppStateChanges();
      //
      //               print(
      //                   "==================== ${keybool} ==============================");
      //             }
      //           }
      //         }
      //       }
      //     }
      //   }
      // }
      islodin.value = false;
    },
    );
  }
}// import 'package:get/get.dart';
//
// import '../entity/employee.dart';
//
// class Floor_Controller extends GetxController{
//
//   RxList listEmployee =<Employee>[].obs;
// }
import 'dart:async';
import 'package:floor/floor.dart';
import '../../model/version_model.dart';

@dao
abstract class VersionModelDao {
  @Query('SELECT * FROM AdChield')
  Future<List<AdChield>> getAllVersions();

  @insert
  Future<void> insertVersionModel(AdChield versionModel);
}
//
// import 'package:floor/floor.dart';
// @entity
// class Employee
// {
//   @PrimaryKey(autoGenerate: true)
//   final int? id;
//
//   String? firstName,lastName,email;
//
//   Employee({this.id,this.email, this.lastName, this.firstName});
// }
// To parse this JSON data, do
//
//     final versionModel = versionModelFromJson(jsonString);

import 'dart:convert';

import 'package:floor/floor.dart';

VersionModel versionModelFromJson(String str) => VersionModel.fromJson(json.decode(str));

String versionModelToJson(VersionModel data) => json.encode(data.toJson());

class VersionModel {
  int? status;
  String? message;
  Data? data;

  VersionModel({
    this.status,
    this.message,
    this.data,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Id? id;
  String? title;
  String? code;
  String? features;
  List<AdMaster>? adMaster;
  int? enabled;
  int? isForce;
  int? isHuawei;
  int? adsLoadTime;
  int? adsShowTime;
  int? splashInappDiaog;
  int? isAi;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? users;

  Data({
    this.id,
    this.title,
    this.code,
    this.features,
    this.adMaster,
    this.enabled,
    this.isForce,
    this.isHuawei,
    this.adsLoadTime,
    this.adsShowTime,
    this.splashInappDiaog,
    this.isAi,
    this.createdAt,
    this.updatedAt,
    this.users,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: idValues.map[json["_id"]]!,
    title: json["title"],
    code: json["code"],
    features: json["features"],
    adMaster: json["ad_master"] == null ? [] : List<AdMaster>.from(json["ad_master"]!.map((x) => AdMaster.fromJson(x))),
    enabled: json["enabled"],
    isForce: json["is_force"],
    isHuawei: json["is_huawei"],
    adsLoadTime: json["ads_load_time"],
    adsShowTime: json["ads_show_time"],
    splashInappDiaog: json["splash_inapp_diaog"],
    isAi: json["is_AI"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    users: json["users"],
  );

  Map<String, dynamic> toJson() => {
    "_id": idValues.reverse[id],
    "title": title,
    "code": code,
    "features": features,
    "ad_master": adMaster == null ? [] : List<dynamic>.from(adMaster!.map((x) => x.toJson())),
    "enabled": enabled,
    "is_force": isForce,
    "is_huawei": isHuawei,
    "ads_load_time": adsLoadTime,
    "ads_show_time": adsShowTime,
    "splash_inapp_diaog": splashInappDiaog,
    "is_AI": isAi,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "users": users,
  };
}

class AdMaster {
  String? id;
  String? admName;
  int? count;
  int? enable;
  Id? versionId;
  List<AdChield>? adChield;

  AdMaster({
    this.id,
    this.admName,
    this.count,
    this.enable,
    this.versionId,
    this.adChield,
  });

  factory AdMaster.fromJson(Map<String, dynamic> json) => AdMaster(
    id: json["_id"],
    admName: json["adm_name"],
    count: json["count"],
    enable: json["enable"],
    versionId: idValues.map[json["version_Id"]]!,
    adChield: json["ad_chield"] == null ? [] : List<AdChield>.from(json["ad_chield"]!.map((x) => AdChield.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "adm_name": admName,
    "count": count,
    "enable": enable,
    "version_Id": idValues.reverse[versionId],
    "ad_chield": adChield == null ? [] : List<dynamic>.from(adChield!.map((x) => x.toJson())),
  };
}
@entity
class AdChield {
  @PrimaryKey(autoGenerate: true)
  int? sId;
  String? id;
  String? adToken;
  String? adKeyword;
  int? enable;
  String? versionAdMastersId;
  Id? versionId;
  String? tag;

  String? adname;
  int? count;
  int? admaenable;

  AdChield({
    this.id,

    this.adToken,
    this.adKeyword,
    this.enable,
    this.versionAdMastersId,
    this.versionId,
    this.tag,
    this.admaenable,
    this.adname,
    this.count
  });

  factory AdChield.fromJson(Map<String, dynamic> json) => AdChield(
    id: json["_id"],
    adToken: json["ad_token"],
    adKeyword: json["ad_keyword"]!,
    enable: json["enable"],
    versionAdMastersId: json["version_ad_masters_Id"],
    versionId: idValues.map[json["version_Id"]]!,
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ad_token": adToken,
    "ad_keyword": adKeyword,
    "enable": enable,
    "version_ad_masters_Id": versionAdMastersId,
    "version_Id": idValues.reverse[versionId],
    "tag": tag,
  };
}

enum AdKeyword {
  ALTERNATIVE,
  CUSTOM,
  FACEBOOK,
  GOOGLE
}

final adKeywordValues = EnumValues({
  "ALTERNATIVE": AdKeyword.ALTERNATIVE,
  "CUSTOM": AdKeyword.CUSTOM,
  "Facebook": AdKeyword.FACEBOOK,
  "Google": AdKeyword.GOOGLE
});

enum Id {
  THE_65_DEB61_FA0_B438790864_BE7_D
}

final idValues = EnumValues({
  "65deb61fa0b438790864be7d": Id.THE_65_DEB61_FA0_B438790864_BE7_D
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
// To parse this JSON data, do
//
//     final remoteConfig = remoteConfigFromJson(jsonString);

import 'dart:convert';

RemoteConfigModel remoteConfigFromJson(String str) => RemoteConfigModel.fromJson(json.decode(str));

String remoteConfigToJson(RemoteConfigModel data) => json.encode(data.toJson());

class RemoteConfigModel {
  String? baseUrl;
  String? appSecret;

  RemoteConfigModel({
    this.baseUrl,
    this.appSecret,
  });

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) => RemoteConfigModel(
    baseUrl: json["base_url"],
    appSecret: json["app_secret"],
  );

  Map<String, dynamic> toJson() => {
    "base_url": baseUrl,
    "app_secret": appSecret,
  };
}
// To parse this JSON data, do
//
//     final instalModel = instalModelFromJson(jsonString);

import 'dart:convert';

InstalModel instalModelFromJson(String str) => InstalModel.fromJson(json.decode(str));

String instalModelToJson(InstalModel data) => json.encode(data.toJson());

class InstalModel {
  int? status;
  String? message;
  Data? data;

  InstalModel({
    this.status,
    this.message,
    this.data,
  });

  factory InstalModel.fromJson(Map<String, dynamic> json) => InstalModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? title;
  String? code;
  String? features;
  List<String>? adMaster;
  int? enabled;
  int? isForce;
  int? isHuawei;
  int? adsLoadTime;
  int? adsShowTime;
  int? splashInappDiaog;
  int? isAi;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? users;

  Data({
    this.id,
    this.title,
    this.code,
    this.features,
    this.adMaster,
    this.enabled,
    this.isForce,
    this.isHuawei,
    this.adsLoadTime,
    this.adsShowTime,
    this.splashInappDiaog,
    this.isAi,
    this.createdAt,
    this.updatedAt,
    this.users,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    title: json["title"],
    code: json["code"],
    features: json["features"],
    adMaster: json["ad_master"] == null ? [] : List<String>.from(json["ad_master"]!.map((x) => x)),
    enabled: json["enabled"],
    isForce: json["is_force"],
    isHuawei: json["is_huawei"],
    adsLoadTime: json["ads_load_time"],
    adsShowTime: json["ads_show_time"],
    splashInappDiaog: json["splash_inapp_diaog"],
    isAi: json["is_AI"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    users: json["users"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "code": code,
    "features": features,
    "ad_master": adMaster == null ? [] : List<dynamic>.from(adMaster!.map((x) => x)),
    "enabled": enabled,
    "is_force": isForce,
    "is_huawei": isHuawei,
    "ads_load_time": adsLoadTime,
    "ads_show_time": adsShowTime,
    "splash_inapp_diaog": splashInappDiaog,
    "is_AI": isAi,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "users": users,
  };
}
import 'package:flutter/material.dart';
import 'package:gallary_app/utils/ads_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

import '../../controller/instal_controller.dart';

class add_Screen extends StatefulWidget {
  const add_Screen({super.key});

  @override
  State<add_Screen> createState() => _add_ScreenState();
}

class _add_ScreenState extends State<add_Screen> {
  InstalController installController = Get.put(InstalController());

  @override
  void initState() {
    Ads_helper.ads_helper.loadBannerAd();
    Ads_helper.ads_helper.loadInterstitialAd();
    installController.loadNativeAd();
    Ads_helper.ads_helper.loadRewardAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ads Screen",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "====== Google Ads ======",
                style: TextStyle(color: Colors.black),
              ),
              Container(
                height: 170,
                child: AdWidget(
                  ad: Ads_helper.ads_helper.bannerAd!,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Ads_helper.ads_helper.interstitialAd!.show();
                  Ads_helper.ads_helper.loadInterstitialAd();
                },
                child: Text(
                  "Interstitial Ads",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Ads_helper.ads_helper.rewardedAd!.show(
                      onUserEarnedReward: (ad, reward) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$reward"),
                          ),
                        );
                      },
                    );
                    Ads_helper.ads_helper.loadRewardAd();
                  },
                  child: Text(
                    "Reward Ads",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => installController.isLoading.value == false
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {
                          installController.loadNativeAd();
                        },
                        child: Text(
                          "NativeAd",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Container(),
              ),
              Text(
                "=========== AppLovin ===========",
                style: TextStyle(color: Colors.black),
              ),
              // Container(
              //   height: 170,
              //   child: AdWidget(
              //     ad: Ads_helper.ads_helper.bannerAd!,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/controller/instal_controller.dart';
import 'package:gallary_app/model/msglist_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../controller/imogi_controller.dart';
import '../../model/imogi_model.dart';

class Bottom_Sheet extends StatefulWidget {
  const Bottom_Sheet({super.key});

  @override
  State<Bottom_Sheet> createState() => _Bottom_SheetState();
}

class _Bottom_SheetState extends State<Bottom_Sheet> {
  bool apiCalled = false;
  late BetterPlayerController betterPlayerController;
  Imogi_Controller controller = Get.put(Imogi_Controller());
  TextEditingController txtmsg = TextEditingController();
  InstalController installController = Get.put(InstalController());
  String? msg;
  List<Model> msglist = [];
  late DateTime screenStartTime;
  late Timer timer;

  //
  Future<void> checkApiCallStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasApiBeenCalled = prefs.getBool('apiCalled') ?? false;

    if (!hasApiBeenCalled) {

      await fetchData();

      prefs.setBool('apiCalled', true);
    }

    setState(() {
      apiCalled = hasApiBeenCalled;
    });
  }

  Future<void> fetchData() async {
    String? like =
        "https://groworbit.in/testadmin/api/testapp/version/installtrack";
    var response = await http.post(Uri.parse(like),
        headers: {"app_secret": "wQSLrTQtTJwvU26v"},
        body: {"app_version": "1", "app_old_version": "10"});
    if (response.statusCode == 200) {
      print(
          '======================= install ======================================');
      var json = jsonDecode(response.body);
      print(response.statusCode == 200);
    } else {
      var json = jsonDecode(response.body);
      print(response.statusCode == 200);
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkApiCallStatus();
    controller.getapi();
    controller.generaterendomnumber();
    screenStartTime = DateTime.now();
    // Set up a timer to update the screen every second
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {}); // Trigger a rebuild to update the displayed time
    });

    betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        fit: BoxFit.cover,
        controlsConfiguration: BetterPlayerControlsConfiguration(
            // Customize controls if needed
            ),
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        'https://www.groworbit.in/videoapp/images/video/v_1698472254541_Lisa%20Aamn%20Stream%204.mp4',
      ),
    );

    // betterPlayerController = BetterPlayerController(betterPlayerConfiguration);

    betterPlayerController!.setControlsAlwaysVisible(false);
    betterPlayerController!.setOverriddenAspectRatio(0.3);
    betterPlayerController!.setControlsVisibility(false);
    betterPlayerController!.setControlsEnabled(false);
    // betterPlayerController!.addEventsListener(_handleEvent);
    // betterPlayerController!.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration elapsedTime = DateTime.now().difference(screenStartTime);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BetterPlayer(
              controller: betterPlayerController,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 6.2.h,
                          child: ClipOval(
                            child: Image.asset("assets/images/s1.jpg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Szekeres Dalma",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Icon(
                                Icons.star,
                                color: Colors.pink.shade400,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 3.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white10,
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheet(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.10),
                                    builder: (BuildContext context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5.0, sigmaY: 5.0),
                                        child: Container(
                                          height: 52.h,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 1.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          Colors.grey.shade700),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 19,
                                                    left: 20,
                                                    right: 20),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 3.4.h,
                                                    ),
                                                    SizedBox(
                                                      height: 9.h,
                                                      child: Container(
                                                        height: 10.h,
                                                        width: 20.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 1),
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/s1.jpg"),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Szekeres Dalma",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Colors.pink
                                                                  .shade400,
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 70),
                                                          child: Container(
                                                            height: 3.3.h,
                                                            width: 15.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .white24,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "USA",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 57,
                                                    ),
                                                    Container(
                                                      height: 6.h,
                                                      width: 13.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .pink.shade400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(70),
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons
                                                              .person_add_alt_1,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text(
                                                    "Call m baby today i m alone",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      letterSpacing: 0.5,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Icon(
                                                    Icons.favorite_sharp,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 28,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  Text(
                                                    "1.3k",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        letterSpacing: 0.2,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  Text(
                                                    "49.6k",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      letterSpacing: 0.2,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  Text(
                                                    "5",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      letterSpacing: 0.2,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 18.w,
                                                  ),
                                                  Text(
                                                    "Followers",
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 10,
                                                      letterSpacing: 0.5,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  Text(
                                                    "Following",
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 10,
                                                      letterSpacing: 0.5,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 13.w,
                                                  ),
                                                  Text(
                                                    "Post",
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 10,
                                                      letterSpacing: 0.5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 28,
                                              ),
                                              Row(
                                                children: [
                                                  Spacer(),
                                                  Container(
                                                    height: 5.h,
                                                    width: 43.w,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.pink.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.card_giftcard,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        Text(
                                                          "Send Gift",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    height: 5.h,
                                                    width: 43.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.maps_ugc,
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        Text(
                                                          "Message",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    height: 7.5.h,
                                                    width: 15.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/s11.jpg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3.4.w,
                                                  ),
                                                  Container(
                                                    height: 7.5.h,
                                                    width: 15.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/s10.jpg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3.4.w,
                                                  ),
                                                  Container(
                                                    height: 7.5.h,
                                                    width: 15.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/s9.jpg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3.4.w,
                                                  ),
                                                  Container(
                                                    height: 7.5.h,
                                                    width: 15.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/s6.jpg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3.4.w,
                                                  ),
                                                  Container(
                                                    height: 7.5.h,
                                                    width: 15.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/s5.jpg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
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
                                  width: 10,
                                ),
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  "Follow",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SizedBox(
                            height: 5.h,
                            child: ClipOval(
                              child: Image.asset("assets/images/s3.jpg"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: SizedBox(
                            height: 5.h,
                            child: ClipOval(
                              child: Image.asset("assets/images/s4.jpg"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: SizedBox(
                            height: 5.h,
                            child: ClipOval(
                              child: Image.asset("assets/images/s5.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 3.3.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.red.shade800,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Live",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 3.3.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.visibility,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Obx(
                          () => Text(
                            "${controller.rendomnm.value}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 3.3.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade900,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "6M",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.red.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "${formatDuration(elapsedTime)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 38.h,
                width: 80.w,
                child: ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) {
                    int indexmsg = msglist.length - 1 - index;

                    return Container(
                      height: 8.h,
                      width: 8.w,
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          msglist[indexmsg].isgift == false
                              ? Expanded(
                                  child: Text(
                                  "${msglist[indexmsg].text}",
                                  style: TextStyle(color: Colors.white),
                                ))
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      "https://likeme.live/likeme/uploads/images/${msglist[indexmsg].img}",
                                      height: 5.h,
                                      width: 10.w,
                                    ),
                                    Text(
                                      "${msglist[indexmsg].diamond}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    );
                  },
                  itemCount: msglist.length,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 600,
              left: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: FutureBuilder(
                    future: controller.getapi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        ImogiModel? data = snapshot.data;
                        return Container(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Model d1 = Model(
                                            isgift: true,
                                            img: data.data![index].images,
                                            diamond: data.data![index].diamond,
                                          );
                                          msglist.add(d1);
                                        });
                                        print(
                                            "========================== ${msglist[index]} ==================================");
                                      },
                                      child: Image.network(
                                        'https://likeme.live/likeme/uploads/images/${data.data![index].images}',
                                        height: 40,
                                        width: 50,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              height: 7,
                                              width: 7,
                                              child: Image.asset(
                                                  "assets/images/coin.png")),
                                          Text(
                                            "${data.data![index].diamond}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: data!.data!.length,
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white10,
                        context: context,
                        builder: (BuildContext context) {
                          return BottomSheet(
                            backgroundColor: Colors.white.withOpacity(0.10),
                            builder: (BuildContext context) {
                              return BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                  height: 52.h,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Expanded(
                                    child: FutureBuilder(
                                      future: controller.getapi(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        } else if (snapshot.hasData) {
                                          ImogiModel? data = snapshot.data;
                                          return Column(
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
                                                child: GridView.builder(
                                                  itemCount: data!.data!.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 4,
                                                          childAspectRatio:
                                                              1.0),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.1)),
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Model d1 = Model(
                                                                    isgift:
                                                                        true,
                                                                    img: data
                                                                        .data![
                                                                            index]
                                                                        .images,
                                                                    diamond: data
                                                                        .data![
                                                                            index]
                                                                        .diamond);
                                                                msglist.add(d1);
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child:
                                                                Image.network(
                                                              'https://likeme.live/likeme/uploads/images/${data.data![index].images}',
                                                              height: 60,
                                                              width: 60,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                height: 10,
                                                                width: 10,
                                                                child: Image.asset(
                                                                    "assets/images/coin.png"),
                                                              ),
                                                              Text(
                                                                "${data.data![index].diamond}",
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
                                            ],
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                            onClosing: () {
                              // Handle the closing of the bottom sheet
                            },
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/images/gift.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      maxLines: 1,
                      controller: txtmsg,
                      style: const TextStyle(color: Colors.white70),
                      cursorColor: Colors.white,
                      cursorWidth: 0.5,
                      decoration: InputDecoration(
                        hintText: "Please Enter Message",
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
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
                  flex: 1,
                  child: SizedBox(
                    height: 7.h,
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.pink.shade400),
                      ),
                      onPressed: () {
                        Model d1 = Model(text: txtmsg.text, isgift: false);
                        msglist.add(d1);
                        print(
                            "==============================${msglist}==================================");
                        txtmsg.clear();
                        Get.back();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    // Format the duration as HH:MM:SS
    return '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/model/remote_config_model.dart';
import 'package:gallary_app/utils/api_helper.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    fetchRemoteConfig();
    super.initState();
  }
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  String? str;
  Future<void> fetchRemoteConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate().then((value) {
      str=remoteConfig.getString("data");
      print(str);

      RemoteConfigModel remoteConfigs=RemoteConfigModel.fromJson(json.decode(str!));

      Api_helper.baseUrl=remoteConfigs.baseUrl!;
      Api_helper.appSecret=remoteConfigs.appSecret!;


      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, 'version');
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [],
      ),
    ));
  }
}
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallary_app/controller/version_controller.dart';
import 'package:gallary_app/flore_databse/dao/databaseDAO.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import '../../controller/instal_controller.dart';
import '../../model/version_model.dart';
import '../../utils/ads_helper.dart';
class Version_Scren extends StatefulWidget {
  final VersionModelDao versionModelDao;

  const Version_Scren({Key? key, required this.versionModelDao}) : super(key: key);

  @override
  State<Version_Scren> createState() => _Version_ScrenState();
}

class _Version_ScrenState extends State<Version_Scren> {
  Version_Controller controller = Get.put(Version_Controller());

  InstalController installController = Get.put(InstalController());

  late AppLifecycleReactor _appLifecycleReactor;


String? str;
  @override
  void initState()  {
    super.initState();
    Ads_helper ads_helper = Ads_helper()..loadAppOpenAd();
    _appLifecycleReactor = AppLifecycleReactor(ads_helper: ads_helper);
    _appLifecycleReactor.listenToAppStateChanges();
    controller.versionload(widget.versionModelDao);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.islodin.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                width: 4.w,
                              ),
                              controller.allVersions[index].admaenable ==
                                      1
                                  ? Text(
                                      "${controller.allVersions[index].adname} is enable ${controller.allVersions[index].enable}",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  : Text(""),
                              ListView.builder(
                                itemBuilder: (context, c) {
                                  return controller.allVersions[index].enable ==
                                          1
                                      ? Text(
                                          "${controller.allVersions[index].adKeyword} is enable ${controller.allVersions[index].enable}",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      : Text("");
                                },
                                itemCount: controller.allVersions.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              ),
                            ],
                          );
                        },
                        itemCount:  controller.allVersions.length,
                      ),
                    ),
                    Text("Google Keyword same enable"),
                    controller.keybool.value == true
                        ? Container(
                            height: 170,
                            child: AdWidget(
                              ad: Ads_helper.ads_helper.bannerAd3!,
                            ),
                          )
                        : Container(),
                    controller.keybool.value == true
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () {
                              Ads_helper.ads_helper.interstitialAd!.show();
                              Ads_helper.ads_helper.loadInterstitialAd();
                            },
                            child: Text(
                              "Interstitial Ads",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Container(),
                    controller.keybool.value == true
                        ? Obx(
                            () => installController.isLoading.value == false
                                ? Container(
                                    height: 350,
                                    child: AdWidget(
                                      ad: installController.nativeAd!,
                                    ),
                                  )
                                : Container(),
                          )
                        : Container(),
                    controller.keybool.value == true
                        ? ElevatedButton(
                            onPressed: () {
                              Ads_helper.ads_helper.appOpenAd!.show();
                              Ads_helper.ads_helper.loadAppOpenAd();
                            },
                            child: Text("AppOpen Ad"),
                          )
                        : Container(),
                  ],
                ),
        ),
      ),
    );
  }
}
import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class Ads_helper {

  static final Ads_helper ads_helper = Ads_helper();

  final Duration maxCacheDuration = const Duration(hours: 4);

  DateTime? appOpenLoadTime;

  late AppOpenAd? appOpenAd;

  BannerAd? bannerAd;
  BannerAd? bannerAd2;
  BannerAd? bannerAd3;
  InterstitialAd? interstitialAd;
  NativeAd? nativeAd;
  RewardedAd? rewardedAd;


  void loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/9214589741",
      listener: BannerAdListener(),
      request: AdRequest(),
    );

    bannerAd!.load();
  }

  void loadBannerAd2() {
    bannerAd2 = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/9214589741",
      listener: BannerAdListener(),
      request: AdRequest(),
    );

    bannerAd2!.load();
  }

  void loadBannerAd3() {
    bannerAd3 = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/9214589741",
      listener: BannerAdListener(),
      request: AdRequest(),
    );

    bannerAd3!.load();
  }

  void loadInterstitialAd()
  {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }


  void loadRewardAd() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {

        },
      ),
    );
  }

  void loadAppOpenAd() {
    AppOpenAd.load(
        adUnitId: "ca-app-pub-3940256099942544/9257395921",
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            appOpenLoadTime = DateTime.now();
            appOpenAd = ad;
            print(" ====================== load appopen =====================");
          },
          onAdFailedToLoad: (error) {
              print(error);
          },
        ),
        orientation: AppOpenAd.orientationPortrait);

  }

  void showAdIfAvailable() {

    if (DateTime.now().subtract(maxCacheDuration).isAfter(appOpenLoadTime!)) {
      debugPrint('Maximum cache duration exceeded. Loading another ad.');
      appOpenAd!.dispose();
      appOpenAd = null;
      loadAppOpenAd();
      return;
    }

    appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {

        debugPrint('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');

        ad.dispose();
        appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('$ad onAdDismissedFullScreenContent');
        ad.dispose();
        appOpenAd = null;
        loadAppOpenAd();
      },
    );
    appOpenAd!.show();
  }
  // Applovin ads

  void lovinbanner()
  {
    MaxAdView(
        adUnitId: "ANDROID_BANNER_AD_UNIT_ID",
        adFormat: AdFormat.banner,
        listener: AdViewAdListener(onAdLoadedCallback: (ad) {
          // logStatus('Banner widget ad loaded from ${ad.networkName}');
        }, onAdLoadFailedCallback: (adUnitId, error) {
          // logStatus('Banner widget ad failed to load with error code ${error.code} and message: ${error.message}');
        }, onAdClickedCallback: (ad) {
          // logStatus('Banner widget ad clicked');
        }, onAdExpandedCallback: (ad) {
          // logStatus('Banner widget ad expanded');
        }, onAdCollapsedCallback: (ad) {
          // logStatus('Banner widget ad collapsed');
        }, onAdRevenuePaidCallback: (ad) {
          // logStatus('Banner widget ad revenue paid: ${ad.revenue}');
        }));
  }

}

class AppLifecycleReactor {
  final Ads_helper ads_helper;

  AppLifecycleReactor({required this.ads_helper});

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    debugPrint('New AppState state: $appState');
    if (appState == AppState.foreground) {
      ads_helper.showAdIfAvailable();
    }
  }
}
import 'dart:convert';
import 'package:gallary_app/model/imogi_model.dart';
import 'package:gallary_app/model/version_model.dart';
import 'package:http/http.dart' as http;

class Api_helper {
  static final Api_helper api_helper = Api_helper();

  // gifts api

  Future<ImogiModel> postapi() async {
    String? like = "https://likeme.live/likeme/api/giftList";
    var response = await http.post(Uri.parse(like), headers: {
      "apikey": "123",
      "authtoken": "eyJpdiI6ImdGenZlbklDVnMzR1VlWWIyNC9YbGc9PSIsInZhbHVlIjoiTzE4V3ByNC9jelFCMDgwbEpBT0Y1Vkl1cmRpY1E3b205MG84RkljMnpFMFp4Q3doSlJvTzc2aVJZNmNSRStydSIsIm1hYyI6IjUxZTg5ZGM3OTE1ZWU1MWRkNTY0ZjA0YWMxODMzZTRkMmE3YjVkZDYxMDk4OWYxY2E4Nzg3MTFkOWQ1NGQzZWIiLCJ0YWciOiIifQ==",
    });

    var json = jsonDecode(response.body);

    ImogiModel data = ImogiModel.fromJson(json);


    data.data!.sort((a, b) {
      if (a.diamond != b.diamond) {
        return a.diamond!.compareTo(b.diamond!);
      } else {
        return a.images!.compareTo(b.images!);
      }
    });

    return data;
  }

  static String baseUrl="";
  static String appSecret="";

  Future<VersionModel> version()
  async {
    String? like = "${baseUrl}version";

    var response = await http.post(Uri.parse(like),headers: {
      "app_secret":appSecret
    }, body: {
        "code":"1"
    });

    var json = jsonDecode(response.body);

    VersionModel data = VersionModel.fromJson(json);

    return data;
  }
}
import 'package:floor/floor.dart';
import 'package:gallary_app/flore_databse/dao/databaseDAO.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'model/version_model.dart';
part 'databse.g.dart';

@Database(version: 1, entities: [AdChield])
abstract class FlutterDatabase extends FloorDatabase {
  VersionModelDao get versionmodeldao;
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/databse.dart';
import 'package:gallary_app/screen/view/splash_screen.dart';
import 'package:gallary_app/screen/view/version_screen.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'model/version_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();

  final database = await $FloorFlutterDatabase.databaseBuilder('app_database.db').build();
  final versionModelDao = database.versionmodeldao;


  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
            '/': (p0) => Splash_Screen(),
            'version': (p0) => Version_Scren(versionModelDao: versionModelDao),

            // '/':(p0) => Floor_Screen(dao: dao, title: 'Employee',),
            // 'floor_add':(p0) => Floor_Add_Screen(dao: dao, title: 'Employee',),
          },
        );
      },
    ),
  );
}
{
  "project_info": {
    "project_number": "972411149912",
    "firebase_url": "https://test-c838a.firebaseio.com",
    "project_id": "test-c838a",
    "storage_bucket": "test-c838a.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:972411149912:android:559f03f2471cf8b387742d",
        "android_client_info": {
          "package_name": "com.example.gallary_app"
        }
      },
      "oauth_client": [
        {
          "client_id": "972411149912-0laarhardsruol9jcp00i7g9ndi6aa1b.apps.googleusercontent.com",
          "client_type": 3
        }
      ],
      "api_key": [
        {
          "current_key": "AIzaSyAk__rrehjDfsCKA8-YDUFmel6Dg1Ki7JI"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": [
            {
              "client_id": "972411149912-0laarhardsruol9jcp00i7g9ndi6aa1b.apps.googleusercontent.com",
              "client_type": 3
            }
          ]
        }
      }
    }
  ],
  "configuration_version": "1"
}
plugins {
    id "com.android.application"
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
if (flutterVersionCode == null) {
    flutterVersionCode = '1'
}

def flutterVersionName = localProperties.getProperty('flutter.versionName')
if (flutterVersionName == null) {
    flutterVersionName = '1.0'
}

android {
    namespace "com.example.gallary_app"
    compileSdk flutter.compileSdkVersion
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.gallary_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        multiDexEnabled true
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation 'com.android.support:multidex:1.0.3'
}
apply plugin: 'com.google.gms.google-services'
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.example_app">
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

    <application
        android:requestLegacyExternalStorage="true"
        android:label="gallary_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as    soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
        <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="ca-app-pub-3940256099942544~3347511713"/>
        <meta-data
            android:name="applovin.sdk.key"
            android:value="YOUR_APPLOVIN_MAX_SDK_KEY" />
    </application>
    <!-- Required to query activities that can process text, see:
         https://developer.android.com/training/package-visibility?hl=en and
         https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

         In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>
        
