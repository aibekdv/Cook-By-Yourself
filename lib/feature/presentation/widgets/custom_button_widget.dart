import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color color;
  final Widget title;
  final VoidCallback? onTap;
  final bool? isWelcome;

  const CustomButtonWidget({
    super.key,
    required this.color,
    required this.title,
    this.onTap,
    this.isWelcome = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        enableFeedback: false,
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: color,
        disabledBackgroundColor: greyColor,
        shape: isWelcome!
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
      ),
      child: title,
    );
  }
}
