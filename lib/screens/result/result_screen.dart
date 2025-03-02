import 'package:deepfake_video_detection/screens/main/widgets/file_pick_tile.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_elevated_button.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF322C2C),
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/svg/thick_vertical_lines.svg"),
                      SizedBox(width: 188.w),
                      CustomText(
                        text: "HOME",
                        fontSize: 15.spMax,
                        fontweight: FontWeight.w500,
                        fontColor: Colors.red,
                      ),
                      SizedBox(width: 252.w),
                      CustomText(
                        text: "ABOUT",
                        fontSize: 15.spMax,
                        fontweight: FontWeight.w500,
                        fontColor: Colors.white,
                      ),
                      SizedBox(width: 252.w),
                      CustomText(
                        text: "FEATURES",
                        fontSize: 15.spMax,
                        fontweight: FontWeight.w500,
                        fontColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 514.w,
                  width: 1151.w,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Color(0xFF322C2C),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 25.w),
                      SizedBox(
                        height: 190.w,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 190.w,
                              width: 180.w,
                              color: Colors.grey[600],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 25.w);
                          },
                          itemCount: 4,
                        ),
                      ),
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "This video is ",
                            fontSize: 40,
                            fontColor: Colors.white,
                          ),
                          CustomText(
                            text: "fake",
                            fontSize: 40,
                            fontColor: Colors.red,
                          ),
                          CustomText(
                            text: " with 99% accuracy",
                            fontSize: 40,
                            fontColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 170),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                            onPressed: () {},
                            label: "CANCEL",
                            backgroundColor: Colors.white,
                            height: 50,
                            width: 165,
                            borderRadius: 5,
                            fontSize: 15,
                          ),
                          SizedBox(width: 20),
                          CustomElevatedButton(
                            onPressed: () {},
                            label: "ADD NEW VIDEO",
                            backgroundColor: Colors.red,
                            labelColor: Colors.white,
                            height: 50,
                            width: 165,
                            borderRadius: 5,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 115.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalWhiteLine extends StatelessWidget {
  const VerticalWhiteLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        height: 22.h,
        width: 2,
        color: Colors.white,
      ),
    );
  }
}
