import 'package:gerentea/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controler/Loader/Loader.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/image_constant.dart';

import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

String id = '';

class AnimatedDialog extends StatefulWidget {
  @override
  _AnimatedDialogState createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> {
  TextEditingController userurlcontroler = TextEditingController();
  TextEditingController usernamecontroler = TextEditingController();

  Future Fetchknowledgebaseurl() async {
    String url = userurlcontroler.text;
    String username = usernamecontroler.text;

    final responce = await http.post(
        Uri.parse(
            'https://api.dante-ai.com/knowledge-bases/url?urls=$url&knowledge_base_name=$username'),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": apiKey,
        });
    if (responce.statusCode == 200) {
      // final json = jsonDecode(responce.body);

      // id = json['results']['knowledge_base']['id'];
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('userid', id);
      // id = prefs.getString('userid') ?? '';
      // print('your id$id');
      return responce.body;
    } else {
      throw Exception('failed to load');
    }
  }

  Future uploadfile() async {
    String username = usernamecontroler.text;

    final responce = await http.post(
        Uri.parse('https://api.dante-ai.com/knowledge-bases/files?'),
        headers: {
          "Content-Type": "multipart/form-data",
          "accept": "application/json",
          "x-api-key": apiKey,
          "files": _filePath.toString()
        });
    if (responce.statusCode == 200) {
      // final json = jsonDecode(responce.body);

      // id = json['results']['knowledge_base']['id'];
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('userid', id);
      // id = prefs.getString('userid') ?? '';
      // print('your id$id');
      return responce.body;
    } else {
      throw Exception('failed to load');
    }
  }

  String _filePath = 'No file selected';

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any, // You can specify the file types you want to allow.
      );
      if (result != null) {
        setState(() {
          _filePath = result.files.single.name;
        });
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  final Loader = Get.put(CoustomLoader());
  bool showError = false;

  void _validateTextField() {
    setState(() {
      showError = usernamecontroler.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.green700,
        title: Text(
          'Add Knowledgebase URL',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgApplogo1,
              height: 274.adaptSize,
              width: 274.adaptSize,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 53.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Gerente",
                        style: theme.textTheme.displaySmall,
                      ),
                      TextSpan(
                        text: "-A",
                        style: CustomTextStyles.displaySmallBlueA100,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernamecontroler,
                decoration: InputDecoration(
                  hintText: 'Add Name',
                  errorText: showError ? 'Name is required' : null,
                  errorStyle: TextStyle(color: Colors.red),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userurlcontroler,
                decoration: InputDecoration(
                  hintText: 'Add url',
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('OR'),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 362,
              decoration: BoxDecoration(
                  border: Border.all(color: appTheme.green700),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: _pickFile,
                    child: Container(
                      height: 40,
                      width: 202,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Choose File',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ' $_filePath',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Loader.user.value
                  ? CircularProgressIndicator(
                      color: appTheme.green700,
                    )
                  : SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            if (usernamecontroler.text.isEmpty) {
                              _validateTextField();
                            } else if (usernamecontroler.text.isNotEmpty) {
                              Fetchknowledgebaseurl();
                              uploadfile();
                              // getSavedText();
                              // Loader.userr(context);
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
