import 'package:gerentea/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FAQScreen(),
    );
  }
}

class FAQScreen extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'faqQuest'.tr,
      answer: 'faqanswer'.tr,
    ),
    FAQItem(
      question: 'faqquest2'.tr,
      answer: 'feqanswer'.tr,
    ),
    FAQItem(
      question: 'faqquestion3'.tr,
      answer: 'faqanswer3'.tr,
    ),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faqtitle'.tr,
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
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          final item = faqItems[index];
          return ExpansionTile(
            textColor: Colors.black,
            title: Text(
              item.question,
              style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(item.answer),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
