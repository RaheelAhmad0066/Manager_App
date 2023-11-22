import 'package:gerentea/View/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:gerentea/core/app_export.dart';

import 'package:gerentea/widgets/custom_outlined_button.dart';
import 'package:gerentea/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../core/utils/image_constant.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../Controler/GoogleAuth/GoogleAuth.dart';
import '../../Controler/Loader/Loader.dart';
import '../../widgets/custom_elevated_button.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController createpasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController controller = Get.put(AuthController());

  final CoustomLoader myController = Get.put(CoustomLoader());
  void _validateEmail() {
    final email = emailController.text.trim();
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
    final password = createpasswordController.text.trim();
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
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: 441.h,
            padding: EdgeInsets.symmetric(vertical: 60.v),
            child: Obx(
              () => Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 241.v,
                      width: 233.h,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "createa".tr,
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgApplogo3,
                            height: 217.v,
                            width: 212.h,
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: userNameController,
                    margin: EdgeInsets.only(
                      left: 30.h,
                      top: 29.v,
                      right: 25.h,
                    ),
                    hintText: "entnam".tr,
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    margin: EdgeInsets.only(
                      left: 26.h,
                      top: 47.v,
                      right: 31.h,
                    ),
                    hintText: "entemail".tr,
                    onChanged: (_) => emailError.value = '',
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    textInputType: TextInputType.emailAddress,
                  ),
                  CustomTextFormField(
                    controller: createpasswordController,
                    margin: EdgeInsets.only(
                      left: 32.h,
                      top: 31.v,
                      right: 25.h,
                    ),
                    hintText: "Enetpas".tr,
                    textInputAction: TextInputAction.done,
                    onChanged: (_) => passwordError.value = 'error',
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
                  ),
                  SizedBox(height: 85.v),
                  Align(
                    alignment: Alignment.center,
                    child: myController.isloading.value
                        ? CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : CustomElevatedButton(
                            onTap: () async {
                              _validateEmail();
                              _validatePassword();
                              final auth = FirebaseAuth.instance;
                              final user = auth.currentUser;
                              user?.updateDisplayName(userNameController.text);
                              user?.updateEmail(emailController.text);
                              _formKey.currentState!.validate();
                              if (_formKey.currentState!.validate()) {
                                myController.loader();

                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: createpasswordController.text,
                                  );
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              WelcomeScreen())),
                                      (route) => false);
                                  Get.snackbar('Good', 'Succfully Ragisterd');
                                } catch (e) {
                                  Get.snackbar('Error', 'User not ragister');
                                }
                              }
                            },
                            height: 41.v,
                            width: 192.h,
                            text: "Sign".tr,
                            buttonStyle: CustomButtonStyles.fillGreenTL20,
                            buttonTextStyle: CustomTextStyles
                                .headlineMediumOnPrimaryContainer,
                          ),
                  ),
                  SizedBox(height: 15.v),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "already".tr,
                          style: CustomTextStyles.bodyMediumInter_1,
                        ),
                        TextSpan(
                          text: "Logi".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 29.v),
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
