
import 'package:flutter/material.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/signup1.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/login.dart';
import 'package:salud_ulv_mobile_app/widgets/buttons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logos/ulv_accion_logo.png", width: 300, height: 300),
            const SizedBox(height: 225),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                NavigateButton(nextScreen: () => SignUpScreen(), buttonText: "Registrar"),
                const SizedBox(width: 20),
                NavigateButton(nextScreen: () => LoginScreen(), buttonText: "Iniciar sesión"),
              ]
            )
          ],
        ),
      ),
    );
  }
}