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




https://github.com/userravina/re_exam/assets/120082785/9202c17e-e157-4c48-9aba-c58d582a3ecd

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallary_app/controller/imogi_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../model/imogi_model.dart';

class Bottom_Sheet extends StatefulWidget {
  const Bottom_Sheet({super.key});

  @override
  State<Bottom_Sheet> createState() => _Bottom_SheetState();
}

class _Bottom_SheetState extends State<Bottom_Sheet> {
  Imogi_Controller controller = Get.put(Imogi_Controller());

  @override
  void initState() {
    // TODO: implement initState
    controller.getapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/s2.jpg",
              fit: BoxFit.cover,
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
                      children: [
                        SizedBox(
                          width: 10,
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
                          width: 5,
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
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.visibility,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "100K",
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
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade900,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          width: 5,
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
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 600,
              left: 15,
            ),
            child: Row(
              children: [
                Expanded(flex: 4,
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
                                width: 40,
                                child: Column(
                                  children: [
                                    Image.network(
                                      'https://likeme.live/likeme/uploads/images/${data.data![index].images}',
                                      height: 40,
                                      width: 50,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          SizedBox(height: 7,width: 7,child: Image.asset("assets/images/coin.png")),
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
                      return CircularProgressIndicator(
                        color: Colors.black,
                      );
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
                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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
                                                    top: 15, bottom: 15, right: 30),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 4.h,
                                                    width: 8.7.w,
                                                    decoration: BoxDecoration(
                                                      color:
                                                      Colors.black.withOpacity(0.2),
                                                      borderRadius:
                                                      BorderRadius.circular(20),
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
                                                      crossAxisCount: 4,childAspectRatio: 1.0),
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white.withOpacity(0.1)),
                                                      child: Column(
                                                        children: [
                                                          Image.network(
                                                            'https://likeme.live/likeme/uploads/images/${data.data![index].images}',
                                                            height: 60,
                                                            width: 60,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              SizedBox(height: 10,width: 10,child: Image.asset("assets/images/coin.png")),
                                                              Text(
                                                                "${data.data![index].diamond}",
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
                                            ],
                                          );
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        );
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
                    height: 7.4.h,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      cursorColor: Colors.white,
                      cursorWidth: 0.5,
                      decoration: InputDecoration(
                        hintText: "Please Enter Message",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.3),
                            width: 1,
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
                  child: Container(
                    height: 7.h,
                    child: IconButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.pink.shade400)),
                      onPressed: () {},
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
}
import 'dart:convert';

import 'package:gallary_app/model/imogi_model.dart';
import 'package:http/http.dart' as http;

class Api_helper {
  static final Api_helper api_helper = Api_helper();

  Future<ImogiModel> postapi() async {
    String? like = "https://likeme.live/likeme/api/giftList";
    var response = await http.post(Uri.parse(like), headers: {
      "apikey": "123",
      "authtoken":
          "eyJpdiI6ImdGenZlbklDVnMzR1VlWWIyNC9YbGc9PSIsInZhbHVlIjoiTzE4V3ByNC9jelFCMDgwbEpBT0Y1Vkl1cmRpY1E3b205MG84RkljMnpFMFp4Q3doSlJvTzc2aVJZNmNSRStydSIsIm1hYyI6IjUxZTg5ZGM3OTE1ZWU1MWRkNTY0ZjA0YWMxODMzZTRkMmE3YjVkZDYxMDk4OWYxY2E4Nzg3MTFkOWQ1NGQzZWIiLCJ0YWciOiIifQ==",
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
}
import 'package:flutter/cupertino.dart';
import 'package:gallary_app/model/imogi_model.dart';
import 'package:gallary_app/utils/api_helper.dart';

class Imogi_Controller extends ChangeNotifier {

  Future<ImogiModel> getapi() {
    return Api_helper.api_helper.postapi();
  }

}
// To parse this JSON data, do
//
//     final imogiModel = imogiModelFromJson(jsonString);

import 'dart:convert';

ImogiModel imogiModelFromJson(String str) => ImogiModel.fromJson(json.decode(str));

String imogiModelToJson(ImogiModel data) => json.encode(data.toJson());

class ImogiModel {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  ImogiModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ImogiModel.fromJson(Map<String, dynamic> json) => ImogiModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? images;
  int? diamond;

  Datum({
    this.id,
    this.images,
    this.diamond,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    images: json["images"],
    diamond: json["diamond"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": images,
    "diamond": diamond,
  };
}

