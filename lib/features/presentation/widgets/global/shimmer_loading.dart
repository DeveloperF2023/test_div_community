part of 'widgets_imports.dart';

class CustomLoadingForStudentList extends StatelessWidget {
  final double? height;
  final double? width;
  final Axis? scrollDirection;
  const CustomLoadingForStudentList({
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
        child: ListView.builder(
          itemCount: 7,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return LoadingStudentList();
          },
        ),
      ),
    );
  }
}

class LoadingStudentList extends StatelessWidget {
  const LoadingStudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomerShimmer(height: 60, width: 60, isCircle: true),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomerShimmer(
              height: 15,
              width: HelperFunctions.screenWidth(context) * .4,
              isCircle: false,
            ),
            CustomerShimmer(
              height: 15,
              width: HelperFunctions.screenWidth(context) * .3,
              isCircle: false,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomerShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? isCircle;
  const CustomerShimmer({super.key, this.height, this.width, this.isCircle});

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
          shape: isCircle == true ? BoxShape.circle : BoxShape.rectangle,
          color: HelperFunctions.isDarkMode(context)
              ? AppColors.darkContainer
              : Colors.grey.shade300,
          borderRadius: isCircle == true ? null : BorderRadius.circular(16),
        ),
      ),
    );
  }
}
