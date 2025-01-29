import 'package:deepfake_video_detection/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.height = 60,
    this.width = double.infinity,
    this.backgroundColor,
    this.icon,
    required this.label,
    this.labelColor = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.showBorder = false,
    this.borderColor,
    this.borderRadius = 10,
  });
  final void Function() onPressed;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Widget? icon;
  final String label;
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool showBorder;
  final Color? borderColor;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: showBorder
              ? BorderSide(
                  width: 1,
                  color: borderColor ?? Colors.transparent,
                )
              : BorderSide.none,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) SizedBox(width: 8),
            CustomText(
              text: label,
              fontSize: fontSize,
              fontColor: labelColor,
              fontweight: fontWeight,
            ),
          ],
        ),
      ),
    );
  }
}
