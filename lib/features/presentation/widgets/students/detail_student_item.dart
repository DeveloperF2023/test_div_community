part of 'widgets_imports.dart';

class DetailStudentItem extends StatelessWidget {
  final StudentEntity student;
  const DetailStudentItem({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: HelperFunctions.screenHeight(context) * .06,
          floating: false,
          pinned: true,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: HeaderStudentProfile(
              title: 'Profile',
              onNavigate: () => Navigator.pushNamed(context, AppRoutes.main),
              onNavigateToNotification: () =>
                  Navigator.pushNamed(context, AppRoutes.notifications),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor.withValues(alpha: 0.2),
                        width: 1.2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          "${EndpointsConstants.imageUrl}${student.profilePicture}",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocProvider(
                    create: (context) =>
                        locator<GetCountOfAttendanceForStudentCubit>()
                          ..getCountOfAttendanceOfStudentId(
                            studentId: student.id!,
                          ),
                    child:
                        BlocBuilder<
                          GetCountOfAttendanceForStudentCubit,
                          GetCountOfAttendanceForStudentState
                        >(
                          builder: (context, state) {
                            if (state
                                is GetCountOfAttendanceForStudentLoading) {
                              return CustomerShimmer(
                                height:
                                    HelperFunctions.screenHeight(context) * .1,
                                width: HelperFunctions.screenWidth(context),
                              );
                            } else if (state
                                is GetCountOfAttendanceForStudentLoaded) {
                              return CountStatusAttendance(
                                statusCount: state.attendanceOfStudent,
                                backgroundColor:
                                    HelperFunctions.isDarkMode(context)
                                    ? AppColors.darkContainer
                                    : AppColors.lightContainer,
                              );
                            } else if (state
                                is GetCountOfAttendanceForStudentFailure) {
                              return Center(
                                child: Text("Error:${state.message}"),
                              );
                            }
                            return Container();
                          },
                        ),
                  ),
                  PersonalInformationItem(student: student),
                  SizedBox(height: 10),
                  ContactItem(phone: student.phone!),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
