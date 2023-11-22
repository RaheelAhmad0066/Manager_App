import 'package:gerentea/View/welcome_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gerentea/core/app_export.dart';
import 'package:gerentea/widgets/custom_elevated_button.dart';
import 'package:gerentea/widgets/custom_outlined_button.dart';
import 'package:gerentea/widgets/custom_text_form_field.dart';
import '../../core/utils/image_constant.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../Controler/GoogleAuth/GoogleAuth.dart';
import '../../Controler/Loader/Loader.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController EmailControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CoustomLoader myController = Get.put(CoustomLoader());
  final AuthController controller = Get.put(AuthController());

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgApplogo2,
                    height: 217.v,
                    width: 140.h,
                    alignment: Alignment.topLeft,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "welcome".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 13)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "enter".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  CustomTextFormField(
                    controller: EmailControler,
                    margin: EdgeInsets.only(
                      left: 32.h,
                      top: 64.v,
                      right: 28.h,
                    ),
                    hintText: "entemail".tr,
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal: 9.h),
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    margin: EdgeInsets.only(
                      left: 26.h,
                      top: 40.v,
                      right: 34.h,
                    ),
                    hintText: "Enetpas".tr,
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 9.h),
                  ),
                  SizedBox(height: 97.v),
                  myController.isloading.value
                      ? CircularProgressIndicator(
                          color: Colors.lightGreenAccent,
                        )
                      : CustomElevatedButton(
                          onTap: () async {
                            _formKey.currentState!.validate();
                            if (_formKey.currentState!.validate()) {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: EmailControler.text,
                                  password: passwordController.text,
                                );

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            WelcomeScreen())),
                                    (route) => false);

                                Get.snackbar('Good', 'Succfully Login');
                              } catch (e) {
                                Get.snackbar('Error', 'User not Login');
                              }
                              myController.loader();
                            }
                          },
                          height: 41.v,
                          width: 192.h,
                          text: "Logi".tr,
                          buttonStyle: CustomButtonStyles.fillGreenTL20,
                          buttonTextStyle:
                              CustomTextStyles.headlineMediumOnPrimaryContainer,
                        ),
                  SizedBox(height: 12.v),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Get.to(WelcomeScreen());
                        },
                        child: Text('Forgotten Passwoard?',
                            style: CustomTextStyles.bodyLarge16)),
                  ),
                  SizedBox(height: 2.v),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Or",
                          style: theme.textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: " ",
                        ),
                        TextSpan(
                          text: "new".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 18.v),
                  myController.isloader.value
                      ? CircularProgressIndicator(
                          color: Colors.green,
                        )
                      : CustomOutlinedButton(
                          onTap: () {
                            myController.Googleauth();
                            controller.handleSignInAndNavigateToHome(context);
                          },
                          width: 224.h,
                          text: "continue".tr,
                          leftIcon: Container(
                            margin: EdgeInsets.only(right: 2.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgGoogleicon1,
                              height: 29.adaptSize,
                              width: 29.adaptSize,
                            ),
                          ),
                        ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
