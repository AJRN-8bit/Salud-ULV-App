import 'package:flutter/material.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salud ULV App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade50),
        useMaterial3: true,
      ),
      home: SplashScreen()
    );
  }
}

