import 'package:deepfake_video_detection/screens/main/main_screen.dart';
import 'package:deepfake_video_detection/screens/main/widgets/file_pick_tile.dart';
import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 127.w, top: 225.h),
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
              ),
              Center(
                child: Image(
                  image: AssetImage("assets/images/center_deepfake.png"),
                ),
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
              Positioned(
                bottom: 0,
                left: 0,
                child: FilePickTile(),
              ),
            ],
          );
  }
}