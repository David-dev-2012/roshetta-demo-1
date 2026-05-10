import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rosheta_ai/core/navigation/app_navigation.dart';
import 'package:rosheta_ai/core/resources/route_manager.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late StreamController<bool> agreeController;

  bool isAgree = false;

  @override
  void initState() {
    super.initState();

    agreeController = StreamController<bool>.broadcast();

    agreeController.add(isAgree);
  }

  @override
  void dispose() {
    agreeController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
            
                SizedBox(height: 20.h),
            
                /// APP BAR
                Row(
                  children: [
            
                    InkWell(
                      onTap:() =>  Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 22.sp,
                        color: Colors.black,
                      ),
                    ),
            
                    Expanded(
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
            
                    SizedBox(width: 22.w),
                  ],
                ),
            
                SizedBox(height: 40.h),
            
                /// NAME
                _buildTextField(
                  hint: 'Enter your name',
                  icon: Icons.person_outline,
                ),
            
                SizedBox(height: 18.h),
            
                /// EMAIL
                _buildTextField(
                  hint: 'Enter your email',
                  icon: Icons.email_outlined,
                ),
            
                SizedBox(height: 18.h),
            
                /// PASSWORD
                _buildPasswordField(),
            
                SizedBox(height: 22.h),
            
                /// AGREE BUTTON
                StreamBuilder<bool>(
                  stream: agreeController.stream,
                  initialData: false,
            
                  builder: (context, snapshot) {
            
                    final agree = snapshot.data ?? false;
            
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
            
                      children: [
            
                        GestureDetector(
                          onTap: () {
            
                            isAgree = !agree;
            
                            agreeController.add(isAgree);
                          },
            
                          child: Container(
                            width: 24.w,
                            height: 24.h,
            
                            decoration: BoxDecoration(
                              color: agree
                                  ? const Color(0xff1FA89A)
                                  : Colors.transparent,
            
                              borderRadius: BorderRadius.circular(6.r),
            
                              border: Border.all(
                                color: agree
                                    ? const Color(0xff1FA89A)
                                    : const Color(0xffD9D9D9),
                              ),
                            ),
            
                            child: agree
                                ? Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16.sp,
                            )
                                : null,
                          ),
                        ),
            
                        SizedBox(width: 12.w),
            
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff7D8A95),
                                height: 1.5,
                              ),
            
                              children: const [
            
                                TextSpan(
                                  text: 'I agree to the medidoc ',
                                ),
            
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    color: Color(0xff1FA89A),
                                  ),
                                ),
            
                                TextSpan(
                                  text: ' and ',
                                ),
            
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Color(0xff1FA89A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            
                SizedBox(height: 40.h),
            
                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 60.h,
            
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1FA89A),
                      elevation: 0,
            
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
            
                    onPressed: () {
                      AppNavigation.pushAndRemoveUntil(
                        context,
                        RoutesName.login,
                      );
                    },
            
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: 35.h),
            
                /// BOTTOM TEXT
                GestureDetector(
                  onTap: () => AppNavigation.pushNamed(context, RoutesName.login),
                  child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xff7D8A95),
                      ),
            
                      children: const [
            
                        TextSpan(
                          text: "Don’t have an account? ",
                        ),
            
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Color(0xff1FA89A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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

  Widget _buildTextField({
    required String hint,
    required IconData icon,
  }) {
    return Container(
      height: 65.h,

      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),

        borderRadius: BorderRadius.circular(18.r),

        border: Border.all(
          color: const Color(0xffE8ECF4),
        ),
      ),

      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(
            icon,
            color: const Color(0xffA7B0BB),
            size: 24.sp,
          ),

          hintText: hint,

          hintStyle: TextStyle(
            color: const Color(0xffA7B0BB),
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      height: 65.h,

      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),

        borderRadius: BorderRadius.circular(18.r),

        border: Border.all(
          color: const Color(0xffE8ECF4),
        ),
      ),

      child: TextField(
        obscureText: true,

        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(
            Icons.lock_outline,
            color: const Color(0xffA7B0BB),
            size: 24.sp,
          ),

          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: const Color(0xffA7B0BB),
            size: 24.sp,
          ),

          hintText: 'Enter your password',

          hintStyle: TextStyle(
            color: const Color(0xffA7B0BB),
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}