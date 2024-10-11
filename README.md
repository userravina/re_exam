https://www.figma.com/design/hCTo7j1xzjuoqOof6rySGi/Travellery?node-id=13-1850&node-type=frame&t=PSeAxPTMAVwlpNmO-0
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_radius.dart';
import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../controller/homestaytitle_controller.dart';
import 'custtom_container.dart';

class AccommodationDetailsPage extends StatefulWidget {
  const AccommodationDetailsPage({super.key});

  @override
  State<AccommodationDetailsPage> createState() =>
      _AccommodationDetailsPageState();
}

class _AccommodationDetailsPageState extends State<AccommodationDetailsPage> {
  final HomeStayController controller = Get.find<HomeStayController>();
  int currentPage = 1;
  String? selectedType;

  void nextPage() {
    if (selectedType != null) {
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      Strings.accommodationDetails,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                buildTitleStep(),
                Column(
                  children: [
                    Container(
                      width: 110.w,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(AppRadius.radius10),
                        border: Border.all(
                          color: AppColors.borderContainerGriedView,
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            Strings.entirePlace,
                            style:
                                FontManager.regular(16, color: AppColors.black),
                          ),
                          subtitle: Text(
                            Strings.wholePlacetoGuests,
                            style: FontManager.regular(12,
                                color: AppColors.greyText),
                          ),
                          leading: Image.asset(
                            Assets.imagesTraditional,
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                          trailing: Radio(
                            value: true,
                            groupValue: null,
                            onChanged: (value) {

                            },
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          minVerticalPadding: 0,
                          minTileHeight: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(AppRadius.radius10),
                        border: Border.all(
                          color: AppColors.borderContainerGriedView,
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            Strings.privateRoom,
                            style:
                                FontManager.regular(16, color: AppColors.black),
                          ),
                          subtitle: Text(
                            Strings
                                .guestsSleepInPrivateRoomButSomeAreasAreShared,
                            style: FontManager.regular(12,
                                color: AppColors.greyText),
                          ),
                          leading: Image.asset(
                            Assets.imagesPrivateRoom,
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                          trailing: Radio(
                            value: true,
                            groupValue: null,
                            onChanged: (value) {

                            },
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          minVerticalPadding: 0,
                          minTileHeight: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CusttomContainer(
                      imageAsset: Assets.imagesMaxGuests,
                      title: Strings.maxGuests,
                      defaultNumber: Strings.defutlNumber,
                    ),
                    SizedBox(height: 2.h,),
                    CusttomContainer(
                      imageAsset: Assets.imagesSingleBed,
                      title: Strings.singleBed,
                      defaultNumber: Strings.defutlNumber,
                    ),
                    SizedBox(height: 2.h,),
                    CusttomContainer(
                      imageAsset: Assets.imagesDubleBed,
                      title: Strings.doubleBed,
                      defaultNumber: Strings.defutlNumber,
                    ),
                    SizedBox(height: 2.h,),
                    CusttomContainer(
                      imageAsset: Assets.imagesExtraFloor,
                      title: Strings.extraFloorMattress,
                      defaultNumber: Strings.defutlNumber,
                    ),
                    SizedBox(height: 2.h,),
                    CusttomContainer(
                      imageAsset: Assets.imagesBathRooms,
                      title: Strings.bathRooms,
                      defaultNumber: Strings.defutlNumber,
                    ),
                    SizedBox(height: 2.h,),
                    CusttomContainer(
                      imageAsset: Assets.imagesKitchen,
                      title: Strings.kitchenAvailable,
                      defaultNumber: Strings.defutlNumber,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                  width: 50.w,
                  child: Image.asset(Assets.imagesHomestayProgres,
                      fit: BoxFit.contain),
                ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: currentPage < 7 ? Strings.nextStep : Strings.done,
                  onPressed: () {
                    Get.toNamed(Routes.homestayType);
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${Strings.stepCount} $currentPage/8",
          style: FontManager.regular(18, color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget customContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${Strings.stepCount} $currentPage/8",
          style: FontManager.regular(18, color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../generated/assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_radius.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';

class CusttomContainer extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String defaultNumber;

  const CusttomContainer({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.defaultNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 8.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: AppColors.borderContainerGriedView,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 3.w,),
            Image.asset(
              imageAsset,
              height: 28,
              width: 28,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 5.w,),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          Spacer(),
          Row(children: [
            Image.asset(
              Assets.imagesDividecircle,
              height: 24,
            ),
            SizedBox(width: 1.w,),
            Container(
              width: 40,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.perpalContainer,
                borderRadius: BorderRadius.all(AppRadius.radius4),
              ),
              child: Center(
                child: Text(
                  Strings.defutlNumber,
                  style: FontManager.regular(14),
                ),
              ),
            ),
            SizedBox(width: 1.w,),
            Image.asset(
              Assets.imagesPluscircle,
              height: 24,
            ),
            SizedBox(width: 3.w,),
          ],)
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_radius.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../controller/homestaytitle_controller.dart';

class HomeStayTypeScreen extends StatefulWidget {
  const HomeStayTypeScreen({super.key});

  @override
  State<HomeStayTypeScreen> createState() => _HomeStayTypeScreenState();
}

class _HomeStayTypeScreenState extends State<HomeStayTypeScreen> {
  final HomeStayController controller = Get.find<HomeStayController>();
  int currentPage = 1;
  String? selectedType;

  void nextPage() {
    if (selectedType != null) {
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 3.h),
              Row(
                children: [
                  const Icon(Icons.keyboard_arrow_left, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    Strings.homestayType,
                    style: FontManager.medium(20, color: AppColors.black),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              buildTitleStep(),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.3,
                  children: [
                    buildHomestayTypeCard("Traditional",Assets.imagesTraditional),
                    buildHomestayTypeCard("Bed & Breakfast",Assets.imagesBedbreakfast),
                    buildHomestayTypeCard("Urban",Assets.imagesUrban),
                    buildHomestayTypeCard("Eco-Friendly",Assets.imagesEcofriendly),
                    buildHomestayTypeCard("Adventure",Assets.imagesAdventure),
                    buildHomestayTypeCard("Luxury",Assets.imagesLuxury),
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
                width: 50.w,
                child: Image.asset(Assets.imagesHomestayProgres, fit: BoxFit.contain),
              ),
              SizedBox(height: 1.h),
              CommonButton(
                title: currentPage < 7 ? Strings.nextStep : Strings.done,
                onPressed: (){
                  Get.toNamed(Routes.accoummodationPage);
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${Strings.stepCount} $currentPage/8",
          style: FontManager.regular(18, color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildHomestayTypeCard(String type,String image) {

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = type;
        });
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color:  AppColors.white,
          border: Border.all(
            color: AppColors.borderContainerGriedView,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(AppRadius.radius10),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(image,height: 5.h,width: 10.w,fit: BoxFit.contain,),
            Spacer(),
            Center(
              child: Text(
                type,
                style: FontManager.regular(
                  16,
                  color:  AppColors.black,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/routes_app/all_routes_app.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_colors.dart';
import 'package:travellery_mobile/travellery_mobile/utils/font_manager.dart';
import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/textFormField.dart';
import '../../../controller/homestaytitle_controller.dart';

class HomeStayTitleScreen extends StatefulWidget {
  const HomeStayTitleScreen({super.key});

  @override
  State<HomeStayTitleScreen> createState() => _HomeStayTitleScreenState();
}

class _HomeStayTitleScreenState extends State<HomeStayTitleScreen> {
  final HomeStayController controller = Get.find<HomeStayController>();
  final PageController _pageController = PageController();
  int currentPage = 1;

  void nextPage() {
    if (currentPage <= 8) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 3.h),
              Row(
                children: [
                  Icon(Icons.keyboard_arrow_left, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    Strings.homestayTitle,
                    style: FontManager.medium(20, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              buildTitleStep(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.titleLabel, style: FontManager.regular(14)),
                    SizedBox(height: 0.5.h),
                    CustomTextField(
                      maxLength: 100,
                      hintText: Strings.enterTitle,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Strings.enterTitle;
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          controller.homestayTitle.value = value!,
                      onChanged: (value) => controller.setTitle(value),
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
                width: 50.w,
                child: Image.asset(Assets.imagesHomestayProgres,
                    fit: BoxFit.contain),
              ),
              SizedBox(height: 1.h),
              CommonButton(
                title: currentPage < 7 ? Strings.nextStep : Strings.done,
                onPressed: () {
                  Get.toNamed(Routes.homestayType);
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.stepCount + " " + currentPage.toString() + "/8",
          style: FontManager.regular(18, color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_radius.dart';

import '../utils/app_colors.dart';
import '../utils/font_manager.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CommonButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 6.h,
        width: 100.w,
        decoration: const BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.all(AppRadius.radius10),
        ),
        child: Center(
          child: Text(
            title,
            style: FontManager.regular(20, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
