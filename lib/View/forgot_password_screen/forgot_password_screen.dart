import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gerentea/core/app_export.dart';
import 'package:gerentea/widgets/custom_elevated_button.dart';
import 'package:gerentea/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gerentea/core/utils/size_utils.dart';
import '../../Controler/Loader/Loader.dart';
import '../../core/utils/image_constant.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CoustomLoader myController = Get.put(CoustomLoader());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: 441.h,
            padding: EdgeInsets.symmetric(
              horizontal: 40.h,
              vertical: 31.v,
            ),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgApplogo1,
                  height: 217.v,
                  width: 219.h,
                ),
                SizedBox(height: 44.v),
                Text(
                  "Forgot your password",
                  style: CustomTextStyles.headlineSmallActorBlack900,
                ),
                Container(
                  width: 255.h,
                  margin: EdgeInsets.only(
                    left: 50.h,
                    top: 6.v,
                    right: 55.h,
                  ),
                  child: Text(
                    "Enter your email and we will send you a code to reset your password.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 1.h,
                    top: 39.v,
                    bottom: 5.v,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.h,
                    vertical: 34.v,
                  ),
                  decoration: AppDecoration.outlineBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: CustomTextStyles.bodyMediumOnPrimaryContainer,
                      ),
                      SizedBox(height: 6.v),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: "@gmail.com",
                        textStyle: TextStyle(fontSize: 17, color: Colors.black),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 6.v),
                      Obx(
                        () => myController.isloading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : CustomElevatedButton(
                                onTap: () async {
                                  _formKey.currentState!.validate();
                                  if (_formKey.currentState!.validate()) {
                                    myController.loader();
                                    try {
                                      await FirebaseAuth.instance
                                          .sendPasswordResetEmail(
                                        email: emailController.text,
                                      );

                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          AppRoutes.loginMainScreen,
                                          (route) => false);
                                      Get.snackbar(
                                          'Good', 'Password is Updated');
                                    } catch (e) {
                                      Get.snackbar(
                                          'Error', 'Password is not Updated');
                                    }
                                  }
                                },
                                height: 44.v,
                                text: "Get code",
                                margin:
                                    EdgeInsets.fromLTRB(28.h, 37.v, 29.h, 19.v),
                                buttonStyle: CustomButtonStyles.fillGray,
                                buttonTextStyle: CustomTextStyles
                                    .bodyLargeAbhayaLibreExtraBoldOnPrimaryContainer,
                                alignment: Alignment.center,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
