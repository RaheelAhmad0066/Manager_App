import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gerentea/View/Drawer/Menue_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gerentea/core/utils/copy_message.dart';
import 'package:gerentea/core/utils/view_image.dart';
import 'package:gerentea/providers/message_provider.dart';
import 'package:gerentea/providers/speech_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/constants.dart';
import '../Buy_screen/Premiumfetaure.dart';
import 'Knowledgebase_Url.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/foundation.dart';

import 'package:gerentea/core/utils/size_utils.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

String UserId = '';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController =
      TextEditingController(); //for TextField
  final ScrollController _scrollController =
      ScrollController(); //for ListView.builder

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    getknowledgebase();
    conversation();
    modalcreate();
    super.initState();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // You can also use Toast.LENGTH_LONG
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,

      backgroundColor: Colors.grey.withOpacity(0.8),
      textColor: Colors.white,
    );
  }

  void saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedTextKey', text);
  }

  Future<String> getSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('savedTextKey') ??
        ''; // Provide a default value if the key is not found
    return id;
  }

  //Sends prompt request to ChatGPT
  bool hasUpgradedPackage = false;
  int messageCount = 0; // Variable to keep track of the number of messages sent

  void sendPrompt() {
    if (!hasUpgradedPackage && messageCount >= 4) {
      // Display a popup when the message limit is exceeded and the package is not upgraded
      showPopup(context);
      return;
    }

    if (_textEditingController.text.isNotEmpty) {
      // Calling mainApi with prompt text and scroll controller
      context.read<MessageProvider>().sendPrompt(
            _textEditingController.text.trim(),
            _scrollController,
            context,
          );

      _textEditingController.clear(); // Clear text field
      messageCount++; // Increment the message count
    }

    FocusScope.of(context).unfocus(); // Dismiss keyboard on submission
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomImageView(
            imagePath: ImageConstant.imgApplogo1,
            height: 84.adaptSize,
            width: 84.adaptSize,
            alignment: Alignment.topCenter,
          ),
          content: Text(
              'You have reached the maximum limit of 4 messages. Upgrade your package to send unlimited messages.'),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.to(BuyScreen());
              },
              child: Text(
                'Update',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.green, fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancle',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.red, fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }

// Call this function when the user upgrades their package using Google Pay
  void upgradePackage() {
    // Set the flag to indicate that the package is upgraded
    hasUpgradedPackage = true;
    // Reset the message count to allow unlimited messages
    messageCount = 0;
  }

  //method to access toggle recording
  void recordSpeech() => context
      .read<SpeechProvider>()
      .toggleRecording(_scrollController, context);
  List<Color> _kDefaultRainbowColors = const [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menue_bar(),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  getknowledgebase();
                  conversation();
                  modalcreate();
                  getSavedText();
                  _showToast('Reloaded');
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                )),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) {
                    context.read<MessageProvider>().clearMessages(context);
                  }
                  if (value == 2) {
                    Get.updateLocale(Locale('es', 'ES'));
                  }
                  if (value == 3) {
                    Get.updateLocale(Locale('en', 'US'));
                  }
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            Text("Clearchat".tr,
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.translate,
                              color: Colors.green,
                            ),
                            Text("Spanish",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Row(
                          children: [
                            Icon(
                              Icons.translate,
                              color: Colors.green,
                            ),
                            Text("English",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ])
          ],
          backgroundColor: appTheme.green700,
          centerTitle: true,
          title: Text('Apbartitle'.tr)), //this appBar is in widgets folder
      body: RefreshIndicator(
        color: appTheme.green700,
        onRefresh: getknowledgebase,
        child: Column(
          children: [
            //Chat Container
            Expanded(child: Consumer<MessageProvider>(
              builder: (context, provider, child) {
                //messages is empty then it shows only the Logo
                if (provider.messages.isEmpty) {
                  return SizedBox(
                    width: 441.h,
                    child: Column(
                      children: [
                        SizedBox(height: 90.v),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgApplogo1217x219,
                                  height: 123.adaptSize,
                                  width: 123.adaptSize,
                                ),
                                SizedBox(height: 5.v),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Gerente",
                                        style: CustomTextStyles
                                            .displaySmallErrorContainer_1,
                                      ),
                                      TextSpan(
                                        text: "-A",
                                        style: theme.textTheme.displaySmall,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  width: 400.h,
                                  padding: EdgeInsets.all(30.h),
                                  decoration: AppDecoration
                                      .fillSecondaryContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Hometitlebox1".tr,
                                    style: CustomTextStyles.titleMediumGray500,
                                  ),
                                ),
                                SizedBox(height: 22.v),
                                Container(
                                  width: 400.h,
                                  padding: EdgeInsets.all(30.h),
                                  decoration: AppDecoration
                                      .fillSecondaryContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Hometitlebox2".tr,
                                    style: CustomTextStyles.titleMediumGray500,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 400.h,
                                  padding: EdgeInsets.all(30.h),
                                  decoration: AppDecoration
                                      .fillSecondaryContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Hometitlebox3".tr,
                                    style: CustomTextStyles.titleMediumGray500,
                                  ),
                                ),
                                SizedBox(height: 21.v),
                                SizedBox(height: 126.v),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: provider.messages.length,
                    itemBuilder: (context, index) {
                      final data = provider.messages[index];
                      //message tile for user and assistant with animations
                      if (data.role == "user") {
                        //user
                        return Align(
                          alignment: Alignment
                              .topRight, //aligns user message tile to right
                          child: SlideInRight(
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: appTheme.green700,
                                borderRadius: senderBorder,
                              ),
                              child: Text(data.content,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight
                                              .normal)), //user prompt message
                            ),
                          ),
                        );
                      } else {
                        //assistant
                        return Align(
                          alignment: Alignment
                              .topLeft, //aligns assistant message tile to left
                          child: SlideInLeft(
                            duration: const Duration(milliseconds: 300),
                            child: GestureDetector(
                              onLongPress: () => copyText(
                                data.content,
                                context,
                              ), //copy message to clip board on long press
                              child: Container(
                                height: data.isImage
                                    ? 250
                                    : null, //if data.isImage then it the height and width is fixed to 250
                                width: data.isImage
                                    ? 250
                                    : null, //if not then the both are null, so it resizes according to its child
                                padding: data.isImage
                                    ? const EdgeInsets.all(0)
                                    : const EdgeInsets.all(15),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: receiverBorder,
                                ),

                                //if data.isImage is true then it shows cachedNetworkImage to show image. if false then shows text message
                                child: data.isImage
                                    ? GestureDetector(
                                        onTap: () =>
                                            viewImage(context, data.content),
                                        child: CachedNetworkImage(
                                          imageUrl: data.content,
                                          fit: BoxFit.cover,
                                          maxHeightDiskCache: 250,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                                  child:
                                                      CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color: appTheme.green700,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ))
                                    : data.content == "...."
                                        ? //if the data.content is "...." then it shows animated text until the actual message is updated
                                        //wavy animation
                                        SpinKitPulse(
                                            duration: Duration(seconds: 1),
                                            color: appTheme
                                                .green700, // Change the color of the spinner
                                            size:
                                                50.0, // Change the size of the spinner
                                          )

                                        // AnimatedTextKit(
                                        //     totalRepeatCount: 3,
                                        //     animatedTexts: [
                                        //       WavyAnimatedText(data.content,
                                        //           textStyle: Theme.of(context)
                                        //               .primaryTextTheme
                                        //               .bodyMedium,
                                        //           speed: const Duration(
                                        //               milliseconds: 300)),
                                        //     ],
                                        //     isRepeatingAnimation: true,
                                        //   )
                                        :
                                        //main message
                                        SelectableText(
                                            data.content,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black),
                                          ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                }
              },
            )),
            Container(
              height: 80.h,
              //width: 400.v,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(50)),
                  color: appTheme.green700),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTap: () {
                        conversation();
                        modalcreate();
                        getknowledgebase();
                      },
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Textfieldhint".tr,
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                  ),
                  // IconButton(
                  //     onPressed: () => recordSpeech(),
                  //     icon: const Icon(Icons.mic, color: Colors.white)),
                  IconButton(
                      onPressed: () => sendPrompt(),
                      icon: const Icon(Icons.send, color: Colors.white)),
                ],
              ),
            )
            // //Text Field
          ],
        ),
      ),
    );
  }

  Future getknowledgebase() async {
    final getdata = await http
        .get(Uri.parse('https://api.dante-ai.com/knowledge-bases'), headers: {
      "Content-Type": "application/json",
      "x-api-key":
          "DANTE_AI_f70f8bdd99d921599224051bac14e1d2981f05e0dea51ff6aacca3cd242829d1"
    });
    if (getdata.statusCode == 200) {
      final jsondata = jsonDecode(getdata.body);
      setState(() {
        id = jsondata['results'][0]['knowledge_base']['id'];
        id = jsondata['results'][0]['files']['id'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future modalcreate() async {
    final responce1 = await http.post(
        Uri.parse('https://api.dante-ai.com/model/create_index?kb_id=$id'),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": apiKey,
        });
    if (responce1.statusCode == 200) {
      print('good');
      return responce1.body;
    } else {
      throw Exception('failed to load');
    }
  }

  Future conversation() async {
    // String username = UserNameControler.text;
    final responce2 = await http.post(
        Uri.parse('https://api.dante-ai.com/conversations?kb_id=$id'),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": apiKey,
        });
    if (responce2.statusCode == 201) {
      final jsondata = jsonDecode(responce2.body);

      UserId = jsondata['id'];

      print('your user id$UserId');
      return responce2.body;
    } else {
      print('wrong');
      throw Exception('failed to load');
    }
  }
}
