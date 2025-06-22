import 'package:flutter/material.dart';
import 'package:test_div_community/core/utils/helper_functions.dart';

import '../../../../core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String textButton;
  final void Function()? onTap;
  const PrimaryButton({super.key, required this.textButton, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: HelperFunctions.screenHeight(context) * .07,
        width: HelperFunctions.screenWidth(context),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            textButton,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
