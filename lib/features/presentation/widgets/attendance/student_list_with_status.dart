part of 'widgets_imports.dart';

class StudentListWithStatus extends StatelessWidget {
  final List<AttendanceByDateEntity> attendanceByDate;
  const StudentListWithStatus({super.key, required this.attendanceByDate});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Student')),
        DataColumn(label: Text('Status')),
      ],
      rows: attendanceByDate.map((attendance) {
        final student = attendance.student;
        return DataRow(
          cells: [
            DataCell(
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${EndpointsConstants.imageUrl}${student!.profilePicture}",
                    ),
                    radius: 15,
                  ),
                  SizedBox(width: 8),
                  Text('${student.firstName} ${student.lastName}'),
                ],
              ),
            ),
            DataCell(Text(attendance.status!.toUpperCase())),
          ],
        );
      }).toList(),
    );
  }
}
