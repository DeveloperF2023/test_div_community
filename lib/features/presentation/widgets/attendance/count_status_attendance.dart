part of 'widgets_imports.dart';

class CountStatusAttendance extends StatelessWidget {
  final AttendanceStatusCountEntity statusCount;
  final Color? backgroundColor;
  const CountStatusAttendance({
    super.key,
    required this.statusCount,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        backgroundColor ??
        (HelperFunctions.isDarkMode(context)
            ? AppColors.darkContainer
            : AppColors.lightContainer);
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          StatusItem(
            status: statusCount.present!,
            title: "Present",
            icon: Ph.user_duotone,
            iconColor: AppColors.success,
          ),
          SizedBox(
            height: HelperFunctions.screenHeight(context) * .05,
            width: 5,
            child: VerticalDivider(
              color: HelperFunctions.isDarkMode(context)
                  ? AppColors.darkContainer
                  : AppColors.lightContainer,
              thickness: 1,
            ),
          ),
          StatusItem(
            status: statusCount.absent!,
            title: "Absent",
            icon: Ic.outline_highlight_off,
            iconColor: AppColors.error,
          ),
          SizedBox(
            height: HelperFunctions.screenHeight(context) * .05,
            width: 5,
            child: VerticalDivider(
              color: HelperFunctions.isDarkMode(context)
                  ? AppColors.darkContainer
                  : AppColors.lightContainer,
              thickness: 1,
            ),
          ),
          StatusItem(
            status: statusCount.late!,
            title: "Late",
            icon: Ic.baseline_access_alarm,
            iconColor: AppColors.warning,
          ),
        ],
      ),
    );
  }
}
