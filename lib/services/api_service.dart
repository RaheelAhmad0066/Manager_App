import 'dart:convert';

import 'package:gerentea/View/Homepage/home_page.dart';
import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApiClass {
  //this is the main API which decides the prompt is a picture or not

  Future<String> mainApi(String prompt, ScrollController controller) async {
    //------------apikey is in constants file, you can get your own key from OpenAI's website----------
    //I was making simple chat bot with ChatGPT but thanks to Rivaan Ranawat
    //for this method to generate text and image
    try {
      List<Map<String, dynamic>> jsonData = [
        {
          "question": "what is $prompt",
          "model_type": "gpt-4",
          "form_whatsapp": false,
          "conversation_id": "68b63135-7157-4e23-b6bd-a3621eb96ea2"
        }
      ];
      final response = await http.post(
        Uri.parse(
            "https://api.dante-ai.com/model/query?model_type=gpt-4&question=$prompt&conversation_id=$UserId"),
        headers: {"Content-Type": "application/json", "x-api-key": apiKey},
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body) ?? '';
        dynamic content = responseBody;
        return content.trim();
      } else {
        // Handle non-200 status codes here if needed
        return "HTTP Error: ${response.statusCode}";
      }
    } catch (e) {
      return e.toString();
    }
  }

  //chat gpt api for basic text prompt
  Future<String> chatGptApi(String prompt, ScrollController controller) async {
    try {
      List<Map<String, dynamic>> jsonData = [
        {
          "question": "what is $prompt",
          "model_type": "gpt-4",
          "form_whatsapp": false,
          "conversation_id": "68b63135-7157-4e23-b6bd-a3621eb96ea2"
        }
      ];
      final response = await http.post(
        Uri.parse(
            "https://api.dante-ai.com/model/query?model_type=gpt-4&question=$prompt&conversation_id=$UserId"),
        headers: {"Content-Type": "application/json", "x-api-key": apiKey},
      );
      if (response.statusCode == 200) {
        final responcebody = jsonDecode(response.body)['result'];
        dynamic content = responcebody;
        return content.toString();
      }
      return "Something went wrong";
    } catch (e) {
      return 'OH!! Please Connect Internet';
    }
  }

  //Dall-E API for image generation
  // Future<String> imageGenerationApi(
  //     String prompt, ScrollController controller) async {
  //   try {
  //     final response = await http.post(
  //         Uri.parse("https://api.openai.com/v1/images/generations"),
  //         headers: {
  //           "Content-Type": "application/json",
  //           "Authorization": "Bearer $apiKey"
  //         },
  //         body: jsonEncode({"prompt": prompt, "n": 1, "size": "1024x1024"}));
  //     if (response.statusCode == 200) {
  //       final String content = jsonDecode(response.body)["data"][0]["url"];
  //       content.trim();
  //       return content.toString();
  //     }
  //     return "Something went wrong";
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
}
