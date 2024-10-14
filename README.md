https://www.figma.com/design/hCTo7j1xzjuoqOof6rySGi/Travellery?node-id=13-1850&node-type=frame&t=PSeAxPTMAVwlpNmO-0

import 'package:get/get.dart';

class HomeStayController extends GetxController{

  var homestayTitle = ''.obs;

  void setTitle(String title) {
    homestayTitle.value = title;
  }

}
import 'package:get/get.dart';

class ImageController extends GetxController {

  RxList<String?> imagePaths = List<String?>.filled(6, null).obs;

  void setImage(int index, String? path) {
    imagePaths[index] = path;
  }

  List<String?> getSelectedImages() {
    return imagePaths;
  }
}

import 'package:get/get.dart';

import '../../routes_app/all_routes_app.dart';

class SignUpLoginController extends GetxController{

  var name = ''.obs;
  var email = ''.obs;
  var mobile = ''.obs;
  var password = ''.obs;

  // Method to handle signup
  void signup() {
    // Example of validation logic
    if (name.isEmpty || email.isEmpty || mobile.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    Get.toNamed(Routes.login);
  }
  // Method to handle login
  void login() {
    Get.toNamed(Routes.listHomestayPage1);

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      return;
    }

    print('Logging in with Email: $email, Password: $password');

    Get.toNamed(Routes.listHomestayPage1);
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../../utils/textFormField.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  int currentPage = 6;

  String? address;
  String? streetAddress;
  String? landmark;
  String? city;
  String? pinCode;
  String? state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      Strings.address,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                buildTitleStep(),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.address,
                            style:
                                FontManager.regular(14, color: AppColors.black),
                          ),
                          TextSpan(
                            style: FontManager.regular(14,
                                color: AppColors.redAccent),
                            text: Strings.addressIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.enterYourAddress,
                  onSaved: (value) => address = value,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.streetAddress,
                            style:
                                FontManager.regular(14, color: AppColors.black),
                          ),
                          TextSpan(
                            style: FontManager.regular(14,
                                color: AppColors.redAccent),
                            text: Strings.addressIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.enterYourStreetAddress,
                  onSaved: (value) => streetAddress = value,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.landmark,
                            style:
                                FontManager.regular(14, color: AppColors.black),
                          ),
                          TextSpan(
                            style: FontManager.regular(14,
                                color: AppColors.redAccent),
                            text: Strings.addressIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.landmark,
                  onSaved: (value) => landmark = value,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.cityTown,
                            style:
                                FontManager.regular(14, color: AppColors.black),
                          ),
                          TextSpan(
                            style: FontManager.regular(14,
                                color: AppColors.redAccent),
                            text: Strings.addressIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.cityTown,
                  onSaved: (value) => city = value,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.pinCode,
                            style:
                                FontManager.regular(14, color: AppColors.black),
                          ),
                          TextSpan(
                            style: FontManager.regular(14,
                                color: AppColors.redAccent),
                            text: Strings.addressIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.pinCode,
                  onSaved: (value) => pinCode = value,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.state,
                            style:
                                FontManager.regular(14, color: AppColors.black),
                          ),
                          TextSpan(
                            style: FontManager.regular(14,
                                color: AppColors.redAccent),
                            text: Strings.addressIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.state,
                  onSaved: (value) => state = value,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.showYourSpecificLocation,
                      style: FontManager.regular(16,
                          color: AppColors.textAddProreties),
                    ),
                    Switch(
                      value: false,
                      onChanged: (value) {
                        setState(() {});
                      },
                      thumbColor:
                          WidgetStateProperty.all(AppColors.buttonColor),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Text(
                    Strings.addressDiscription,
                    style: FontManager.regular(12, color: AppColors.greyText),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 7.h),
                SizedBox(
                  height: 7.h,
                  width: 50.w,
                  child: Image.asset(Assets.imagesHomeProgress5,
                      fit: BoxFit.contain),
                ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: Strings.nextStep,
                  onPressed: () {
                    Get.toNamed(Routes.photoPage);
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
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';

class AmenitiesPage extends StatefulWidget {
  const AmenitiesPage({super.key});

  @override
  State<AmenitiesPage> createState() => _AmenitiesPageState();
}

class _AmenitiesPageState extends State<AmenitiesPage> {
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
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      Strings.amenities,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTitleStep(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonColor)),
                      child: Center(
                        child: Text(
                          Strings.addAmenities,
                          style: FontManager.regular(14,
                              color: AppColors.buttonColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: AppColors.borderContainerGriedView,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Image.asset(
                              Assets.imagesWiFi,
                              height: 28,
                              width: 28,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.wiFi,
                              style: FontManager.regular(14,
                                  color: AppColors.textAddProreties),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.circle_outlined,
                              color: AppColors.borderContainerGriedView,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: AppColors.borderContainerGriedView,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Image.asset(
                              Assets.imagesAirCondioner,
                              height: 28,
                              width: 28,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.airConditioner,
                              style: FontManager.regular(14,
                                  color: AppColors.textAddProreties),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.check_circle_rounded,
                              color: AppColors.buttonColor,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: AppColors.borderContainerGriedView,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Image.asset(
                              Assets.imagesFirAlarm,
                              height: 28,
                              width: 28,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.fireAlarm,
                              style: FontManager.regular(14,
                                  color: AppColors.textAddProreties),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.circle_outlined,
                              color: AppColors.borderContainerGriedView,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  Strings.newAmenities,
                  style: FontManager.medium(18, color: AppColors.black),
                ),
                // SizedBox(
                //   height: 7.h,
                //   width: 50.w,
                //   child: Image.asset(Assets.imagesHomestayProgres,
                //       fit: BoxFit.contain),
                // ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 110.w,
                  height: 7.h,
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
                        SizedBox(
                          width: 3.w,
                        ),
                        Image.asset(
                          Assets.imagesHometherater,
                          height: 28,
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          Strings.homeTheater,
                          style: FontManager.regular(14,
                              color: AppColors.textAddProreties),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 1.w,
                        ),
                        Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.buttonColor,
                        ),
                        SizedBox(
                          width: 3.w,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 110.w,
                  height: 7.h,
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
                        SizedBox(
                          width: 3.w,
                        ),
                        Image.asset(
                          Assets.imagesMastrSuite,
                          height: 28,
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          Strings.masterSuiteBalcony,
                          style: FontManager.regular(14,
                              color: AppColors.textAddProreties),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 1.w,
                        ),
                        Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.buttonColor,
                        ),
                        SizedBox(
                          width: 3.w,
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 7.h,
                      width: 50.w,
                      child: Image.asset(Assets.imagesHomeProgres2,
                          fit: BoxFit.contain),
                    ),
                  ],
                ),

                SizedBox(height: 1.h),
                CommonButton(
                  title: currentPage < 7 ? Strings.nextStep : Strings.done,
                  onPressed: () {
                    Get.toNamed(Routes.newamenities);
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
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';

class CheckInOutDetailsPage extends StatefulWidget {
  const CheckInOutDetailsPage({super.key});

  @override
  State<CheckInOutDetailsPage> createState() => _CheckInOutDetailsPageState();
}

class _CheckInOutDetailsPageState extends State<CheckInOutDetailsPage> {
  bool isChecked = false;
  bool isChecked1 = true;
  int currentPage = 5;
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
                    const Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      Strings.checkInOutDetails,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                buildTitleStep(),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(Strings.checkInTime,
                        style: FontManager.medium(color: AppColors.black, 16)),
                  ],
                ),
                SizedBox(height: 2.h),
                // time

                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue ?? false;
                        });
                      },
                      side: const BorderSide(color: AppColors.texFiledColor),
                    ),
                    Text(Strings.flexibleWithCheckInTime,
                        style: FontManager.regular(color: AppColors.black, 14)),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(Strings.checkOutTime,
                        style: FontManager.medium(color: AppColors.black, 16)),
                  ],
                ),
                SizedBox(height: 2.h),
                // time
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: isChecked1,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked1 = newValue ?? true;
                        });
                      },
                      side: const BorderSide(color: AppColors.texFiledColor),
                    ),
                    Text(
                      Strings.flexibleWithCheckInTime,
                      style: FontManager.regular(color: AppColors.black, 14),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 7.h),
                SizedBox(
                  height: 7.h,
                  width: 50.w,
                  child: Image.asset(Assets.imagesHomeProgres4,
                      fit: BoxFit.contain),
                ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: currentPage < 7 ? Strings.nextStep : Strings.done,
                  onPressed: () async {
                    Get.toNamed(Routes.locationView);

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
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../../utils/textFormField.dart';

class HomeStayDescriptionPage extends StatefulWidget {
  const HomeStayDescriptionPage({super.key});

  @override
  State<HomeStayDescriptionPage> createState() => _HomeStayDescriptionPageState();
}

class _HomeStayDescriptionPageState extends State<HomeStayDescriptionPage> {
  int currentPage = 8;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 3.h),
              Row(
                children: [
                  const Icon(Icons.keyboard_arrow_left, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    Strings.description,
                    style: FontManager.medium(20, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              buildTitleStep(),
              SizedBox(height: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      Strings.description,
                      style: FontManager.regular(14, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              CustomTextField(
                maxLines: 7,
                maxLength: 500,
                hintText: Strings.enterDescription,
                onChanged: (value) {

                },
              ),
             Spacer(),
              CommonButton(
                title: Strings.nextStep,
                onPressed: () {
                  Get.toNamed(Routes.priceAndContactDetailsPage);
                },
              ),
              SizedBox(height: 8.h),
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
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';

class HouseRulesPage extends StatefulWidget {
  const HouseRulesPage({super.key});

  @override
  State<HouseRulesPage> createState() => _HouseRulesPageState();
}

class _HouseRulesPageState extends State<HouseRulesPage> {
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
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 31),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
            
                  children: [
                    Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(

                      Strings.houseRules,
                      style: FontManager.medium( 20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTitleStep(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonColor)),
                      child: Center(
                        child: Text(
                          Strings.addRules,
                          style: FontManager.regular(14,
                              color: AppColors.buttonColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 3.w,
                            ),
                            Image.asset(
                              Assets.imagesNoSmoking,
                              height: 28,
                              width: 28,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.noSmoking,
                              style: FontManager.regular( 14, color: AppColors.textAddProreties),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined,color: AppColors.borderContainerGriedView,),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 3.w,
                            ),
                            Image.asset(
                              Assets.imagesNoDrinking,
                              height: 28,
                              width: 28,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.noDrinking,
                              style: FontManager.regular( 14, color: AppColors.textAddProreties),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.check_circle_rounded,color: AppColors.buttonColor,),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 3.w,
                            ),
                            Image.asset(
                              Assets.imagesNoPet,
                              height: 28,
                              width: 28,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.noPet,
                              style: FontManager.regular( 14, color: AppColors.textAddProreties),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(Icons.circle_outlined,color: AppColors.borderContainerGriedView,),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  Strings.newRules,
                  style: FontManager.medium( 18, color: AppColors.textAddProreties),
                ),
             
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 110.w,
                  height: 7.h,
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
                        SizedBox(
                          width: 3.w,
                        ),
                        Image.asset(
                          Assets.imagesDamageToProretiy,
                          height: 28,
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          Strings.damageToProperty,
                          style: FontManager.regular( 14, color: AppColors.textAddProreties),
                        ),
                        Spacer(),
            
                        SizedBox(
                          width: 1.w,
                        ),
                        Icon(Icons.check_circle,color: AppColors.buttonColor,),
                        SizedBox(
                          width: 3.w,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CommonButton(
                  title: currentPage < 7 ? Strings.nextStep : Strings.done,
                  onPressed: () {
                     Get.toNamed(Routes.newRules);
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
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/font_manager.dart';

class ListHomePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String imagePath2;
  final String description;
  final String description2;

  final String buttonText;
  final String nextRoute;
  final double? imageWidth;
  final double? imageHeight;

  const ListHomePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.imagePath2,
    required this.description,
    required this.description2,
    required this.buttonText,
    required this.nextRoute,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 3.5.h),
                  Text(
                    title,
                    style: FontManager.medium(22),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 1.5.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: FontManager.regular(15.sp, color: AppColors.greyText),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 9.5.h),
                  Image.asset(
                    imagePath,
                    width: imageWidth ?? 90.w,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 2.5.h),
                  Text(
                    description,
                    style: FontManager.medium(20, color: AppColors.buttonColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2.8.h),
                  Text(
                    description2,
                    style: FontManager.regular(12, color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 3.h,
                    width: 20.w,
                    child: Image.asset(imagePath2,fit: BoxFit.contain,),
                  ),
                  SizedBox(height: 7.5.h),
                  CommonButton(
                    title: buttonText,
                    onPressed: () {
                      Get.toNamed(nextRoute);
                    },
                  ),
                  SizedBox(height: 4.5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../generated/assets.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_string.dart';
import 'custom_view_list_home.dart';

class ListHomestayPage1 extends StatelessWidget {
  const ListHomestayPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListHomePage(
      title: Strings.listHomeStay,
      subtitle: Strings.listHomeStayGreyText,
      imagePath: Assets.imagesListHome,
      description: Strings.aboutYourStay,
      description2: Strings.listHomeStayInto1,
      imagePath2: Assets.imagesIntodesh,
      buttonText: Strings.getStarted,
      imageHeight: 25.h,
      nextRoute: Routes.listHomestayPage2,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../generated/assets.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_string.dart';
import 'custom_view_list_home.dart';

class ListHomestayPage2 extends StatelessWidget {
  const ListHomestayPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListHomePage(
      title: Strings.listHomeStay,
      subtitle: Strings.listHomeStayGreyText,
      imagePath: Assets.imagesListHome2,
      imagePath2: Assets.imagesIntodesh2,
      description2: Strings.listHomeStayInto2,
      description: Strings.hotToGetThere,
      buttonText: Strings.getStarted,
      imageHeight: 25.h,
      nextRoute: Routes.listHomestayPage3,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../generated/assets.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_string.dart';
import 'custom_view_list_home.dart';

class ListHomestayPage3 extends StatelessWidget {
  const ListHomestayPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListHomePage(
      title: Strings.listHomeStay,
      subtitle: Strings.listHomeStayGreyText,
      imagePath: Assets.imagesListHome3,
      imagePath2: Assets.imagesIntodesh3,
      description: Strings.previewandPublish,
      description2: Strings.listHomeStayInto3,
      buttonText: Strings.getStarted,
      nextRoute: Routes.homestaylist1,
      imageHeight: 25.h,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/common_widgets/common_button.dart';

import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_dialog.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Stack(
              children: [
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child:  Row(
                    children: [
                      const Icon(Icons.keyboard_arrow_left, size: 30),
                      const SizedBox(width: 8),
                      Text(
                        Strings.location,
                        style: FontManager.medium(20, color: AppColors.black),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 45.h,
                  left: 16,
                  right: 16,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Strings.addLocation,style: FontManager.regular(18),),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: CommonButton(title: Strings.nextStep,
                    onPressed: () {
                      CustomDialog.showCustomDialog(
                        context: context,
                        title: Strings.turnLocationOn,
                        message: Strings.locationDiscription,
                        imageAsset: Assets.imagesQuestionDialog,
                        buttonLabel: Strings.settings,
                        changeEmailLabel: Strings.cancel,
                        onResendPressed: () {
                           Get.toNamed(Routes.addressPage);
                        },
                      );
                    },
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
import 'package:travellery_mobile/travellery_mobile/utils/app_colors.dart';

import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';

class NewAmenitiesPages extends StatefulWidget {
  const NewAmenitiesPages({super.key});

  @override
  State<NewAmenitiesPages> createState() => _NewAmenitiesPagesState();
}

class _NewAmenitiesPagesState extends State<NewAmenitiesPages> {
  int currentPage = 3;
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
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      Strings.newAmenities,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                buildTitleStep(),
                Column(
                  children: [
                    SizedBox(height: 1.h),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.homeTheater,
                              style: FontManager.regular( 16, color: AppColors.textAddProreties),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesDividecircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.masterSuiteBalcony,
                              style: FontManager.regular( 16, color: AppColors.black),
                            ),

                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesDividecircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.amenities3,
                              style: FontManager.regular( 16, color: AppColors.greyText),
                            ),

                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesPluscircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.amenities4,
                              style: FontManager.regular( 16, color: AppColors.greyText),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesPluscircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.amenities5,
                              style: FontManager.regular( 16, color: AppColors.greyText),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesPluscircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 7.h,
                  width: 50.w,
                  child: Image.asset(Assets.imagesHomeProgres2, fit: BoxFit.contain),
                ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: currentPage < 7 ? Strings.done : Strings.done,

                  onPressed: (){
                    Get.toNamed(Routes.houseRules);
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),);
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
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_colors.dart';

import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';

class NewRulesPages extends StatefulWidget {
  const NewRulesPages({super.key});

  @override
  State<NewRulesPages> createState() => _NewRulesPagesState();
}

class _NewRulesPagesState extends State<NewRulesPages> {
  int currentPage = 4;
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
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      Strings.newRules,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                buildTitleStep(),
                Column(
                  children: [
                    SizedBox(height: 1.h),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.damageToProperty,
                              style: FontManager.regular( 16, color: AppColors.textAddProreties),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesDividecircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.rules2,
                              style: FontManager.regular( 16, color: AppColors.greyText),
                            ),

                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesDividecircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.rules3,
                              style: FontManager.regular( 16, color: AppColors.greyText),
                            ),

                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesPluscircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.rules4,
                              style: FontManager.regular( 16, color: AppColors.greyText),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesPluscircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 110.w,
                      height: 7.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              Strings.rules5,
                              style: FontManager.regular( 16, color: AppColors.greyText),
                            ),
                            Spacer(),

                            SizedBox(
                              width: 1.w,
                            ),
                            Image.asset(
                              Assets.imagesPluscircle2,
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 3.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 7.h,
                  width: 50.w,
                  child: Image.asset(Assets.imagesHomeProgres3, fit: BoxFit.contain),
                ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: currentPage < 7 ? Strings.done : Strings.done,

                  onPressed: (){
                    Get.toNamed(Routes.checkInOutDetails);
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),);
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
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../../../generated/assets.dart';

class PhotoUploadContainer extends StatelessWidget {
  final int index;
  final String? imagePath;
  final ValueChanged<String?> onImageSelected;

  const PhotoUploadContainer({
    Key? key,
    required this.index,
    this.imagePath,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 150.w,
      decoration: BoxDecoration(
        image: imagePath != null
            ? DecorationImage(
          image: FileImage(File(imagePath!)),
          fit: BoxFit.fill,
        )
            : DecorationImage(
          image: AssetImage(Assets.imagesImageRectangle),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesUploadImage,
            height: 30,
            width: 30,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: Strings.photoChooseDiscription,
                  style: FontManager.regular(10, color: AppColors.greyText),
                ),
                TextSpan(
                  mouseCursor: SystemMouseCursors.click,
                  style: FontManager.regular(10, color: AppColors.buttonColor),
                  text: Strings.chooseFile,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles();

                      if (result != null) {
                        String filePath = result.files.single.path!;
                        print("${Strings.fileExpection} $filePath for index $index");
                        onImageSelected(filePath);
                      } else {
                        print(Strings.noFileSelectedExpection);
                      }
                    },
                ),
                TextSpan(
                  style: FontManager.regular(10, color: AppColors.greyText),
                  text: Strings.to,
                ),
                TextSpan(
                  style: FontManager.regular(10, color: AppColors.greyText),
                  text: Strings.upload,
                ),
              ],
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
import 'package:travellery_mobile/travellery_mobile/routes_app/all_routes_app.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import 'custom_photo_upload_image.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  int currentPage = 7;
  List<String?> imagePaths = List.filled(6, null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      Strings.photos,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTitleStep(),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  Strings.coverPhoto,
                  style: FontManager.regular(14, color: AppColors.textAddProreties),
                ),
                SizedBox(height: 10),
                PhotoUploadContainer(
                  index: 0,
                  imagePath: imagePaths[0],
                  onImageSelected: (path) {
                    setState(() {
                      imagePaths[0] = path;
                    });
                  },
                ),
                SizedBox(height: 30),
                Text(
                  Strings.homestayPhotos,
                  style: FontManager.regular(14, color: AppColors.textAddProreties),
                ),
                SizedBox(height: 2.h),
                buildPhotoUploadRows(),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 7.h,
                      width: 50.w,
                      child: Image.asset(Assets.imagesImageProgres6, fit: BoxFit.contain),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                CommonButton(
                  title: Strings.nextStep,
                  onPressed: () {
                    Get.toNamed(Routes.homeStayDescriptionPage);
                  },
                ),
                SizedBox(height: 8.h),
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

  Widget buildPhotoUploadRows() {
    return Column(
      children: List.generate(3, (rowIndex) {
        return Column(
          children: [
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: PhotoUploadContainer(
                    index: rowIndex * 2,
                    imagePath: imagePaths[rowIndex * 2],
                    onImageSelected: (path) {
                      setState(() {
                        imagePaths[rowIndex * 2] = path; // Update the image path
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: PhotoUploadContainer(
                    index: rowIndex * 2 + 1,
                    imagePath: imagePaths[rowIndex * 2 + 1],
                    onImageSelected: (path) {
                      setState(() {
                        imagePaths[rowIndex * 2 + 1] = path; // Update the image path
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      }),
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
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../../utils/textFormField.dart';

class PriceAndContactDetailsPage extends StatefulWidget {
  const PriceAndContactDetailsPage({super.key});

  @override
  State<PriceAndContactDetailsPage> createState() =>
      _PriceAndContactDetailsPageState();
}

class _PriceAndContactDetailsPageState
    extends State<PriceAndContactDetailsPage> {
  int currentPage = 8;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_left, size: 30),
                    const SizedBox(width: 8),
                    Text(
                      Strings.priceAndContactDetailsPage,
                      style: FontManager.medium(20, color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTitleStep(),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  Strings.price,
                  style: FontManager.regular(14, color: AppColors.black),
                ),
                SizedBox(height: 0.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: CustomTextField(
                        hintText: Strings.enterStartPrice,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        Strings.to,
                        style: FontManager.regular(14, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 2,
                      child: CustomTextField(
                        hintText: Strings.enterEndPrice,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  Strings.ownerDetails,
                  style: FontManager.semiBold(18, color: AppColors.buttonColor),
                ),
                SizedBox(height: 1.5.h),
                Text(Strings.ownerContactNo,
                    style: FontManager.regular(14)),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.mobileNumberHint,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Strings.mobileNumberError;
                    } else if (value.length < 10) {
                      return Strings.mobileNumberLengthError;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Handle saved value
                  },
                ),
                SizedBox(height: 3.h),
                Text(Strings.ownerEmailID,
                    style: FontManager.regular(14, color: AppColors.black)),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  hintText: Strings.emailHint,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Strings.emailEmpty;
                    } else if (!GetUtils.isEmail(value)) {
                      return Strings.invalidEmail;
                    }
                    return null;
                  },
                  onChanged: (value) {

                  },
                ),
                SizedBox(height: 3.h),
                Text(
                  Strings.homeStayDetails,
                  style: FontManager.semiBold(18, color: AppColors.buttonColor),
                ),
                SizedBox(height: 1.5.h),
                Text(Strings.homeStayContactNo,
                    style: FontManager.regular(14)),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  textStyle: FontManager.regular(16),
                  suffixIconImage: Image.asset(
                    Assets.imagesPluscircle2,
                    height: 17,
                    width: 17,
                    fit: BoxFit.contain,
                  ),
                  showSuffixIcon: true,
                  hintText: Strings.homeStayContactNo1,
                  onSaved: (value) {

                  },
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  suffixIconImage: Image.asset(
                    Assets.imagesPluscircle2,
                    height: 17,
                    width: 17,
                    fit: BoxFit.contain,
                  ),
                  showSuffixIcon: true,
                  hintText: Strings.homeStayContactNo1,
                  onSaved: (value) {

                  },
                ),
                SizedBox(height: 3.h),
                Text(Strings.homeStayEmailID,
                    style: FontManager.regular(14, color: AppColors.black)),
                SizedBox(height: 0.5.h),
                CustomTextField(
                  suffixIconImage: Image.asset(
                    Assets.imagesPluscircle2,
                    height: 17,
                    width: 17,
                    fit: BoxFit.contain,
                  ),
                  showSuffixIcon: true,
                  hintText: Strings.homeStayEmailID1,
                  onSaved: (value) {

                  },

                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  suffixIconImage: Image.asset(
                    Assets.imagesPluscircle2,
                    height: 17,
                    width: 17,
                    fit: BoxFit.contain,
                  ),
                  showSuffixIcon: true,
                  hintText: Strings.homeStayEmailID2,
                  onSaved: (value) {

                  },
                ),
                SizedBox(height: 7.h),
                CommonButton(
                  title: Strings.nextStep,
                  onPressed: () {
                    Get.toNamed(Routes.previewPage);
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
}
import 'package:flutter/material.dart';

class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({super.key});

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../generated/assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/font_manager.dart';

class TopView extends StatelessWidget {
  final String title;
  final String? promptText;
  final Widget content;
  final String imagePath;

  const TopView({
    super.key,
    required this.title,
    required this.promptText,
    required this.content,
    this.imagePath = Assets.imagesSplash,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(imagePath),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        title,
                        style: FontManager.semiBold(28),
                        textAlign: TextAlign.center,
                      ),
                        SizedBox(height: 1.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            promptText!,
                            style: FontManager.regular(15.sp, color: AppColors.greyText),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 4.5.h),
                content,
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
import '../../../../../generated/assets.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/common_dialog.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../../utils/textFormField.dart';
import '../../../controller/signup_Login_controller.dart';
import '../common_view/common_topview_forget_pages.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpLoginController controller = Get.find<SignUpLoginController>();

  @override
  Widget build(BuildContext context) {
    return TopView(
      title: Strings.forgetPassword,
      promptText: Strings.forgetPasswordPrompt,
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            Text(Strings.emailLabel, style: FontManager.regular(14, color: Colors.black)),
            SizedBox(height: 0.5.h),
            CustomTextField(
              hintText: Strings.emailHint,
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.emailEmpty;
                } else if (!GetUtils.isEmail(value)) {
                  return Strings.invalidEmail;
                }
                return null;
              },
              onChanged: (value) => controller.email.value = value,
              prefixIconData: Icons.email_outlined,
            ),
            SizedBox(height: 37.h),
            CommonButton(
              title: Strings.reset,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                }
                CustomDialog.showCustomDialog(
                  context: context,
                  title: Strings.checkYouEmail,
                  message: Strings.theEmailHasBeenResent,
                  imageAsset: Assets.imagesDialogemail,
                  buttonLabel: Strings.resend,
                  changeEmailLabel: Strings.changeEmail,
                  onResendPressed: () {
                    Get.toNamed(Routes.verificationPage);
                  },
                  onChangeEmailPressed: () {
                    // Handle change email logic here
                  },
                );
              },
            ),
            SizedBox(height: 2.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.offNamed(Routes.login);
                },
                child: Text(
                  Strings.cancel,
                  style: FontManager.regular(color: AppColors.buttonColor, 20),
                ),
              ),
            ),
            SizedBox(height: 4.h),
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
import '../../../../common_widgets/common_dialog.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../../../../utils/textFormField.dart';
import '../../../controller/signup_Login_controller.dart';
import '../common_view/common_topview_forget_pages.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpLoginController controller = Get.find<SignUpLoginController>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TopView(
      title: Strings.resetPassword,
      promptText: Strings.resetCodePrompt,
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Text(Strings.newPasswordLabel, style: FontManager.regular(14)),
            SizedBox(height: 0.5.h),
            CustomTextField(
              hintText: Strings.passwordHint,
              prefixIconData: Icons.lock_outline_rounded,
              obscureText: !isPasswordVisible,
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.passwordError;
                } else if (value.length < 6) {
                  return Strings.passwordLengthError;
                }
                return null;
              },
              onSaved: (value) => controller.password.value = value!,
              showSuffixIcon: true,
              onSuffixIconPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            SizedBox(height: 2.h),
            Text(
              Strings.confirmPassword,
              style: FontManager.regular(14),
            ),
            SizedBox(height: 0.5.h),
            CustomTextField(
              hintText: Strings.confirmPasswordHint,
              prefixIconData: Icons.lock_outline_rounded,
              obscureText: !isConfirmPasswordVisible,
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.confirmPasswordError;
                } else if (value != controller.password.value) {
                  return Strings.passwordMatchError;
                }
                return null;
              },
              showSuffixIcon: true,
              onSuffixIconPressed: () {
                setState(() {
                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                });
              },
            ),
            SizedBox(height: 28.h),
            CommonButton(
              title: Strings.submit,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
                CustomDialog.showCustomDialog(
                  context: context,
                  title: Strings.passwordUpdate,
                  message: Strings.thepasswordChange,
                  imageAsset: Assets.imagesDialogPassword,
                  buttonLabel: Strings.login,
                  onResendPressed: () {
                    Get.toNamed(Routes.login);
                  },
                );
              },
            ),
            SizedBox(height: 2.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.offNamed(Routes.login);
                },
                child: Text(
                  Strings.cancel,
                  style:
                      FontManager.regular(color: AppColors.buttonColor, 20),
                ),
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../routes_app/all_routes_app.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/font_manager.dart';
import '../common_view/common_topview_forget_pages.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TopView(
      title: Strings.verificationCodeTitle,
      promptText: Strings.verificationCodePrompt,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Center(
            child: Text(
              Strings.verificationCodeHint,
              style: FontManager.regular(14, color: AppColors.black),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 2.h),
          PinCodeTextField(
            controller: _controller,
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              borderWidth: 1,
              fieldHeight: 50,
              fieldWidth: 40,
              inactiveColor: Colors.grey,
              activeColor: Colors.blue,
              selectedColor: Colors.blueAccent,
            ),
            onChanged: (value) {},
            validator: (value) {
              if (value!.length < 6) {
                return Strings.verifyFullCodeError;
              }
              return null;
            },
          ),
          SizedBox(height: 34.h),
          CommonButton(
            title: Strings.verify,
            onPressed: () {
              if (_controller.text.length == 6) {
                // Handle verification logic
                Get.snackbar(Strings.success, Strings.verificationCodeEntered);
              } else {
                Get.snackbar(Strings.error,Strings.verifiCodeComple);
              }
            },
          ),
          SizedBox(height: 2.h),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.resetPage);
              },
              child: Text(
                Strings.resend,
                style: FontManager.regular(color: AppColors.buttonColor, 20),
              ),
            ),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../generated/assets.dart';
import '../../../common_widgets/common_button.dart';
import '../../../routes_app/all_routes_app.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/font_manager.dart';
import '../../../utils/textFormField.dart';
import '../../controller/signup_Login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpLoginController controller = Get.find<SignUpLoginController>();
  bool isChecked = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Image.asset(Assets.imagesSplash),
                        ),
                        SizedBox(height: 3.h),
                        Text(Strings.welcome,
                            style: FontManager.semiBold(28),
                            textAlign: TextAlign.center),
                        Text(Strings.gladToSeeYou,
                            style: FontManager.medium(18,
                                color: const Color(0xffB1B6B9)),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ],),

                  SizedBox(height: 6.h),
                  Text(Strings.emailLabel,
                      style: FontManager.regular(14, color: Colors.black)),
                  SizedBox(height: 0.5.h),
                  CustomTextField(
                    hintText: Strings.emailHint,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.emailEmpty;
                      } else if (!GetUtils.isEmail(value)) {
                        return Strings.invalidEmail;
                      }
                      return null;
                    },
                    onChanged: (value) => controller.email.value = value,
                    prefixIconData: Icons.email_outlined,
                  ),
                  SizedBox(height: 3.h),
                  Text(Strings.passwordLabel, style: FontManager.regular(14)),
                  SizedBox(height: 0.5.h),
                  CustomTextField(
                    hintText: Strings.passwordHint,
                    prefixIconData: Icons.lock_outline_rounded,
                    obscureText: !isPasswordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.passwordError;
                      } else if (value.length < 6) {
                        return Strings.passwordLengthError;
                      }
                      return null;
                    },
                    onSaved: (value) => controller.password.value = value!,
                    showSuffixIcon: true,
                    onSuffixIconPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue ?? false;
                          });
                        },
                        side: const BorderSide(color: AppColors.texFiledColor),
                      ),
                      Text(Strings.rememberMe,
                          style:
                              FontManager.regular(color: AppColors.black, 12)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.forgetPage),
                        child: Text(Strings.forgetPassword,
                            style: FontManager.medium(
                                color: AppColors.buttonColor, 12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  CommonButton(title: Strings.login, onPressed: onLogin),
                  SizedBox(height: 0.5.h),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset(Assets.imagesOr,height: 6.h,width: 50.w,)]),
                      SizedBox(height: 0.5.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.imagesGoogleIcon,height: 7.h,width: 20.w,fit: BoxFit.cover,),
                            SizedBox(width: 1.5.w),
                            Image.asset(Assets.imagesFacbookicon,height: 7.h,width: 20.w,fit: BoxFit.cover,),
                          ]),
                    ],
                  ),
                  SizedBox(height: 2.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: Strings.dontHaveAccount,
                              style: FontManager.regular(15,
                                  color: AppColors.black),
                            ),
                            TextSpan(
                              style: FontManager.semiBold(15,
                                  color: AppColors.buttonColor),
                              text: Strings.signUp,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(Routes.signup),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void onLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

    }
    controller.login();
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_colors.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_radius.dart';

import '../../../../generated/assets.dart';
import '../../../utils/app_string.dart';
import '../../../utils/font_manager.dart';

class OnboardingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onNext;
  final double titleFontSize;
  final double descriptionFontSize;
  final double buttonFontSize;

  const OnboardingCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onNext,
    this.titleFontSize = 24.0,
    this.descriptionFontSize = 12.0,
    this.buttonFontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 100.w,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: AppRadius.radiusM,
          topRight: AppRadius.radiusM,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 3.h,
                width: 20.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              title,
              style: FontManager.medium(titleFontSize),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              description,
              style: FontManager.regular(descriptionFontSize, color: AppColors.greyText),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 4.h),
          GestureDetector(
            onTap: onNext,
            child: Container(
              height: 5.2.h,
              width: 32.w,
              decoration: const BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.all(AppRadius.radiusSM),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    Strings.nextButton,
                    style: FontManager.regular(
                      buttonFontSize,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    Assets.imagesIntoarro,
                    color: AppColors.white,
                    width: 5.w,
                  ),
                ],
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
import 'package:travellery_mobile/generated/assets.dart';
import 'package:travellery_mobile/travellery_mobile/routes_app/all_routes_app.dart';
import '../../../utils/app_string.dart';
import 'common_onbording.dart';

class OnbordingPage1 extends StatelessWidget {
  const OnbordingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesInto1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OnboardingCard(
                imagePath: Assets.imagesIntodesh,
                title: Strings.onboardingTitle1,
                description: Strings.onboardingDescription1,
                onNext: () {
                  Get.toNamed(Routes.onboarding2);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellery_mobile/generated/assets.dart';
import 'package:travellery_mobile/travellery_mobile/routes_app/all_routes_app.dart';
import '../../../utils/app_string.dart';
import 'common_onbording.dart';

class OnbordingPage2 extends StatelessWidget {
  const OnbordingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesInto2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Onboarding Card
              Align(
                alignment: Alignment.bottomCenter,
                child: OnboardingCard(
                  imagePath: Assets.imagesIntodesh2,
                  title: Strings.onboardingTitle2,
                  description: Strings.onboardingDescription2,
                  onNext: () {
                    Get.toNamed(Routes.onboarding3);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellery_mobile/generated/assets.dart';
import 'package:travellery_mobile/travellery_mobile/routes_app/all_routes_app.dart';
import '../../../utils/app_string.dart';
import 'common_onbording.dart';

class OnbordingPage3 extends StatelessWidget {
  const OnbordingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesInto3),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OnboardingCard(
                imagePath: Assets.imagesIntodesh3,
                title: Strings.onboardingTitle3,
                description: Strings.onboardingDescription3,
                onNext: () {
                  Get.toNamed(Routes.signup);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/generated/assets.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_radius.dart';
import '../../../common_widgets/common_button.dart';
import '../../../routes_app/all_routes_app.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/font_manager.dart';
import '../../../utils/textFormField.dart';
import '../../controller/signup_Login_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpLoginController controller = Get.find<SignUpLoginController>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset(Assets.imagesSplash),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            Strings.createAccount,
                            style: FontManager.semiBold(28),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6.5.h),
                          Image.asset(Assets.imagesProfile,height: 13.1.h,width: 30.w,),
                          SizedBox(height: 2.h),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              height: 5.2.h,
                              width: 141,
                              decoration: const BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.all(AppRadius.radius10),
                              ),
                              child: Center(
                                child: Text(
                                  Strings.addProfileImage,
                                  style: FontManager.medium(15.sp,color: AppColors.white),
                                  // Updated here
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  Text(Strings.nameLabel, style: FontManager.regular(14)),
                  SizedBox(height: 0.5.h),
                  CustomTextField(
                    hintText: Strings.nameHint,
                    prefixIconImage: Image.asset(Assets.imagesSignupProfile,width: 20, height: 20),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.nameError;
                      }
                      return null;
                    },
                    onSaved: (value) => controller.name.value = value!,
                  ),
                  SizedBox(height: 3.h),
                  Text(Strings.mobileNumberLabel,
                      style: FontManager.regular(14)),
                  SizedBox(height: 0.5.h),

                  CustomTextField(
                    hintText: Strings.mobileNumberHint,
                    prefixIconImage: Image.asset(Assets.imagesPhone,
                        width: 20, height: 20),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.mobileNumberError;
                      } else if (value.length < 10) {
                        return Strings.mobileNumberLengthError;
                      }
                      return null;
                    },
                    onSaved: (value) => controller.mobile.value = value!,
                  ),
                  SizedBox(height: 3.h),
                  Text(Strings.emailLabel,
                      style: FontManager.regular(14, color: Colors.black)),
                  SizedBox(height: 0.5.h),
                  CustomTextField(
                    hintText: Strings.emailHint,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.emailEmpty;
                      } else if (!GetUtils.isEmail(value)) {
                        return Strings.invalidEmail;
                      }
                      return null;
                    },
                    onChanged: (value) => controller.email.value = value,
                    prefixIconData: Icons.email_outlined,
                  ),
                  SizedBox(height: 3.h),
                  Text(Strings.passwordLabel, style: FontManager.regular(14)),
                  SizedBox(height: 0.5.h),
                  CustomTextField(
                    hintText: Strings.passwordHint,
                    prefixIconData: Icons.lock_outline_rounded,
                    obscureText: !isPasswordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.passwordError;
                      } else if (value.length < 6) {
                        return Strings.passwordLengthError;
                      }
                      return null;
                    },
                    onSaved: (value) => controller.password.value = value!,
                    showSuffixIcon: true,
                    onSuffixIconPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                  Text(Strings.confirmPasswordLabel,
                      style: FontManager.regular(14)),
                  SizedBox(height: 0.5.h),
                  CustomTextField(
                    hintText: Strings.confirmPasswordHint,
                    prefixIconData: Icons.lock_outline_rounded,
                    obscureText: !isConfirmPasswordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.confirmPasswordError;
                      } else if (value != controller.password.value) {
                        return Strings.passwordMatchError;
                      }
                      return null;
                    },
                    showSuffixIcon: true,
                    onSuffixIconPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 11.9.h),

                  CommonButton(
                    title: Strings.signUp,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        controller.signup();
                      }
                    },
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: Strings.alreadyHaveAccount,
                              style: FontManager.regular(14),
                            ),
                            TextSpan(
                              text: ' ${Strings.login}',
                              style: FontManager.semiBold(14,color: AppColors.buttonColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.login);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:get/get.dart';
import 'package:travellery_mobile/travellery_mobile/routes_app/all_routes_app.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.onboarding1);
    });
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellery_mobile/generated/assets.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/splash_screen/splash_controller.dart';
import '../../../utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(Assets.imagesSplash),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/common_widgets/common_button.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_colors.dart';
import '../utils/font_manager.dart';

class CustomDialog {
  static void showCustomDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String imageAsset,
    required String buttonLabel,
    String? changeEmailLabel,
    VoidCallback? onResendPressed,
    VoidCallback? onChangeEmailPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8.0),
          title: Column(
            children: [
              SizedBox(
                height: 12.h,
                child: Image.asset(imageAsset),
              ),
               SizedBox(height: 1.h),
              Text(
                title,
                style: FontManager.semiBold(20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: FontManager.regular(12, color: AppColors.greyText),
          ),
          buttonPadding: const EdgeInsets.all(10),
          actions: [
            SizedBox(height: 3.h),
            CommonButton(
              title: buttonLabel,
              onPressed: () {
                Get.back();
                if (onResendPressed != null) {
                  onResendPressed();

                }
              },
            ),
            SizedBox(height: 2.h),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (onChangeEmailPressed != null) {
                      onChangeEmailPressed();
                    }
                    Get.back(); // Close the dialog
                  },
                  child: Text(
                    changeEmailLabel ?? "",
                    textAlign: TextAlign.center,
                    style: FontManager.regular(14, color: AppColors.buttonColor),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/accommodation_details_pages/accommodation_details_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/amenities_pages/amenities_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/check_in_out_details_pages/check_in_out_details_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/homestaydescription_pages/homestaydescription_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/homestaytitle_pages/homestay_title1.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/homestay_type_pages/homestay_type.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/house_rules_pages/house_rules_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/new_amenities_pages/new_amenities_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/add_properties_screen/new_rules_pages/new_rules_pages.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/login_page/login_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/onbording_pages/onbording_page1.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/onbording_pages/onbording_page2.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/onbording_pages/onbording_page3.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/signup_page/signup_page.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/view/splash_screen/splash_page.dart';
import '../auth_flow/view/add_properties_screen/address_pages/address_page.dart';
import '../auth_flow/view/add_properties_screen/list_homestay_pages/list_homestay1.dart';
import '../auth_flow/view/add_properties_screen/list_homestay_pages/list_homestay2.dart';
import '../auth_flow/view/add_properties_screen/list_homestay_pages/list_homestay3.dart';
import '../auth_flow/view/add_properties_screen/location_page/location_page.dart';
import '../auth_flow/view/add_properties_screen/photos_pages/photo_page.dart';
import '../auth_flow/view/add_properties_screen/preview_pages/preview_page.dart';
import '../auth_flow/view/add_properties_screen/price_and_contact_details_pages/price_and_contact_details_page.dart';
import '../auth_flow/view/forget_password_pages/forget_page/forget_password.dart';
import '../auth_flow/view/forget_password_pages/reset_page/reset_page.dart';
import '../auth_flow/view/forget_password_pages/verification_page/verification_page.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding1 = 'onboarding1';
  static const String onboarding2 = 'onboarding2';
  static const String onboarding3 = 'onboarding3';
  static const String signup = 'signup';
  static const String login = 'login';
  static const String forgetPage = 'forget';
  static const String verificationPage = 'verification';
  static const String resetPage = 'resetPage';
  static const String listHomestayPage1 = 'listHomestayPage1';
  static const String listHomestayPage2 = 'listHomestayPage2';
  static const String listHomestayPage3 = 'listHomestayPage3';
  static const String homestaylist1 = 'homestaylist1';
  static const String homestayType = 'homestayType';
  static const String accoummodationPage = 'accoummodationPage';
  static const String amenities = 'amenities';
  static const String newamenities = 'newamenities';
  static const String houseRules = 'houseRules';
  static const String newRules = 'newRules';
  static const String checkInOutDetails = 'checkInOutDetails';
  static const String locationView = 'locationView';
  static const String addressPage = 'addressPage';
  static const String photoPage = 'photoPage';
  static const String homeStayDescriptionPage = 'homeStayDescriptionPage';
  static const String priceAndContactDetailsPage = 'priceAndContactDetailsPage';
  static const String previewPage = 'previewPage';


  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (context) => const SplashPage(),
      onboarding1: (p0) => const OnbordingPage1(),
      onboarding2: (p0) => const OnbordingPage2(),
      onboarding3: (p0) => const OnbordingPage3(),
      signup: (context) => const SignupPage(),
      login: (context) => const LoginPage(),
      forgetPage: (context) => const ForgetPassword(),
      verificationPage: (context) => const VerificationCodeScreen(),
      resetPage: (context) => const ResetPasswordScreen(),
      listHomestayPage1: (context) => const ListHomestayPage1(),
      listHomestayPage2: (context) => const ListHomestayPage2(),
      listHomestayPage3: (context) => const ListHomestayPage3(),
      homestaylist1: (context) => const HomeStayTitleScreen(),
      homestayType: (context) => const HomeStayTypeScreen(),
      accoummodationPage: (context) => const AccommodationDetailsPage(),
      amenities: (context) => const AmenitiesPage(),
      newamenities: (context) => const NewAmenitiesPages(),
      houseRules: (context) => const HouseRulesPage(),
      newRules: (context) => const NewRulesPages(),
      checkInOutDetails: (context) => const CheckInOutDetailsPage(),
      locationView: (context) => const LocationView(),
      addressPage: (context) => const AddressPage(),
      photoPage: (context) => const PhotoPage(),
      homeStayDescriptionPage: (context) => const HomeStayDescriptionPage(),
      priceAndContactDetailsPage: (context) => const PriceAndContactDetailsPage(),
      previewPage: (context) => const PreviewPage(),
    };
  }
}
import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFffffff);
  static const Color white = Color(0xFFffffff);
  static const Color baseWhite = Color(0xFFFAFAFA);
  static const Color black = Colors.black;
  static const Color baseBlack = Color(0xFF0A0A0B);
  static const Color buttonColor = Color(0xFF6C5AD2);
  static const Color greySecondary = Color(0xFFAAB9C5);
  static const Color whiteSmokeSuccess = Color(0xFFA4F4E7);
  static const Color warning = Color(0xFFF4C790);
  static const Color redAccent = Color(0xFFFC6565);
  static const Color primary100 = Color(0xFFE6E3F8);
  static const Color primary200 = Color(0xFFCEC8F0);
  static const Color primary300 = Color(0xFFB6ACE9);
  static const Color primary400 = Color(0xFF9D91E1);
  static const Color primary500 = Color(0xFF8576DA);
  static const Color primary600 = Color(0xFF513BCA);
  static const Color primary700 = Color(0xFF422FAE);
  static const Color primary800 = Color(0xFF37278F);
  static const Color primary900 = Color(0xFF2B1F70);
  static const Color primary1000 = Color(0xFF1F1652);
  static const Color texFiledColor = Color(0xffC4C8CB);
  static const Color greyText = Color(0xffB1B6B9);
  static const Color borderContainerGriedView = Color(0xffECEEF0);
  static const Color yellow = Color(0xffFCCC51);
  static const Color perpalContainer = Color(0xffF7F5FF);
  static const Color textAddProreties = Color(0xff101011);
  static const Color lightPerpul = Color(0xffE7E4FA);
}
import 'package:flutter/material.dart';

class AppRadius {
  // Define different radius values
  static const Radius radius0 = Radius.circular(0);
  static const Radius radius2 = Radius.circular(2);
  static const Radius radius4 = Radius.circular(4);
  static const Radius radius6 = Radius.circular(6);
  static const Radius radius10 = Radius.circular(10);
  static const Radius radius16 = Radius.circular(16);
  static const Radius radius24 = Radius.circular(24);
  static const Radius radius36 = Radius.circular(36);
  static const Radius radius999 = Radius.circular(999);

  // Named sizes
  static const Radius radiusXXS = radius2;
  static const Radius radiusXS = radius4;
  static const Radius radiusS = radius6;
  static const Radius radiusSM = radius10;
  static const Radius radiusM = radius16;
  static const Radius radiusML = radius24;
  static const Radius radiusLG = radius36;
  static const Radius radiusXL = radius999;
}
// lib/utils/strings.dart

class Strings {
  // Onboarding Titles
  static const String onboardingTitle1 = "Book with ease, travel with joy";
  static const String onboardingTitle2 = "Discover and find your perfect healing place";
  static const String onboardingTitle3 = "Giving the best deal just for you";

  // Onboarding Descriptions
  static const String onboardingDescription1 =
      '"Discover a seamless booking experience with our user-friendly interface and exclusive deals."';
  static const String onboardingDescription2 =
      '"Escape to a world of tranquility and rejuvenation. Discover our curated selection of wellness retreats and healing spaces."';
  static const String onboardingDescription3 =
      '"Get exclusive offers and discounts on hotels, flights, and packages, curated just for your travel style."';

  // Button Texts
  static const String nextButton = "Next";
  // General Strings
  static const String welcome = "Welcome";
  static const String gladToSeeYou = "Glad to see you!";

  // Form Labels
  static const String rememberMe = "Remember me";
  static const String forgetPassword = "Forget password?";
  static const String loginButton = "Login";
  static const String dontHaveAccount = "Don’t have an account?";

  // Validation Messages
  static const String emailEmpty = 'Please enter your email';
  static const String invalidEmail = 'Please enter a valid email';
  static const String passwordEmpty = 'Please enter your password';
  static const String shortPassword = 'Password must be at least 6 characters';

  // Hint texts
  static const String nameHint = 'Enter your name';
  static const String mobileNumberHint = 'Enter your Mobile Number';
  static const String emailHint = 'Enter your Email';
  static const String passwordHint = 'Enter your Password';
  static const String confirmPasswordHint = 'Confirm Password';
  static const String addProfileImage = 'Add Profile Image';

  // Labels
  static const String createAccount = 'Create Account';
  static const String passwordLabel = 'Password';
  static const String confirmPasswordLabel = 'Confirm Password';
  static const String nameLabel = 'Name';
  static const String mobileNumberLabel = 'Mobile Number';
  static const String emailLabel = 'Email';
  static const String signUp = ' Sign Up';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String login = 'Login';

  // Error messages
  static const String nameError = 'Please enter your name';
  static const String mobileNumberError = 'Please enter your mobile number';
  static const String mobileNumberLengthError = 'Mobile number must be at least 10 digits';
  static const String emailError = 'Please enter your email';
  static const String emailFormatError = 'Please enter a valid email';
  static const String passwordError = 'Please enter your password';
  static const String passwordLengthError = 'Password must be at least 6 characters';
  static const String confirmPasswordError = 'Please confirm your password';
  static const String passwordMatchError = 'Passwords do not match';

  static const String forgetPasswordPrompt = "Provide your account's email for which you want to reset your password";
  static const String reset = "Reset";
  static const String resend = "Resend";
  static const String cancel = "Cancel";
  static const String checkYouEmail = "Check Your Email";
  static const String theEmailHasBeenResent = "The email has been resent. You will receive an email with a verification code to reset your password.";
  static const String changeEmail = "Change Email";

  // verification
  static const String verificationCodeTitle = "Verification Code";
  static const String verificationCodePrompt = "Enter your verification code sent to jhondoe0601@gmail.com";
  static const String verificationCodeHint = "Enter verification code";
  static const String verificationCodeError = "Please enter a valid code";
  static const String verify = "Verify";
  static const String verifyFullCodeError = "Please enter the full code";
  static const String success = "Success";
  static const String verificationCodeEntered = "Verification code entered!";
  static const String error = "Error";
  static const String verifiCodeComple = "Please enter a complete code.";

  static const String resetPassword = "Reset Password";
  static const String resetCodePrompt = "Enter new password amd confirm password.";
  static const String newPasswordLabel = "New password";
  static const String confirmPassword = "Confirm Password";
  static const String otpEmpty = "This field cannot be empty";
  static const String submit = "Submit";

  static const String passwordUpdate = "Password Updated";
  static const String thepasswordChange = "Your password has been updated";
  static const String listHomeStay = "List Homestay";
  static const String listHomeStayGreyText = "List your stay in few simple steps to earn and welcome travelers across the world";
  static const String aboutYourStay = "About your Stay";
  static const String listHomeStayInto1 = "Give your stay a catchy name and detailed description and provide basic info around accommodation details , amenities you offer , House rules and checkin/checkout details";
  static const String getStarted = "Get Started";
  static const String hotToGetThere = "How to get there";
  static const String listHomeStayInto2 = "Upload beautiful images of your stay as well location and contact details";
  static const String previewandPublish = "Preview and Publish";
  static const String listHomeStayInto3 = "Just preview how your details would look like to a traveler and publish. Your are all set to go !";
  static const String homestayTitle = 'Homestay Title';
  static const String homestayType = 'Homestay Type';

  static const String titleLabel = 'Title';
  static const String enterTitle = 'Enter title';
  static const String titleHint = '0/100';
  static const String stepCount = 'STEP';
  static const String nextStep = 'Next';
  static const String done = "Done";
  static const String accommodationDetails = "Accommodation Details";
  static const String entirePlace = "Entire Place";
  static const String wholePlacetoGuests = "Whole place to Guests";
  static const String privateRoom = "Private Room";
  static const String guestsSleepInPrivateRoomButSomeAreasAreShared = "Guests sleep in private room but some areas are shared";
  static const String maxGuests = "Max. Guests";
  static const String bedRooms = "Bedrooms";
  static const String singleBed = "Single Bed";
  static const String doubleBed = "Double Bed";
  static const String extraFloorMattress = "Extra floor mattress";
  static const String bathRooms = "Bathrooms";
  static const String kitchenAvailable = "Kitchen available";
  static const String defutlNumber = "06";
  static const String saveAndExit = "Save And Exit";
  static const String saveExit1 = "Save & Exit";
  static const String questionDialogText = "Are you sure, you want to exit? All changes done till now would be saved as Dtaft.";
  static const String yes = "Yes";
  static const String no = "No";
  static const String amenities = 'Amenities';
  static const String newAmenities = 'New Amenities';
  static const String wiFi = 'Wi-Fi';
  static const String airConditioner = 'Air-conditioner';
  static const String fireAlarm = 'Fire alarm';
  static const String homeTheater = 'Home Theater';
  static const String masterSuiteBalcony = 'Master Suite Balcony';
  static const String amenities3 = 'Amenities 3';
  static const String amenities4 = 'Amenities 4';
  static const String amenities5 = 'Amenities 5';
  static const String houseRules = 'House Rules';
  static const String addRules = '+ Add Rules';
  static const String addAmenities = '+ Add Amenities';
  static const String noSmoking = 'No smoking';
  static const String noDrinking = 'No drinking';
  static const String noPet = 'No pet';
  static const String newRules = 'New Rules';
  static const String damageToProperty = 'Damage to Property';
  static const String rules2 = 'Rules 2';
  static const String rules3 = 'Rules 3';
  static const String rules4 = 'Rules 4';
  static const String rules5 = 'Rules 5';
  static const String checkInOutDetails = 'Check-in/out details';
  static const String checkInTime = 'Check-In Time';
  static const String checkOutTime = 'Check-Out Time';
  static const String flexibleWithCheckInTime = 'Flexible with Check-in time';
  static const String selectCheckInTime = 'Select Check In Time';
  static const String selectCheckOutTime = 'Select Check Out Time';
  static const String selectTime = 'Select Time';
  static const String turnLocationOn = 'Turn Location On';
  static const String locationDiscription = 'Your Location is off. please turn on Location to allow travelbud to see your location.';
  static const String settings = 'Settings';
  static const String location = 'Location';
  static const String addLocation = 'Add Location';
  static const String address = 'Address';
  static const String addressIcon = '*';
  static const String streetAddress = 'Street Address';
  static const String landmark = 'Landmark';
  static const String cityTown = 'City/Town';
  static const String pinCode = 'Pin code';
  static const String state = 'State';
  static const String showYourSpecificLocation = 'Show your specific location';
  static const String addressDiscription = 'Make it clear to guests where your place is located. We’ll only share your address after they’ve made a reservation.';
  static const String enterYourAddress = 'Enter your address';
  static const String enterYourStreetAddress = 'Enter your street address';
  static const String enterYourLandmark = 'Enter your landmark';
  static const String enterYourCity = 'Enter your city';
  static const String enterYourPinCode = 'Enter your pin code';
  static const String selectYourState = 'Select your state';
  static const String coverPhoto = 'Cover Photo';
  static const String photoChooseDiscription = 'Click photo or';
  static const String chooseFile = ' choose file';
  static const String to = ' to\n';
  static const String upload = 'upload';
  static const String homestayPhotos = 'Homestay Photos';
  static const String photos = 'Photos';
  static const String fileExpection = 'Picked file';
  static const String noFileSelectedExpection = 'No file selected';
  static const String homeStayDescription = 'Homestay Description';
  static const String description = 'Description';
  static const String enterDescription = 'Enter description';
  static const String priceAndContactDetailsPage = 'Price and Contact Details';
  static const String price = 'Price';
  static const String enterStartPrice = 'Enter start price';
  static const String enterEndPrice = 'Enter end price';
  static const String ownerDetails = 'Owner Details';
  static const String ownerContactNo = 'Owner Contact No.';
  static const String ownerEmailID = 'Owner Email ID';
  static const String homeStayDetails = 'Homestay Details';
  static const String homeStayContactNo = 'Homestay Contact No.';
  static const String homeStayContactNo1 = 'Enter homestay contact no. 1';
  static const String homeStayEmailID = 'Homestay Email ID';
  static const String homeStayEmailID1 = 'Enter homestay email ID 1';
  static const String homeStayEmailID2 = 'Enter homestay email ID 2';
  static const String preview = 'Preview';
  static const String hiltonViewVilla = 'Hilton View Villa';
  static const String newYorkUSA = 'New York, USA';
  static const String doller = '5,000 - 6,500';
  static const String details = 'Details';
  static const String contact = 'Contact';
  static const String traditional = 'Traditional';
  static const String defultbedrooms = '6 Bedrooms';
  static const String defultSingleBed = '5 Single Bed';
  static const String defultGuests = '12 Guests';
  static const String defultBathrooms = '6 Bathrooms';
  static const String defultDoubleBed = '6 Double Bed';
  static const String defultFloorMattress = '2 Floor mattress';
  static const String descriptionReadMore = "'Hilton View Villa is a luxurious retreat offering modern comfort with stunning panoramic views. Featuring elegant rooms, private balconies, a pool,  and gourmet dining, it's perfect for guests seeking relaxation and exclusivity in a scenic setting. ";
  static const String readMore = ' Read more...';




}
import 'package:flutter/material.dart';

class FontManager {
  static const String fontFamily = 'Poppins';

  static TextStyle thin(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w100,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle extraLight(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w200,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle light(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle regular(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle medium(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle semiBold(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle bold(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle extraBold(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w800,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle black(double size, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w900,
      fontSize: size,
      color: color,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:travellery_mobile/travellery_mobile/utils/app_radius.dart';
import 'package:travellery_mobile/travellery_mobile/utils/font_manager.dart';
import 'app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIconData;
  final Image? prefixIconImage;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool showSuffixIcon;
  final Image? suffixIconImage;
  final VoidCallback? onSuffixIconPressed;
  final int? maxLength;
  final int maxLines;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIconData,
    this.prefixIconImage,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.showSuffixIcon = false,
    this.suffixIconImage,
    this.onSuffixIconPressed,
    this.maxLength,
    this.maxLines = 1,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines,
      style: textStyle ?? FontManager.regular(14),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: FontManager.regular(12, color: AppColors.texFiledColor),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.texFiledColor),
          borderRadius: BorderRadius.all(AppRadius.radius10),
        ),
        prefixIcon: prefixIconImage != null
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: prefixIconImage,
        )
            : prefixIconData != null
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(prefixIconData, color: AppColors.texFiledColor),
        )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.texFiledColor),
          borderRadius: BorderRadius.all(AppRadius.radius10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.texFiledColor),
          borderRadius: BorderRadius.all(AppRadius.radius10),
        ),
        suffixIcon: showSuffixIcon
            ? (suffixIconImage != null
            ? Padding(
          padding: const EdgeInsets.all(14),
          child: suffixIconImage,
        )
            : IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility_rounded,
            color: AppColors.texFiledColor,
          ),
          onPressed: onSuffixIconPressed,
        ))
            : null,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/controller/homestaytitle_controller.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/controller/photo_picke_set.dart';
import 'package:travellery_mobile/travellery_mobile/auth_flow/controller/signup_Login_controller.dart';
import 'package:travellery_mobile/travellery_mobile/routes_app/all_routes_app.dart';

void main() {
  Get.put(SignUpLoginController());
  Get.put(HomeStayController());
  Get.put(ImageController());
  runApp(
    Sizer(
      builder: (p0, p1, p2) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        routes: Routes.routes,
      ),
    ), 
  );
}
///This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class Assets {
  Assets._();

  static const String fontsOFL = 'assets/fonts/OFL.txt';
  static const String fontsPoppinsBlack = 'assets/fonts/Poppins-Black.ttf';
  static const String fontsPoppinsBlackItalic = 'assets/fonts/Poppins-BlackItalic.ttf';
  static const String fontsPoppinsBold = 'assets/fonts/Poppins-Bold.ttf';
  static const String fontsPoppinsBoldItalic = 'assets/fonts/Poppins-BoldItalic.ttf';
  static const String fontsPoppinsExtraBold = 'assets/fonts/Poppins-ExtraBold.ttf';
  static const String fontsPoppinsExtraBoldItalic = 'assets/fonts/Poppins-ExtraBoldItalic.ttf';
  static const String fontsPoppinsExtraLight = 'assets/fonts/Poppins-ExtraLight.ttf';
  static const String fontsPoppinsExtraLightItalic = 'assets/fonts/Poppins-ExtraLightItalic.ttf';
  static const String fontsPoppinsItalic = 'assets/fonts/Poppins-Italic.ttf';
  static const String fontsPoppinsLight = 'assets/fonts/Poppins-Light.ttf';
  static const String fontsPoppinsLightItalic = 'assets/fonts/Poppins-LightItalic.ttf';
  static const String fontsPoppinsMedium = 'assets/fonts/Poppins-Medium.ttf';
  static const String fontsPoppinsMediumItalic = 'assets/fonts/Poppins-MediumItalic.ttf';
  static const String fontsPoppinsRegular = 'assets/fonts/Poppins-Regular.ttf';
  static const String fontsPoppinsSemiBold = 'assets/fonts/Poppins-SemiBold.ttf';
  static const String fontsPoppinsSemiBoldItalic = 'assets/fonts/Poppins-SemiBoldItalic.ttf';
  static const String fontsPoppinsThin = 'assets/fonts/Poppins-Thin.ttf';
  static const String fontsPoppinsThinItalic = 'assets/fonts/Poppins-ThinItalic.ttf';
  static const String imagesAdventure = 'assets/images/adventure.png';
  static const String imagesAirCondioner = 'assets/images/airCondioner.png';
  static const String imagesBathRooms = 'assets/images/bathRooms.png';
  static const String imagesBedRooms = 'assets/images/bedRooms.png';
  static const String imagesBedbreakfast = 'assets/images/bedbreakfast.png';
  static const String imagesClock = 'assets/images/clock.png';
  static const String imagesDamageToProretiy = 'assets/images/damageToProretiy.png';
  static const String imagesDialogPassword = 'assets/images/dialogPassword.png';
  static const String imagesDialogemail = 'assets/images/dialogemail.png';
  static const String imagesDividecircle = 'assets/images/dividecircle.png';
  static const String imagesDividecircle2 = 'assets/images/dividecircle2.png';
  static const String imagesDubleBed = 'assets/images/dubleBed.png';
  static const String imagesEcofriendly = 'assets/images/ecofriendly.png';
  static const String imagesEmail = 'assets/images/email.png';
  static const String imagesExtraFloor = 'assets/images/extraFloor.png';
  static const String imagesFacbookicon = 'assets/images/facbookicon.png';
  static const String imagesFirAlarm = 'assets/images/firAlarm.png';
  static const String imagesGoogleIcon = 'assets/images/googleIcon.png';
  static const String imagesHomeProgres2 = 'assets/images/homeProgres2.png';
  static const String imagesHomeProgres3 = 'assets/images/homeProgres3.png';
  static const String imagesHomeProgres4 = 'assets/images/homeProgres4.png';
  static const String imagesHomeProgress5 = 'assets/images/homeProgress5.png';
  static const String imagesHomestayProgres = 'assets/images/homestayProgres.png';
  static const String imagesHometherater = 'assets/images/hometherater.png';
  static const String imagesImageProgres6 = 'assets/images/imageProgres6.png';
  static const String imagesImageRectangle = 'assets/images/imageRectangle.png';
  static const String imagesImagesHomestayProgres1 = 'assets/images/imagesHomestayProgres1.png';
  static const String imagesInto1 = 'assets/images/into1.png';
  static const String imagesInto2 = 'assets/images/into2.png';
  static const String imagesInto3 = 'assets/images/into3.png';
  static const String imagesIntoarro = 'assets/images/intoarro.png';
  static const String imagesIntodesh = 'assets/images/intodesh.png';
  static const String imagesIntodesh2 = 'assets/images/intodesh2.png';
  static const String imagesIntodesh3 = 'assets/images/intodesh3.png';
  static const String imagesKitchen = 'assets/images/kitchen.png';
  static const String imagesListHome = 'assets/images/listHome.png';
  static const String imagesListHome2 = 'assets/images/listHome2.png';
  static const String imagesListHome3 = 'assets/images/listHome3.png';
  static const String imagesLuxury = 'assets/images/luxury.png';
  static const String imagesMastrSuite = 'assets/images/mastrSuite.png';
  static const String imagesMaxGuests = 'assets/images/maxGuests.png';
  static const String imagesNoDrinking = 'assets/images/noDrinking.png';
  static const String imagesNoPet = 'assets/images/noPet.png';
  static const String imagesNoSmoking = 'assets/images/noSmoking.png';
  static const String imagesOr = 'assets/images/or.png';
  static const String imagesPassword = 'assets/images/password.png';
  static const String imagesPhone = 'assets/images/phone.png';
  static const String imagesPluscircle = 'assets/images/pluscircle.png';
  static const String imagesPluscircle2 = 'assets/images/pluscircle2.png';
  static const String imagesPrivateRoom = 'assets/images/privateRoom.png';
  static const String imagesProfile = 'assets/images/profile.png';
  static const String imagesQuestionDialog = 'assets/images/questionDialog.png';
  static const String imagesSignupProfile = 'assets/images/signup_profile.png';
  static const String imagesSingleBed = 'assets/images/singleBed.png';
  static const String imagesSplash = 'assets/images/splash.png';
  static const String imagesTraditional = 'assets/images/traditional.png';
  static const String imagesUploadImage = 'assets/images/uploadImage.png';
  static const String imagesUrban = 'assets/images/urban.png';
  static const String imagesWiFi = 'assets/images/wiFi.png';

}
name: travellery_mobile
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ^3.5.3

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  get: ^4.6.6
  sizer: ^3.0.4
  pin_code_fields: ^8.0.1
  intl: ^0.19.0
  google_maps_flutter: ^2.9.0
  file_picker: ^8.1.2


dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^4.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  assets:
    - assets/images/

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/to/resolution-aware-images

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/to/asset-from-package

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Thin.ttf
          weight: 100
        - asset: assets/fonts/Poppins-ExtraLight.ttf
          weight: 200
        - asset: assets/fonts/Poppins-Light.ttf
          weight: 300
        - asset: assets/fonts/Poppins-Regular.ttf
          weight: 400
        - asset: assets/fonts/Poppins-Medium.ttf
          weight: 500
        - asset: assets/fonts/Poppins-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
        - asset: assets/fonts/Poppins-ExtraBold.ttf
          weight: 800
        - asset: assets/fonts/Poppins-Black.ttf
          weight: 900
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/to/font-from-package
