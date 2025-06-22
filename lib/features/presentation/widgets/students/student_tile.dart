part of 'widgets_imports.dart';

class StudentTile extends StatelessWidget {
  final FilteredStudentEntity? student;
  const StudentTile({super.key, this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleProfilePicture(
                imageUrl:
                    "${EndpointsConstants.imageUrl}${student!.profilePicture}",
                height: 60,
                width: 60,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        student!.firstName!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        student!.lastName!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    student!.classroom!.name!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.detailStudent,
              arguments: student!.id,
            ),
            child: Iconify(
              Ic.sharp_keyboard_arrow_right,
              color: HelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
