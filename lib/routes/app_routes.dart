import 'package:flutter/material.dart';
import 'package:gerentea/View/login_main_screen/login_main_screen.dart';
import 'package:gerentea/View/sign_in_screen/sign_in_screen.dart';
import 'package:gerentea/View/sign_up_screen/sign_up_screen.dart';
import 'package:gerentea/View/forgot_password_screen/forgot_password_screen.dart';
// import 'package:gerentea/View/welcome_screen/welcome_screen.dart';
import 'package:gerentea/View/splash_screen/splash_screen.dart';
import 'package:gerentea/View/app_navigation_screen/app_navigation_screen.dart';

import '../View/Buy_screen/Premiumfetaure.dart';
import '../View/Chatbott_Screen/Chatboot_screen.dart';

class AppRoutes {
  static const String loginMainScreen = '/login_main_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String splashScreen = '/splash_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String chatBotScreen = '/chat_bot_screen';
  static const String Buyscreen = '/Buy_Screen';

  static Map<String, WidgetBuilder> routes = {
    loginMainScreen: (context) => LoginMainScreen(),
    Buyscreen: (context) => BuyScreen(),
    chatBotScreen: (context) => ChatBotScreen(),
    signInScreen: (context) => SignInScreen(),
    signUpScreen: (context) => SignUpScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    splashScreen: (context) => SplashScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
