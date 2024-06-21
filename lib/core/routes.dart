import 'package:flutter/material.dart';
import 'package:smart_jakarta/views/login/sign_in_page.dart';
import 'package:smart_jakarta/views/login/sign_up_page.dart';
import 'package:smart_jakarta/views/missing/missing_page.dart';
import 'package:smart_jakarta/views/welcome/welcome_page.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case '/signIn':
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case '/signUp':
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const MissingPage(),
        );
    }
  }
}