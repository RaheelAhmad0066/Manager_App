import 'package:gerentea/Localiziation/Language.dart';
import 'package:gerentea/providers/message_provider.dart';
import 'package:gerentea/providers/speech_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gerentea/theme/theme_helper.dart';
import 'package:gerentea/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'core/app_export.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //instance of shared preference
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? isDark = pref.getBool("isDark") ?? false;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(isDark!),
        ),
        ChangeNotifierProvider(
          create: (context) => SpeechProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessageProvider(),
        ),
      ],
      child: ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(isDark!),
          builder: (context, provider) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              themeMode: context.watch<ThemeProvider>().currentTheme,
              initialRoute: AppRoutes.splashScreen,
              routes: AppRoutes.routes,
              locale: Locale('es', 'ES'),
              translations: Language(),
              fallbackLocale: Locale('es', 'ES'),
            );
          }),
    );
  }
}
