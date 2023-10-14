import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  String? text;
  String? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButton({
    Key? key,
    this.text,
    this.icon,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(
        child: isIcon == false
            ? AppText(
                text: text!,
                color: color,
              )
            : SvgPicture.asset(
                "assets/icon/$icon.svg",
                height: 20,
                width: 20,
              ),
      ),
    );
  }
}
