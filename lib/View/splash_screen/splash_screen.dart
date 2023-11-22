import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../core/constants/glitch.dart';
import '../Homepage/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  void initState() {
    islogin();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust the duration as needed
    )..repeat(); // This makes the animation repeat continuously

    _controller.forward();
    super.initState();
  }

  void islogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => HomePage())),
            (route) => false);
      });
    } else {
      Timer(const Duration(seconds: 8), () {
        Navigator.pushNamed(context, AppRoutes.loginMainScreen);
      });
    }
  }

  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 441.h,
          padding: EdgeInsets.symmetric(
            horizontal: 83.h,
            vertical: 50.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 93.v),
              SizedBox(
                height: 283.v,
                width: 274.h,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgApplogo1,
                      height: 274.adaptSize,
                      width: 274.adaptSize,
                      alignment: Alignment.topCenter,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 53.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Gerente",
                                style: theme.textTheme.displaySmall,
                              ),
                              TextSpan(
                                text: "-A",
                                style: CustomTextStyles.displaySmallBlueA100,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 280.h,
              ),
              Column(
                children: [
                  Center(
                    child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                        child: Image.asset(
                          'assets/images/rotate.png',
                          width: 80.v,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GlithEffect(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Loading",
                                style: CustomTextStyles
                                    .headlineMediumItimErrorContainer28,
                              ),
                              TextSpan(
                                text: "...",
                                style:
                                    CustomTextStyles.headlineMediumItimBlueA100,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
