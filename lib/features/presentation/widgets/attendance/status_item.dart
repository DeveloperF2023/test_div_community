part of 'widgets_imports.dart';

class StatusItem extends StatelessWidget {
  final String title;
  final String status;
  final String icon;
  final Color iconColor;
  const StatusItem({
    super.key,
    required this.status,
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
      child: SizedBox(
        width: HelperFunctions.screenWidth(context) * .28,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Iconify(icon, color: iconColor, size: 18),
                SizedBox(width: 5),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: HelperFunctions.isDarkMode(context)
                        ? AppColors.textWhite
                        : AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
            Text(status, style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
