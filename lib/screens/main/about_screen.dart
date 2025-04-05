import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomText(
              text: "Welcome to our Deepfake Video Detection Project!",
              fontSize: 24.spMax,
            ),
          ),
          CustomText(
            text: "How it works",
            fontSize: 20.spMax,
            fontColor: Colors.red,
          ),
          CustomText(
            text:
                "     1.Frame Extraction: The uploaded video is broken down into individual frames.",
            fontSize: 16.spMax,
          ),
          CustomText(
            text:
                "     2.Preprocessing: Each frame is processed to normalize facial features.",
            fontSize: 16.spMax,
          ),
          CustomText(
            text:
                "     3.Feature Analysis: Using LSTM, the model analyzes the temporal consistency across sequences of frames.",
            fontSize: 16.spMax,
          ),
          CustomText(
            text:
                "     4.Prediction: The system provides a prediction score indicating the likelihood that the video is a deepfake.",
            fontSize: 16.spMax,
          ),
        ],
      ),
    );
  }
}
