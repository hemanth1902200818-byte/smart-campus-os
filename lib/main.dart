import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_config.dart';
import 'frontend/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  runApp(const SmartCampusApp());
}

class SmartCampusApp extends StatelessWidget {
  const SmartCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Campus OS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        primaryColor: const Color(0xFF2563EB),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}