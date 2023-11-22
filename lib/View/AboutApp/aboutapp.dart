import 'package:gerentea/core/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_helper.dart';

class AboutScreen extends StatelessWidget {
  Future<String> getAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return 'App Version: ${packageInfo.version}\nAuthor: Your Name';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Aboutapp'.tr,
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: appTheme.green700,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  'Aboutappa'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'data'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        )));
  }
}
