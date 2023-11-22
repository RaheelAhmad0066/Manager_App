// ignore_for_file: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gerentea/View/welcome_screen/welcome_screen.dart';
import 'package:gerentea/core/constants/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    user.value = _auth.currentUser;
    loaddata();
    super.onInit();
  }

  Future<void> loaddata() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('userName') ?? '';
    email = prefs.getString('userEmail') ?? '';
    image = prefs.getString('userImage') ?? '';
  }

  Future<void> handleSignInAndNavigateToHome(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential? userCredential =
            await _auth.signInWithCredential(credential);

        if (userCredential != null) {
          print('Signed in as: ${userCredential.user?.displayName}');
          print('User ID: ${userCredential.user?.uid}');
          name = userCredential.user?.displayName ?? '';

          email = userCredential.user?.email ?? '';
          image = userCredential.user?.photoURL ?? '';

          // Store user information in SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('userName', name);
          prefs.setString('userEmail', email);
          prefs.setString('userImage', image);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WelcomeScreen(

                    // userId: userCredential.user?.uid ?? 'Unknown',
                    )),
          );
        }
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    user.value = null;
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.loginMainScreen, (route) => false);
  }
}
