import 'package:gerentea/core/app_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gerentea/core/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../../theme/theme_helper.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _recipientEmailController =
      TextEditingController();
  final TextEditingController _mailMessageController = TextEditingController();

  // Send Mail function
  void sendMail({
    required String recipientEmail,
    required String mailMessage,
  }) async {
    // change your email here
    String username = 'raheelahmad00669@gmail.com';
    // change your password here
    String password = 'vltmpkdjbfchgvgi';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Mail '
      ..text = 'Message: $mailMessage';

    try {
      await send(message, smtpServer);
      showSnackbar('snack'.tr);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: appTheme.green700,
        title: Text(
          "Chatsupport".tr,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            TextFormField(
              style: TextStyle(color: Colors.black),
              maxLines: 5,
              controller: _mailMessageController,
              decoration: InputDecoration(
                labelText: 'mess'.tr,
                labelStyle: TextStyle(color: appTheme.green700),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.green700),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.green700),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  sendMail(
                    recipientEmail: 'infogerentea@gmail.com',
                    mailMessage: _mailMessageController.text.toString(),
                  );
                },
                child: Text(
                  'sendmail'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: appTheme.green700,
        content: FittedBox(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 5,
            ),
          ),
        ),
      ),
    );
  }
}
