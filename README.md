https://www.figma.com/design/eGd8YBEnnTgG2RKuvn86he/Fitnest---Fitness-App-UI-Kit-by-Pixel-True?node-id=206-281&node-type=canvas&t=XINwDLsHtg1HRNso-0
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ConfirmPage1 extends StatefulWidget {
  const ConfirmPage1({super.key});

  @override
  State<ConfirmPage1> createState() => _ConfirmPage1State();
}

class _ConfirmPage1State extends State<ConfirmPage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What is your goal",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "It will help us to choose a best program for you",
                    style: GoogleFonts.poppins(

                        fontSize: 12,
                        color: Color(0xff7B6F72)), textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F8F8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset("assets/images/signup_login/v1.png"),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next step or perform an action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff92A3FD),
                    minimumSize: Size(double.infinity, 60),
                  ),
                  child: Text(
                    'Confirm Goal',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w), // Responsive padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
              Text(
                "Hey there,",
                style: GoogleFonts.poppins(
                    color: const Color(0xff1D1617), fontSize: 16.sp),
              ),
              Text(
                "Create an Account,",
                style: GoogleFonts.poppins(
                  color: const Color(0xff1D1617),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 3.h),
              _buildTextField(txtName, "Name", Icons.person_outline_rounded),
              _buildTextField(
                  txtLastName, "Last Name", Icons.person_outline_rounded),
              _buildTextField(txtEmail, "Email", Icons.email_outlined),
              _buildTextField(
                  txtPassword, "Password", Icons.lock_outline_rounded,
                  isPassword: true),
              _buildCheckbox(),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('person_info');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff92A3FD),
                  minimumSize: Size(double.infinity, 60),
                  textStyle: TextStyle(
                    fontSize: screensize.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: screensize.width * 0.04,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: 2.5.h),
              _buildDivider(),
              SizedBox(height: 2.5.h),
              _buildSocialMediaButtons(),
              SizedBox(height: 2.5.h),
              _buildLoginText(),
              SizedBox(height: 2.5.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            labelStyle: GoogleFonts.poppins(
                fontSize: 15.sp, color: const Color(0xffADA4A5)),
            fillColor: Colors.transparent,
            filled: true,
            prefixIcon: Icon(icon, color: const Color(0xffADA4A5)),
            suffixIcon: isPassword
                ? Icon(Icons.visibility_off_outlined,
                color: const Color(0xffADA4A5))
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue ?? false;
              });
            },
            focusColor: Colors.grey,
            side: BorderSide(color: Colors.grey),
          ),
          Expanded(
            child: Text(
              "By continuing you accept our Privacy Policy and Term of Use",
              style: GoogleFonts.poppins(
                  color: const Color(0xffADA4A5), fontSize: 15.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Spacer(),
        Container(height: 1.5, width: 40.w, color: const Color(0xffDDDADA)),
        SizedBox(width: 2.w),
        Text("or",
            style: GoogleFonts.poppins(
                color: const Color(0xff1D1617), fontSize: 12.sp)),
        SizedBox(width: 2.w),
        Container(height: 1.5, width: 40.w, color: const Color(0xffDDDADA)),
        Spacer(),
      ],
    );
  }

  Widget _buildSocialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/signup_login/g.png"),
        SizedBox(width: 6.w),
        Image.asset("assets/images/signup_login/f.png"),
      ],
    );
  }

  Widget _buildLoginText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          TextSpan(
            text: ' Login',
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xffcb8fed)),
          ),
        ],
      ),
    );
  }
}
