import 'dart:async';

import 'package:firebase/view/auth/login_screen.dart';
import 'package:firebase/view/posts/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostScreen()),
        ),
      );
    } else {
      Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        ),
      );
    }
  }
}
