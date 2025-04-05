import 'dart:io';
import 'dart:typed_data';

import 'package:deepfake_video_detection/controller/appController.dart';
import 'package:deepfake_video_detection/screens/result/result_screen.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_elevated_button.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class FilePickTile extends StatelessWidget {
  FilePickTile({super.key});

  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 314,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Color(0xFF444242).withOpacity(0.6),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.white,
            strokeWidth: 1,
            dashPattern: [8, 4],
            radius: Radius.circular(5),
            child: GestureDetector(
              onTap: () {
                appController.pickFile();
              },
              child: Container(
                width: 282,
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/upload_to_cloud.svg"),
                    const SizedBox(height: 10),
                    CustomText(
                      text: "Browse Files to upload",
                      fontweight: FontWeight.w400,
                      fontColor: Colors.white.withOpacity(0.75),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 13),
          Container(
            height: 40,
            width: 282,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9).withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Obx(
                () {
                  return CustomText(
                    text: appController.fileName.value.isEmpty
                        ? "No selected files"
                        : appController.fileName.value,
                    fontColor: Colors.black,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 282,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  onPressed: () {},
                  label: "CANCEL",
                  backgroundColor: Colors.white,
                  height: 40,
                  width: 135,
                  borderRadius: 5,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    // print(appController.videoPath.value.split('/').last);
                    if (appController.videoBytes != null) {
                      appController.analyzeVideo(
                          appController.videoBytes!, appController.mimeType!);

                      Get.to(() => ResultScreen());
                    }
                  },
                  label: "ANALYSE",
                  backgroundColor: Colors.red,
                  labelColor: Colors.white,
                  height: 40,
                  width: 135,
                  borderRadius: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
