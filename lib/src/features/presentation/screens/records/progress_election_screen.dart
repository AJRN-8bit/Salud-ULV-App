
import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/records/anthropometrics/progress_data_screen.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/themes.dart';
import 'package:salud_ulv_app/src/features/presentation/widgets/buttons.dart';

class MainProgressPage extends StatelessWidget {
  const MainProgressPage({super.key});


  @override
  Widget build(BuildContext context) {
    const paddingValue = PaddingValue.pagePadding;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Progreso"),
        backgroundColor: Colors.white,
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          // mainAxisAlignment: .center,
          children: [
            SelectProgressTypeButton(title: "Actividades", bgColor: const Color.fromARGB(255, 196, 190, 174), page: AnthropometricProgressScreen()),
            const SizedBox(height: 20,),
            SelectProgressTypeButton(title: "Pasos", bgColor: const Color.fromARGB(255, 192, 174, 196), page: AnthropometricProgressScreen()),
            const SizedBox(height: 20,),
            SelectProgressTypeButton(title: "Antropométricos", bgColor: AnthropometricColors.appBar, page: AnthropometricProgressScreen()),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}