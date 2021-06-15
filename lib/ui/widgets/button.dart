import 'package:dexito/ui/utilities/size_configration.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String txt;
  final Color? color;
  final Color? bColor;
  final Function() onPressed;
  MyButton({
    Key? key,
    required this.onPressed,
    required this.txt,
    this.color,
    this.bColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 6 * SizeConfig.heightMultiplier,
        width: 38 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF0BE07),
                Color(0xFFEB2E16),
                Color(0xFFFF02C9),
              ],
            ),
            color: bColor ?? Colors.red,
            borderRadius: BorderRadius.circular(
              5 * SizeConfig.heightMultiplier,
            )),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 2.5 * SizeConfig.heightMultiplier,
              fontWeight: FontWeight.bold,
              color: color ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
