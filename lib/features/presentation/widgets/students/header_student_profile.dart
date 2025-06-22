part of 'widgets_imports.dart';

class HeaderStudentProfile extends StatelessWidget {
  final void Function()? onNavigate;
  final String title;
  final void Function()? onNavigateToNotification;
  const HeaderStudentProfile({
    super.key,
    this.onNavigate,
    required this.title,
    this.onNavigateToNotification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: HelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onNavigate,
                  child: Iconify(
                    Ic.outline_arrow_back_ios,
                    size: 20,
                    color: HelperFunctions.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            GestureDetector(
              onTap: onNavigateToNotification,
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
            ),
          ],
        ),
      ),
    );
  }
}
