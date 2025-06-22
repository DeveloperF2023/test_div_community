import 'package:flutter/material.dart';
import 'package:test_div_community/core/constants/app_assets.dart';
import 'package:test_div_community/core/utils/helper_functions.dart';
import 'package:test_div_community/features/presentation/widgets/global/primary_button.dart';

class CustomizableAlertDialog extends StatelessWidget {
  const CustomizableAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: HelperFunctions.screenWidth(context) * 0.85,
        constraints: const BoxConstraints(maxHeight: 400),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.checkMark, width: 60, height: 60),
              const SizedBox(height: 16),
              Text(
                "Attendance Submitted",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Attendance has been successfully submitted.",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                textButton: "OK",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
