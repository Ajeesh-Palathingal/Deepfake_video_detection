import 'dart:convert';
import 'dart:typed_data';

import 'package:deepfake_video_detection/controller/appController.dart';
import 'package:deepfake_video_detection/screens/main/main_screen.dart';
import 'package:deepfake_video_detection/screens/main/widgets/file_pick_tile.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_elevated_button.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
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
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/svg/thick_vertical_lines.svg"),
                      SizedBox(width: 188.w),
                      GestureDetector(
                        onTap: () => Get.offAll(MainScreen()),
                        child: CustomText(
                          text: "HOME",
                          fontSize: 15.spMax,
                          fontweight: FontWeight.w500,
                          fontColor: Colors.red,
                        ),
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
                  child: Obx(() {
                    return appController.isLoading.value
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 400,
                                  child: Lottie.asset(
                                      "assets/lottie/yoga_waiting.json"
                                      // "assets/lottie/face_loading.json"
                                      ),
                                ),
                                // SizedBox(
                                //     height: 300,
                                //     child: Lottie.asset(
                                //         "assets/lottie/loading.json"))
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              SizedBox(height: 25.w),
                              SizedBox(
                                height: 190.w,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    Uint8List bytes = base64Decode(
                                        appController.imageFiles[index]);
                                    return Container(
                                      height: 190.w,
                                      width: 180.w,
                                      child: Center(
                                          child: Image.memory(
                                        bytes,
                                        fit: BoxFit.cover,
                                      )),
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
                                    text: appController.prediction.value,
                                    fontSize: 40,
                                    fontColor:
                                        appController.prediction.value == "Fake"
                                            ? Colors.red
                                            : Colors.green,
                                  ),
                                  CustomText(
                                    text:
                                        " with ${appController.confidenceScore.value}% confidence",
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
                                    onPressed: () {
                                      Get.back();
                                    },
                                    label: "CANCEL",
                                    backgroundColor: Colors.white,
                                    height: 50,
                                    width: 165,
                                    borderRadius: 5,
                                    fontSize: 15,
                                  ),
                                  SizedBox(width: 20),
                                  CustomElevatedButton(
                                    onPressed: () async {
                                      appController.fileName.value = "";
                                      await appController.pickFile();
                                      if (appController
                                          .fileName.value.isNotEmpty) {
                                        if (appController.videoBytes != null) {
                                          appController.analyzeVideo(
                                              appController.videoBytes!,
                                              appController.mimeType!);
                                        }
                                      }
                                    },
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
                          );
                  }),
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
