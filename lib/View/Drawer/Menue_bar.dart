import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gerentea/core/constants/userdata.dart';
import 'package:gerentea/core/utils/size_utils.dart';

import '../../Controler/GoogleAuth/GoogleAuth.dart';
import '../../core/utils/image_constant.dart';
import '../../models/usermodal.dart';
import '../../routes/app_routes.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../AboutApp/aboutapp.dart';
import '../Buy_screen/Premiumfetaure.dart';
import '../Chat&Support/chatsupport.dart';
import '../FAQs/Faqs.dart';
import '../Privacypolicy/privacypolicy.dart';
import '../Homepage/home_page.dart';

class Menue_bar extends StatefulWidget {
  Menue_bar({
    Key? key,
  }) : super(key: key);

  @override
  State<Menue_bar> createState() => _Menue_barState();
}

class _Menue_barState extends State<Menue_bar> {
  final AuthController _controller = Get.put(AuthController());

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    // TODO: implement initState

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
                    backgroundColor: appTheme.gray400,
                    radius: 40,
                    child: user?.photoURL != null
                        ? Image.network(user!.photoURL.toString())
                        : Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.black,
                          ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.displayName ?? loggedInUser.firstName ?? 'Name...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        user?.email ?? loggedInUser.email ?? 'jk',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.signOut(context);
                      },
                      child: Container(
                        height: 34.h,
                        width: 140.v,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            'Logout'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(color: Colors.grey),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 33.v,
            ),
            child: InkWell(
              onTap: () {
                Get.to(HomePage());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.v,
                    width: 34.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.19,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 33.v,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: appTheme.green700.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                  22.h,
                                ),
                                border: Border.all(
                                  color: appTheme.green700.withOpacity(0.4),
                                  width: 1.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgFluenthome20filled,
                          height: 25.v,
                          width: 27.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 5.v,
                      bottom: 7.v,
                    ),
                    child: Text(
                      "Home".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 33.v,
            ),
            child: InkWell(
              onTap: () {
                Get.to(FAQScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.v,
                    width: 34.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.19,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 33.v,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: appTheme.green700.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                  22.h,
                                ),
                                border: Border.all(
                                  color: appTheme.green700.withOpacity(0.4),
                                  width: 1.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgFluentchat32filled,
                          height: 25.v,
                          width: 27.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 5.v,
                      bottom: 7.v,
                    ),
                    child: Text(
                      "FAQs".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 33.v,
            ),
            child: InkWell(
              onTap: () {
                Get.to(ChatScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.v,
                    width: 34.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.19,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 33.v,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: appTheme.green700.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                  22.h,
                                ),
                                border: Border.all(
                                  color: appTheme.green700.withOpacity(0.4),
                                  width: 1.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgClarityavatarsolid,
                          height: 25.v,
                          width: 27.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 5.v,
                      bottom: 7.v,
                    ),
                    child: Text(
                      "Chatsupport".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 33.v,
            ),
            child: InkWell(
              onTap: () {
                Get.to(AboutScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.v,
                    width: 34.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.19,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 33.v,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: appTheme.green700.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                  22.h,
                                ),
                                border: Border.all(
                                  color: appTheme.green700.withOpacity(0.4),
                                  width: 1.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgClarityavatarsolid,
                          height: 25.v,
                          width: 27.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 5.v,
                      bottom: 7.v,
                    ),
                    child: Text(
                      "Aboutapp".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 33.v,
            ),
            child: InkWell(
              onTap: (() {
                Navigator.pushNamed(context, AppRoutes.Buyscreen);
              }),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.v,
                    width: 34.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.19,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 33.v,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: appTheme.green700.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                  22.h,
                                ),
                                border: Border.all(
                                  color: appTheme.green700.withOpacity(0.4),
                                  width: 1.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgGlobe01,
                          height: 25.v,
                          width: 27.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 5.v,
                      bottom: 7.v,
                    ),
                    child: Text(
                      "Premium".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 33.v,
            ),
            child: InkWell(
              onTap: () {
                Get.to(PrivacyPolicyScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.v,
                    width: 34.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.19,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 33.v,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: appTheme.green700.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                  22.h,
                                ),
                                border: Border.all(
                                  color: appTheme.green700.withOpacity(0.4),
                                  width: 1.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgCisettingsfilled,
                          height: 25.v,
                          width: 27.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 5.v,
                      bottom: 7.v,
                    ),
                    child: Text(
                      "Privacy Policy".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
