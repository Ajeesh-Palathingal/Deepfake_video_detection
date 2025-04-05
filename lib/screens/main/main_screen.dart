import 'package:deepfake_video_detection/controller/appController.dart';
import 'package:deepfake_video_detection/screens/main/about_screen.dart';
import 'package:deepfake_video_detection/screens/main/home_screen.dart';
import 'package:deepfake_video_detection/screens/main/widgets/file_pick_tile.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  AppController appController = Get.put(AppController());

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
                  child: Obx(() {
                    return Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/svg/thick_vertical_lines.svg"),
                        SizedBox(width: 188.w),
                        GestureDetector(
                          onTap: () =>
                              appController.isSelectedHome.value = true,
                          child: CustomText(
                            text: "HOME",
                            fontSize: 15.spMax,
                            fontweight: FontWeight.w500,
                            fontColor: appController.isSelectedHome.value
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        SizedBox(width: 252.w),
                        GestureDetector(
                          onTap: () =>
                              appController.isSelectedHome.value = false,
                          child: CustomText(
                            text: "ABOUT",
                            fontSize: 15.spMax,
                            fontweight: FontWeight.w500,
                            fontColor: appController.isSelectedHome.value
                                ? Colors.white
                                : Colors.red,
                          ),
                        ),
                        SizedBox(width: 252.w),
                        // CustomText(
                        //   text: "FEATURES",
                        //   fontSize: 15.spMax,
                        //   fontweight: FontWeight.w500,
                        //   fontColor: Colors.white,
                        // ),
                      ],
                    );
                  }),
                ),
                // SizedBox(height: 115.h),
              ],
            ),
          ),
          Obx(() {
            return appController.isSelectedHome.value
                ? HomeScreen()
                : AboutScreen();
          })
          // Positioned(
          //   right: 0,
          //   bottom: 0,
          //   child: SizedBox(
          //       height: 300,
          //       width: 314,
          //       child: Lottie.asset("assets/lottie/face_loading.json")),
          // )
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
