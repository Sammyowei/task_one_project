import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_one_project/widgets/widgets.dart';

class CustomContainer extends ConsumerWidget {
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? titleColor;
  final Color? subTitleColor;
  final String? title;
  final double? titleTextSize;
  final String? subTitle;
  final double? subtitleTextSize;
  final bool enabled;
  final String? iconPath;
  final Color? iconColor;
  final Color? circularAvaterBg;
  final FontWeight? titleWeight;
  final FontWeight? subTitleWeight;
  const CustomContainer({
    this.titleTextSize,
    this.subtitleTextSize,
    this.subTitleWeight,
    this.titleWeight,
    this.titleColor,
    this.subTitleColor,
    this.enabled = false,
    this.circularAvaterBg,
    this.iconColor,
    this.iconPath,
    this.title,
    this.subTitle,
    this.borderRadius,
    this.width,
    this.height,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: height ?? 200.0,
      width: width ?? 200.0,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title ?? 'title',
                  fontSize: titleTextSize ?? 30.0,
                  textColor: titleColor ?? Colors.black,
                  fontWeight: titleWeight ?? FontWeight.w500,
                ),
                CustomText(
                  text: subTitle ?? '',
                  fontSize: subtitleTextSize ?? 15.5,
                  textColor: subTitleColor ?? Colors.black,
                  fontWeight: subTitleWeight ?? FontWeight.w500,
                ),
              ],
            ),
          ),
          enabled
              ? CircleAvatar(
                  radius: 30,
                  backgroundColor: circularAvaterBg,
                  child: Image.asset(
                    iconPath ?? '',
                    color: iconColor,
                    height: 30.0,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
