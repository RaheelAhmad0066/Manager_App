import 'package:gerentea/View/welcome_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gerentea/core/app_export.dart';
import 'package:gerentea/widgets/custom_elevated_button.dart';

import 'package:gerentea/widgets/custom_text_form_field.dart';
import '../../core/utils/image_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

import '../../Controler/GoogleAuth/GoogleAuth.dart';
import '../../Controler/Loader/Loader.dart';
import '../../models/usermodal.dart';
import '../forgot_password_screen/forgot_password_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

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
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: h1 * 0.05),
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
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: appTheme.green700,
                              fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: h1 * 0.05,
                  ),
                  CustomTextFormField(
                    controller: EmailControler,
                    hintText: "entemail".tr,
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal: 9.h),
                  ),
                  SizedBox(
                    height: h1 * 0.04,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Enetpas".tr,
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 9.h),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(ForgotPasswordScreen());
                      },
                      child: Text(
                        "Forget".tr,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: appTheme.green700,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You do not have an account please".tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: appTheme.gray400,
                                  fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(SignUpScreen());
                            },
                            child: Text(
                              "Sign".tr,
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
