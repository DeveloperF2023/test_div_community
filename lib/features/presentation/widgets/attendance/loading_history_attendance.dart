part of 'widgets_imports.dart';

class LoadingCountStatusAttendance extends StatelessWidget {
  final double? height;
  final double? width;
  final Axis? scrollDirection;
  const LoadingCountStatusAttendance({
    super.key,
    this.height,
    this.width,
    this.scrollDirection = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            LoadingCountStatusShimmer(
              height: HelperFunctions.screenHeight(context) * .1,
              width: HelperFunctions.screenWidth(context),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingHistoryAttendance extends StatelessWidget {
  final double? height;
  final double? width;
  final Axis? scrollDirection;
  const LoadingHistoryAttendance({
    super.key,
    this.height,
    this.width,
    this.scrollDirection = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            LoadingCountStatusShimmer(
              height: HelperFunctions.screenHeight(context) * .5,
              width: HelperFunctions.screenWidth(context),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingCountStatusShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  const LoadingCountStatusShimmer({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: HelperFunctions.isDarkMode(context)
              ? AppColors.darkContainer
              : Colors.grey.shade300, // base color of the shimmer
          borderRadius: BorderRadius.circular(16), // customize as needed
        ),
      ),
    );
  }
}
