import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 28,
        color: GrayColor.color10,
      ),
      onPressed: onPressed,
      splashRadius: 25,
    );
  }
}
