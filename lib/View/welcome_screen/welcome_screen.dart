import 'package:flutter/material.dart';
import 'package:gerentea/core/utils/size_utils.dart';
// import 'package:raheel_s_application2/View/Chatbott_Screen/Chatboot_screen.dart';
import 'package:gerentea/widgets/custom_icon_button.dart';
import 'package:get/get.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

import '../Homepage/home_page.dart';

//WelcomeScreen
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPageIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    OnboardingPage(
        image: 'assets/Businessdeal.png',
        text: 'Business Deal',
        detail:
            'The deal is usually carried out between a seller and a buyer to exchange items of value such as goods, services, information, and money'),
  ];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.green700,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToggleNextButton(
                  isLastPage: _currentPageIndex == _pages.length - 1,
                  onNextPressed: () {
                    if (_currentPageIndex < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;
  final String detail;

  OnboardingPage(
      {required this.image, required this.text, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 143.v),
            CustomImageView(
              imagePath: ImageConstant.imgIcons8bot512px,
              height: 202.adaptSize,
              width: 202.adaptSize,
            ),
            Container(
              width: 315.h,
              margin: EdgeInsets.only(
                top: 59.v,
                right: 85.h,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "start".tr,
                      style:
                          CustomTextStyles.headlineLargeOnPrimaryContainerBold,
                    ),
                    TextSpan(
                      text: "Gerente-A",
                      style: CustomTextStyles.headlineLargeOnPrimaryContainer,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 18.v),
            SizedBox(height: 18.v),
            Text(
              "lu".tr,
              style: CustomTextStyles.titleMediumInterOnPrimaryContainer,
            ),
            SizedBox(height: 18.v),
            SizedBox(height: 98.v),
          ]),
    );
  }
}

class ToggleNextButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onNextPressed;

  ToggleNextButton({required this.isLastPage, required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.adaptSize,
      width: 80.adaptSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 80.adaptSize,
              width: 80.adaptSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  40.h,
                ),
                border: Border.all(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 1.h,
                ),
              ),
            ),
          ),
          CustomIconButton(
            onTap: () {
              if (isLastPage) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: ((context) => HomePage())),
                    (route) => false);
              } else {
                onNextPressed();
              }
            },
            height: 55.adaptSize,
            width: 55.adaptSize,
            padding: EdgeInsets.all(16.h),
            alignment: Alignment.center,
            child: CustomImageView(
              svgPath: ImageConstant.imgArrowright,
            ),
          ),
        ],
      ),
    );
  }
}
