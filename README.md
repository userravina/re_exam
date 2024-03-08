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
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallary_app/controller/version_controller.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import '../../controller/instal_controller.dart';
import '../../utils/ads_helper.dart';
class Version_Scren extends StatefulWidget {
  const Version_Scren({super.key});

  @override
  State<Version_Scren> createState() => _Version_ScrenState();
}

class _Version_ScrenState extends State<Version_Scren> {
  Version_Controller controller = Get.put(Version_Controller());

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  InstalController installController = Get.put(InstalController());

  late AppLifecycleReactor _appLifecycleReactor;


String? str;
  Future<void> fetchRemoteConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate().then((value) {
      str=remoteConfig.getString("data");
      print(str);
    });


  }
  @override
  void initState() {
    super.initState();
    fetchRemoteConfig();
    Ads_helper ads_helper = Ads_helper()..loadAppOpenAd();
    _appLifecycleReactor = AppLifecycleReactor(ads_helper: ads_helper);
    _appLifecycleReactor.listenToAppStateChanges();
    controller.versionload();
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
                              controller.data!.data!.adMaster![index].enable ==
                                      1
                                  ? Text(
                                      "${controller.data!.data!.adMaster![index].admName} is enable ${controller.data!.data!.adMaster![index].enable}",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  : Text(""),
                              ListView.builder(
                                itemBuilder: (context, c) {
                                  return controller.data!.data!.adMaster![index]
                                              .adChield![c].enable ==
                                          1
                                      ? Text(
                                          "${controller.data!.data!.adMaster![index].adChield![c].adKeyword} is enable ${controller.data!.data!.adMaster![index].adChield![c].enable}",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      : Text("");
                                },
                                itemCount: controller.data!.data!
                                    .adMaster![index].adChield!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              ),
                            ],
                          );
                        },
                        itemCount: controller.data!.data!.adMaster!.length,
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallary_app/controller/version_controller.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import '../../controller/instal_controller.dart';
import '../../utils/ads_helper.dart';

class Version_Scren extends StatefulWidget {
  const Version_Scren({super.key});

  @override
  State<Version_Scren> createState() => _Version_ScrenState();
}

class _Version_ScrenState extends State<Version_Scren> {
  Version_Controller controller = Get.put(Version_Controller());

  InstalController installController = Get.put(InstalController());

  late AppLifecycleReactor _appLifecycleReactor;
  final RemoteConfig remoteConfig = RemoteConfig.instance;

  Future<void> fetchRemoteConfig() async {
    await remoteConfig.fetch(expiration: const Duration(hours: 1));
    await remoteConfig.activateFetched();
  }
  @override
  void initState() {
    super.initState();
    Ads_helper ads_helper = Ads_helper()..loadAppOpenAd();
    _appLifecycleReactor = AppLifecycleReactor(ads_helper: ads_helper);
    _appLifecycleReactor.listenToAppStateChanges();
    controller.versionload();
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
                              controller.data!.data!.adMaster![index].enable ==
                                      1
                                  ? Text(
                                      "${controller.data!.data!.adMaster![index].admName} is enable ${controller.data!.data!.adMaster![index].enable}",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  : Text(""),
                              ListView.builder(
                                itemBuilder: (context, c) {
                                  return controller.data!.data!.adMaster![index]
                                              .adChield![c].enable ==
                                          1
                                      ? Text(
                                          "${controller.data!.data!.adMaster![index].adChield![c].adKeyword} is enable ${controller.data!.data!.adMaster![index].adChield![c].enable}",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      : Text("");
                                },
                                itemCount: controller.data!.data!
                                    .adMaster![index].adChield!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              ),
                            ],
                          );
                        },
                        itemCount: controller.data!.data!.adMaster!.length,
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
                                  )import 'package:gallary_app/utils/api_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../model/version_model.dart';
import '../utils/ads_helper.dart';
import 'instal_controller.dart';

class Version_Controller extends GetxController{
  InstalController installController = Get.put(InstalController());
  RxInt enable =1.obs;
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


  Future versionload() async {
    islodin.value = true;
    await Api_helper.api_helper.version().then((value) {
         data=value;
         for (i = 0; i < data!.data!.adMaster!.length; i++) {
           if (name == data!.data!.adMaster![i].admName) {
             if (data!.data!.adMaster![i].enable == 1) {
               for (j = 0; j < data!.data!.adMaster![i].adChield!.length; j++) {
                 if (name == data!.data!.adMaster![i].admName) {
                   if (adkeyword == data!.data!.adMaster![i].adChield![j].adKeyword) {
                     if (data!.data!.adMaster![i].adChield![j].enable == 1) {
                       keybool.value = true;
                       Ads_helper.ads_helper.loadBannerAd3();
                       Ads_helper.ads_helper.loadInterstitialAd();
                       installController.loadNativeAd();

                       Ads_helper.ads_helper.loadAppOpenAd();
                       Ads_helper ads_helper = Ads_helper()..loadAppOpenAd();
                       _appLifecycleReactor = AppLifecycleReactor(ads_helper: ads_helper);
                       _appLifecycleReactor.listenToAppStateChanges();

                       print("==================== ${keybool} ==============================");
                     }
                   }
                 }
               }
             }
           }
         }
         islodin.value = false;
       },
    );
  }
}
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
https://groworbit.in/testadmin/apps/version/list



https://github.com/userravina/re_exam/assets/120082785/9202c17e-e157-4c48-9aba-c58d582a3ecd
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
Future<VersionModel> version()
  async {
    String? like = "https://groworbit.in/testadmin/api/testapp/version";

    var response = await http.post(Uri.parse(like),headers: {
      "app_secret":"wQSLrTQtTJwvU26v"
    }, body: {
        "code":"1"
    });

    var json = jsonDecode(response.body);

    VersionModel data = VersionModel.fromJson(json);

    return data;
  }


import 'dart:async';
import 'dart:ui';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/model/msglist_model.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/imogi_controller.dart';
import '../../model/imogi_model.dart';

class Bottom_Sheet extends StatefulWidget {
  const Bottom_Sheet({super.key});

  @override
  State<Bottom_Sheet> createState() => _Bottom_SheetState();
}

class _Bottom_SheetState extends State<Bottom_Sheet> {
  late BetterPlayerController betterPlayerController;
  Imogi_Controller controller = Get.put(Imogi_Controller());
  TextEditingController txtmsg = TextEditingController();
  String? msg;
  List<Model> msglist = [];
  late DateTime screenStartTime;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
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
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gallary_app/model/imogi_model.dart';
import 'package:gallary_app/utils/api_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Imogi_Controller extends ChangeNotifier {
  RxList data = <ImogiModel>[].obs;

  Future<ImogiModel> getapi() async {
    return await Api_helper.api_helper.postapi();
  }

  Random random = Random();
  late Timer time;
  RxInt rendomnm = 0.obs;

  void generaterendomnumber() {
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      rendomnm.value = Random().nextInt(1000) + 1;
    });
  }


}
class Model{

  String? text,img;
  bool? isgift = true;
  int? diamond;

  Model({this.text,this.img,this.isgift,this.diamond});
}
