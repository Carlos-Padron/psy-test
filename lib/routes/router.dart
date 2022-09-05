import 'package:flutter/material.dart';
import 'package:test_psi/screens/login_screen.dart';
import 'package:test_psi/screens/select_test_screen.dart';
import 'package:test_psi/screens/test_screen.dart';

class MainRouter {
  static const String initialRoute = "/login";

  static Map<String, Widget Function(BuildContext)> routes = {
    "/login": (BuildContext context) => const LoginScreen(),
    "/selectTest": (BuildContext context) => const SelectTestScreen(),
    "/answerTest": (BuildContext context) => TestScreen(),
  };
}
