import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../View/Homepage/home_page.dart';

class CoustomLoader extends GetxController {
  RxBool isloading = false.obs;
  RxBool isloader = false.obs;
  RxBool user = false.obs;
  RxBool userdata = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void loader() async {
    isloading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isloading.value = false;
  }

  void Googleauth() async {
    isloader.value = true;
    await Future.delayed(Duration(seconds: 3));
    isloader.value = false;
  }

  void userdataa() async {
    userdata.value = true;
    await Future.delayed(Duration(seconds: 3));
    Get.to(HomePage());
    userdata.value = false;
  }
}
