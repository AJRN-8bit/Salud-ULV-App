import 'package:flutter/material.dart';

class RegisterActivityMainScreen extends StatelessWidget {
  const RegisterActivityMainScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(250),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                const SizedBox(height: 300),

                Container(
                    width: 150,
                    height: 70,
                    alignment: .center,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0559A2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                  
                    ),
                    child: Text("Hello", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 18)),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
  
  