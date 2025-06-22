part of 'widgets_imports.dart';

class HeaderHistoryAttendance extends StatefulWidget {
  final bool? isNotificationShown;
  final void Function()? onNotificationTap;
  final void Function()? onHistoryTap;
  const HeaderHistoryAttendance({
    super.key,
    this.isNotificationShown,
    this.onNotificationTap,
    this.onHistoryTap,
  });

  @override
  State<HeaderHistoryAttendance> createState() =>
      _HeaderHistoryAttendanceState();
}

class _HeaderHistoryAttendanceState extends State<HeaderHistoryAttendance> {
  DateTime? selectedDate;

  List<DateTime> getCurrentWeekFromMondayToToday() {
    final today = DateTime.now();
    final currentWeekday = today.weekday; // Monday = 1, Sunday = 7
    final monday = today.subtract(Duration(days: currentWeekday - 1));
    return List.generate(
      currentWeekday,
      (index) => monday.add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = getCurrentWeekFromMondayToToday();
    final now = DateTime.now();
    final current = selectedDate ?? now;
    final dayNumber = current.day;
    final dayName = DateFormat('E').format(current);
    final month = DateFormat('MMM').format(current);
    final year = current.year;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Iconify(
                        Ic.baseline_arrow_back_ios,
                        color: HelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                widget.isNotificationShown == true
                    ? GestureDetector(
                        onTap: widget.onNotificationTap,
                        child: _iconContainer(
                          Ion.md_notifications_outline,
                          context,
                        ),
                      )
                    : GestureDetector(
                        onTap: widget.onHistoryTap,
                        child: _iconContainer(Ic.round_history, context),
                      ),
              ],
            ),
          ),

          // Date container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: HelperFunctions.isDarkMode(context)
                  ? AppColors.darkContainer
                  : AppColors.lightContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      dayNumber.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dayName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              month,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(width: 3),
                            Text(
                              year.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 35),
                if (selectedDate != null &&
                    selectedDate!.day == now.day &&
                    selectedDate!.month == now.month &&
                    selectedDate!.year == now.year)
                  Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Today",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekDays.length,
              itemBuilder: (_, index) {
                final date = weekDays[index];
                final dayNameShort = DateFormat('EEE').format(date);
                final dayNumber = date.day.toString();
                final isSelected =
                    selectedDate != null &&
                    selectedDate!.day == date.day &&
                    selectedDate!.month == date.month &&
                    selectedDate!.year == date.year;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                    });

                    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
                    final parsedDate = DateTime.parse(formattedDate);

                    context
                        .read<GetAttendanceByDateCubit>()
                        .getAttendanceByDate(date: parsedDate);

                    context
                        .read<GetCountOfAttendanceStatusCubit>()
                        .getCountOfAttendanceByDate(date: parsedDate);

                    print("Selected Date: $parsedDate");
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dayNameShort.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.textGrey,
                              ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          dayNumber,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.textPrimary,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // Extracted icon container for cleanliness
  Widget _iconContainer(String icon, BuildContext context) {
    return Container(
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
        icon,
        color: HelperFunctions.isDarkMode(context)
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}
