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
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 441.h,
          padding: EdgeInsets.symmetric(horizontal: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgApplogo1,
                height: 227.v,
                width: 219.h,
              ),
              Container(
                width: 245.h,
                margin: EdgeInsets.only(
                  left: 3.h,
                  top: 53.v,
                  right: 1.h,
                ),
                child: RichText(
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
              ),
              SizedBox(height: 5.v),
              Text(
                "Do you have an account?",
                style: theme.textTheme.titleLarge,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
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
                  Expanded(
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
              SizedBox(height: 39.v),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "aa".tr,
                      style: CustomTextStyles.bodyLargeJostGray60001,
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "Logi".tr,
                      style: CustomTextStyles.titleMediumBold.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 35.v),
            ],
          ),
        ),
      ),
    );
  }
}
