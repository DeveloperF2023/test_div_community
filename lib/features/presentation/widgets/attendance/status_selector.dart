part of 'widgets_imports.dart';

class StatusSelector extends StatefulWidget {
  final int studentId;
  final Map<int, String> attendanceMap;
  final Function(Map<int, String>) onChanged;

  const StatusSelector({
    super.key,
    required this.studentId,
    required this.attendanceMap,
    required this.onChanged,
  });

  @override
  State<StatusSelector> createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  final Map<String, String> statusMap = {
    'P': 'present',
    'A': 'absent',
    'L': 'late',
  };

  List<String> get displayKeys => statusMap.keys.toList();

  @override
  Widget build(BuildContext context) {
    final currentStatus = widget.attendanceMap[widget.studentId];
    return SizedBox(
      height: 35,
      child: ToggleButtons(
        isSelected: displayKeys
            .map((shortKey) => statusMap[shortKey] == currentStatus)
            .toList(),
        onPressed: (index) {
          final selectedKey = displayKeys[index];
          setState(() {
            widget.attendanceMap[widget.studentId] = statusMap[selectedKey]!;
          });
          widget.onChanged(widget.attendanceMap);
          print("Submitting attendance:");
        },
        borderRadius: BorderRadius.circular(8),
        selectedColor: Colors.white,
        color: HelperFunctions.isDarkMode(context)
            ? AppColors.textWhite
            : AppColors.textPrimary,
        fillColor: AppColors.primaryColor,
        children: displayKeys
            .map(
              (shortKey) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(shortKey),
              ),
            )
            .toList(),
      ),
    );
  }
}
