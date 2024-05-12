import 'package:final_project/common/color_extension.dart';
import 'package:final_project/pages/auth_page.dart';
import 'package:final_project/pages/change_password_page.dart';
import 'package:final_project/pages/home_page.dart';
import 'package:final_project/pages/started_page.dart';
import 'package:final_project/pages/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight & Meal Tracker',
      theme: ThemeData(
        primaryColor: TColor.primaryColor1,
        useMaterial3: true,
      ),
      home: const StartedPage(),
      routes: {
        'main_page':(context) => const AuthPage(),
        'home_page': (context) => HomePage(),
        'weight_page': (context) => WeightPage(),
        'change_password_page': (context) => const ChangePasswordPage(),
        },
    );
  }
}
