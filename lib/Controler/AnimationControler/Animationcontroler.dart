import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController controller;

  @override
  void onInit() {
    controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    )..addStatusListener((status) {
        update(); // Trigger a redraw when the animation status changes
      });
    super.onInit();
  }

  bool get isAnimationComplete {
    switch (controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
