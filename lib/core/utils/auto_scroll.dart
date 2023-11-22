import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


void scrollToBottom(ScrollController controller) {
  if(controller.hasClients){
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeOut,);
    });
  }
}