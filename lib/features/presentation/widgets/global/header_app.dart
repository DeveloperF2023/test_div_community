import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:test_div_community/core/constants/app_assets.dart';
import 'package:test_div_community/core/utils/helper_functions.dart';

class HeaderApp extends StatelessWidget {
  final bool? isNotificationShown;
  final void Function()? onNotificationTap;
  final void Function()? onHistoryTap;
  const HeaderApp({
    super.key,
    this.isNotificationShown = true,
    this.onNotificationTap,
    this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(AppAssets.logoDark),
              ),
              SizedBox(width: 10),
              Text(
                "Learn Unity",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          isNotificationShown == true
              ? GestureDetector(
                  onTap: onNotificationTap,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: HelperFunctions.isDarkMode(context)
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Iconify(
                      Ion.md_notifications_outline,
                      color: HelperFunctions.isDarkMode(context)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: onHistoryTap,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: HelperFunctions.isDarkMode(context)
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Iconify(
                      Ic.round_history,
                      color: HelperFunctions.isDarkMode(context)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
