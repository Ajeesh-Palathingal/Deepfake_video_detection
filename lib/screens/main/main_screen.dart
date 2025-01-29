import 'package:deepfake_video_detection/screens/main/widgets/file_pick_tile.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
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
                SizedBox(height: 115.h),
                Padding(
                  padding: EdgeInsets.only(left: 127.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "A",
                        fontSize: 16.spMax,
                        fontweight: FontWeight.w600,
                      ),
                      VerticalWhiteLine(),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: SvgPicture.asset("assets/svg/deepfake_text.svg"),
                      ),
                      VerticalWhiteLine(),
                      Row(
                        children: [
                          CustomText(
                            text: "Video detection",
                            fontSize: 16,
                            fontweight: FontWeight.w600,
                          ),
                          SizedBox(
                            width: 166.w,
                          ),
                          CustomText(
                            text: "> >",
                            fontSize: 16.spMax,
                            fontweight: FontWeight.w600,
                          ),
                        ],
                      ),
                      VerticalWhiteLine(),
                      Row(
                        children: [
                          CustomText(
                            text: "Platform",
                            fontSize: 16.spMax,
                            fontweight: FontWeight.w600,
                          ),
                          SizedBox(
                            width: 166.w,
                          ),
                          Container(
                            width: 20.w,
                            height: 5.w,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image(
                  image: AssetImage("assets/images/center_deepfake.png"),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  // right: 0,
                  // bottom: 0,
                  right: -300,
                  child: Image(
                    image: AssetImage("assets/images/large_dot_grid.png"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: FilePickTile(),
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
