import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_div_community/core/routes/app_routes.dart';
import 'package:test_div_community/core/utils/helper_functions.dart';
import 'package:test_div_community/features/presentation/widgets/global/primary_button.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/static/slide_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // PageView only for background images
          PageView.builder(
            itemCount: contents.length,
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(contents[index].image),
                  ),
                ),
                child: Container(color: Colors.black38),
              );
            },
          ),

          Positioned(
            bottom: HelperFunctions.screenHeight(context) * 0.15,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor,
                            blurRadius: 50,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        AppAssets.logoDark,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Description
                SizedBox(
                  width: screenWidth * 0.95,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      contents[currentIndex].description,
                      key: ValueKey(currentIndex),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Next / Continue button
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.main);
              },
              child: PrimaryButton(
                textButton: "Get Started",
                onTap: () => Navigator.pushNamed(context, AppRoutes.main),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 5,
      width: currentIndex == index ? 15 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? AppColors.primaryColor
            : Colors.grey.shade600,
      ),
    );
  }
}
