part of 'widgets_imports.dart';

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
