import 'package:flutter/material.dart';

import 'package:gerentea/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';

import 'package:gerentea/core/utils/size_utils.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/Appbar/Appbar_title.dart';
import '../../widgets/Appbar/Custom_appbar.dart';
import '../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ChatBotScreen extends StatelessWidget {
  ChatBotScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController promptoneController = TextEditingController();

  TextEditingController greetingoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          centerTitle: true,
          title: AppbarTitle(
            text: "Talk with Gerente-A",
          ),
          styleType: Style.bgShadow,
        ),
        body: Container(
          width: 441.h,
          padding: EdgeInsets.symmetric(
            horizontal: 13.h,
            vertical: 58.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: greetingoneController,
                margin: EdgeInsets.symmetric(horizontal: 3.h),
                hintText: "Hello ! there",
                alignment: Alignment.centerRight,
                contentPadding: EdgeInsets.all(21.h),
                borderDecoration: CustomTextFormField.fillGreen,
                fillColor: appTheme.green700,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 26.v,
                  right: 41.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 21.h,
                          vertical: 18.v,
                        ),
                        decoration:
                            AppDecoration.fillSecondaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL19,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 3.v),
                            SizedBox(
                              width: 218.h,
                              child: Text(
                                "Hello there! How may I assist you today?",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyLargeInterOnErrorContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 3.v,
                        bottom: 23.v,
                      ),
                      child: Column(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgShare,
                            height: 21.adaptSize,
                            width: 21.adaptSize,
                          ),
                          SizedBox(height: 13.v),
                          CustomImageView(
                            svgPath:
                                ImageConstant.imgIconshareOnprimarycontainer,
                            height: 21.adaptSize,
                            width: 21.adaptSize,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 303.h,
                  margin: EdgeInsets.only(
                    left: 3.h,
                    top: 26.v,
                    right: 3.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.h,
                    vertical: 20.v,
                  ),
                  decoration: AppDecoration.fillGreen.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL191,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 3.v),
                      Text(
                        "Show me what can you do?",
                        style: CustomTextStyles.bodyLargeInter,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 26.v,
                  right: 41.h,
                  bottom: 5.v,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 21.h,
                          vertical: 19.v,
                        ),
                        decoration:
                            AppDecoration.fillSecondaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL19,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 4.v),
                            SizedBox(
                              width: 291.h,
                              child: Text(
                                "As an AI language model, I can generate text for various purposes such as :\n\nWriting articles, essays and reports on various topics.\nGenerating product descriptions and reviews.\nTra|",
                                maxLines: 9,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyLargeInterOnErrorContainer
                                    .copyWith(
                                  height: 1.25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 9.v,
                        bottom: 159.v,
                      ),
                      child: Column(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgShare,
                            height: 21.adaptSize,
                            width: 21.adaptSize,
                          ),
                          SizedBox(height: 13.v),
                          CustomImageView(
                            svgPath:
                                ImageConstant.imgIconshareOnprimarycontainer,
                            height: 21.adaptSize,
                            width: 21.adaptSize,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            left: 13.h,
            right: 10.h,
            bottom: 14.v,
          ),
          decoration: AppDecoration.fillGreen.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL40,
          ),
          child: CustomTextFormField(
            controller: promptoneController,
            hintText: "Type your question here",
            hintStyle: theme.textTheme.titleLarge!,
            textInputAction: TextInputAction.done,
            suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 14.v, 17.h, 12.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgSendicon3,
                height: 37.v,
                width: 41.h,
                color: Colors.black,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 63.v,
            ),
          ),
        ),
      ),
    );
  }
}
