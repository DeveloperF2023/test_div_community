part of 'widgets_imports.dart';

class PersonalInformationItem extends StatelessWidget {
  final StudentEntity student;
  const PersonalInformationItem({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsetsGeometry.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: HelperFunctions.isDarkMode(context)
            ? AppColors.darkContainer
            : AppColors.lightContainer,
      ),
      child: Column(
        children: [
          SingleInformationItem(
            title: "Name",
            dataRow: "${student.firstName} ${student.lastName}",
          ),
          Divider(
            color: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SingleInformationItem(
            title: "Classroom",
            dataRow: "${student.classroomName}",
          ),
          Divider(
            color: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SingleInformationItem(title: "Gender", dataRow: "${student.gender}"),
          Divider(
            color: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SingleInformationItem(
            title: "Birthday",
            dataRow: "${student.birthDate}",
          ),
          Divider(
            color: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SingleInformationItem(title: "Level", dataRow: "${student.level}"),
          Divider(
            color: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SingleInformationItem(
            title: "Section",
            dataRow: "${student.section}",
          ),
        ],
      ),
    );
  }
}
