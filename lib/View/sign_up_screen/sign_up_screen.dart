import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gerentea/View/login_main_screen/login_main_screen.dart';
import 'package:gerentea/View/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:gerentea/core/app_export.dart';

import 'package:gerentea/widgets/custom_outlined_button.dart';
import 'package:gerentea/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../core/utils/image_constant.dart';

import '../../core/utils/size_utils.dart';
import '../../models/usermodal.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../Controler/GoogleAuth/GoogleAuth.dart';
import '../../Controler/Loader/Loader.dart';
import '../../widgets/custom_elevated_button.dart';
import '../sign_in_screen/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController controller = Get.put(AuthController());
  final cont = Get.put(registercontroler());
  final CoustomLoader myController = Get.put(CoustomLoader());
  void _validateEmail() {
    final email = cont.emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email is required';
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Invalid email format';
    } else {
      emailError.value = '';
    }
  }

  final emailError = RxString('');
  final passwordError = RxString('');
  void _validatePassword() {
    final password = cont.createpasswordController.text.trim();
    if (password.isEmpty) {
      passwordError.value = 'Password is required';
    } else if (password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h1 * 0.02,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgApplogo3,
                    height: 217.v,
                    width: 212.h,
                  ),
                  SizedBox(
                    height: h1 * 0.02,
                  ),
                  Text(
                    "createa".tr,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: appTheme.green700, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h1 * 0.04,
                  ),
                  CustomTextFormField(
                    controller: cont.userNameController,
                    hintText: "entnam".tr,
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    onsaved: (value) {
                      cont.userNameController.text = value;
                    },
                  ),
                  SizedBox(
                    height: h1 * 0.02,
                  ),
                  CustomTextFormField(
                    controller: cont.emailController,
                    hintText: "entemail".tr,
                    onChanged: (_) => emailError.value = '',
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    textInputType: TextInputType.emailAddress,
                    onsaved: (value) {
                      cont.userNameController.text = value;
                    },
                  ),
                  SizedBox(
                    height: h1 * 0.02,
                  ),
                  CustomTextFormField(
                    controller: cont.createpasswordController,
                    hintText: "Enetpas".tr,
                    textInputAction: TextInputAction.done,
                    onChanged: (_) => passwordError.value = 'error',
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
                    onsaved: (value) {
                      cont.userNameController.text = value;
                    },
                  ),
                  SizedBox(
                    height: h1 * 0.1,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () => cont.isLoading.value
                          ? CircularProgressIndicator(color: appTheme.green700)
                          : CustomElevatedButton(
                              onTap: () async {
                                _validateEmail();
                                _validatePassword();
                                cont.register(context);
                              },
                              height: 41.v,
                              width: 192.h,
                              text: "Sign".tr,
                              buttonStyle: CustomButtonStyles.fillGreenTL20,
                              buttonTextStyle: CustomTextStyles
                                  .headlineMediumOnPrimaryContainer,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: h1 * 0.02,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "OR".tr,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: appTheme.gray400, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: h1 * 0.02,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: myController.isloader.value
                        ? CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : CustomOutlinedButton(
                            buttonStyle: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      width: 2, color: appTheme.gray400)),
                            ),
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
                  ),
                  SizedBox(
                    height: h1 * 0.02,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "already".tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: appTheme.gray400,
                                  fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(SignInScreen());
                            },
                            child: Text(
                              "Logi".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: appTheme.green700,
                                      fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class adminservise {
  Future<void> signUp(String email, String password, String fullName) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // After successful signup, update the user's display name.
      User? user = FirebaseAuth.instance.currentUser;
      await user?.updateProfile(displayName: fullName);
      // Successful signup, you can navigate to the home screen.
    } catch (e) {
      // Handle signup errors
    }
  }
}
