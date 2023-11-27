import 'package:flutter/material.dart';
import 'package:gerentea/core/app_export.dart';
import 'package:gerentea/core/utils/size_utils.dart';
import 'package:gerentea/widgets/custom_elevated_button.dart';
import 'package:gerentea/widgets/custom_outlined_button.dart';
import 'package:get/get.dart';

import '../../core/utils/image_constant.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

class LoginMainScreen extends StatelessWidget {
  const LoginMainScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: h1 * 0.05,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgApplogo1,
                height: h1 * 0.2,
                width: w1 * 0.3,
              ),
              SizedBox(
                height: h1 * 0.05,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "ragister".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                    TextSpan(
                      text: "Gerente-A",
                      style: CustomTextStyles.headlineLargeRegular,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: h1 * 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: w1 * 0.4,
                    child: CustomElevatedButton(
                      buttonStyle: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appTheme.green700)),
                      onTap: (() {
                        Navigator.pushNamed(context, AppRoutes.signUpScreen);
                      }),
                      text: "reg".tr,
                    ),
                  ),
                  Container(
                    width: w1 * 0.4,
                    child: CustomOutlinedButton(
                      onTap: (() {
                        Navigator.pushNamed(context, AppRoutes.signInScreen);
                      }),
                      height: 55.v,
                      text: "Logi".tr,
                      margin: EdgeInsets.only(left: 12.h),
                      buttonStyle: CustomButtonStyles.outlineGreen,
                      buttonTextStyle:
                          CustomTextStyles.headlineMediumJostGreen700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h1 * 0.1,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "aa".tr,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "Logi".tr,
                      style: CustomTextStyles.titleLargeLexendDecaGreen700
                          .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
