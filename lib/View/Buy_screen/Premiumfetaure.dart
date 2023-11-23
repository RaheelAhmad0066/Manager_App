import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gerentea/core/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:gerentea/core/app_export.dart';
import 'package:gerentea/widgets/custom_elevated_button.dart';
import 'package:pay/pay.dart';

import '../../Controler/AnimationControler/Animationcontroler.dart';
import '../../payment_config.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/Appbar/Appbar_title.dart';

import '../../widgets/coustom_ratingbar.dart';
import 'package:animations/animations.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  String os = Platform.operatingSystem;

  final MyAnimationController animationcont = Get.put(MyAnimationController());

  var selectedprice = 47.99;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.green700,
          title: AppbarTitle(
            text: "bypremium".tr,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: SizedBox(
            width: 441.h,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 27.h,
                      vertical: 16.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 12.h,
                            top: 130.v,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.h,
                            vertical: 8.v,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffDEFFDA),
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Yearly".tr,
                                  style: CustomTextStyles
                                      .titleLargeLexendDecaGreen700,
                                ),
                              ),
                              Divider(
                                color: appTheme.green700,
                                thickness: 1,
                              ),
                              SizedBox(height: 16.v),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "€ 49.99",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 1.h,
                                        top: 25.v,
                                        bottom: 2.v,
                                      ),
                                      child: Text(
                                        "yearly".tr,
                                        style: CustomTextStyles
                                            .titleLargeActorGreen700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.h,
                                  top: 20.v,
                                ),
                                child: Text(
                                  "features:".tr,
                                  style: CustomTextStyles
                                      .titleLargeLexendDecaGreen700,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 47.99,
                                    groupValue: selectedprice,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedprice = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'unlimited'.tr,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    activeColor: Colors.green,
                                    value: 97.99,
                                    groupValue: selectedprice,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedprice = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'unli'.tr,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 82.v),
                              Center(
                                child: RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 3,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              SizedBox(height: 12.v),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Column(
                          children: [
                            AnimatedBuilder(
                                animation: animationcont.controller,
                                builder: (context, child) {
                                  return FadeScaleTransition(
                                      animation: animationcont.controller,
                                      child: child);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                      child: Platform.isIOS
                                          ? ApplePayButton(
                                              paymentConfiguration:
                                                  PaymentConfiguration
                                                      .fromJsonString(
                                                          defaultApplePay),
                                              paymentItems: [
                                                PaymentItem(
                                                  label: 'Premium Version',
                                                  amount:
                                                      selectedprice.toString(),
                                                  status: PaymentItemStatus
                                                      .final_price,
                                                ),
                                                PaymentItem(
                                                  label: 'Total',
                                                  amount:
                                                      selectedprice.toString(),
                                                  status: PaymentItemStatus
                                                      .final_price,
                                                )
                                              ],
                                              style: ApplePayButtonStyle.black,
                                              width: double.infinity,
                                              height: 50,
                                              type: ApplePayButtonType.buy,
                                              margin: const EdgeInsets.only(
                                                  top: 15.0),
                                              onPaymentResult: (result) =>
                                                  debugPrint(
                                                      'Payment Result $result'),
                                              loadingIndicator: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          : GooglePayButton(
                                              paymentConfiguration:
                                                  PaymentConfiguration
                                                      .fromJsonString(
                                                          defaultGooglePay),
                                              paymentItems: [
                                                PaymentItem(
                                                  label: 'Premium {Version}',
                                                  amount:
                                                      selectedprice.toString(),
                                                  status: PaymentItemStatus
                                                      .final_price,
                                                ),
                                                PaymentItem(
                                                  label: 'Total',
                                                  amount:
                                                      selectedprice.toString(),
                                                  status: PaymentItemStatus
                                                      .final_price,
                                                ),
                                              ],
                                              type: GooglePayButtonType.pay,
                                              margin: const EdgeInsets.only(
                                                  top: 15.0),
                                              onPaymentResult: (result) =>
                                                  debugPrint(
                                                      'Payment Result $result'),
                                              loadingIndicator: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )),
                                )),
                            CustomElevatedButton(
                              onTap: () {
                                final isComplete =
                                    animationcont.isAnimationComplete;
                                if (isComplete) {
                                  animationcont.controller.reverse();
                                } else {
                                  animationcont.controller.forward();
                                }
                                ;
                              },
                              width: 187.h,
                              text: "continue".tr,
                              buttonStyle: CustomButtonStyles.fillGreenTL6,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 58.h,
                            top: 16.v,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "terms".tr,
                                  style: CustomTextStyles.bodyLargeBlack900_1
                                      .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: "an".tr,
                                  style: CustomTextStyles.bodyLargeBlack900_1,
                                ),
                                TextSpan(
                                  text: "Privacy Policy".tr,
                                  style: CustomTextStyles.bodyLargeBlack900_1
                                      .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}



// import this Package in pubspec.yaml file
// dependencies:
// 
//   animator: ^2.0.2

