import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/userAnthropometric/get_anthrop_controller.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/fonts.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/themes.dart';
// import 'package:salud_ulv_app/src/features/presentation/themes/themes.dart';

class SelectFieldButton extends StatelessWidget {
  final String text;
  final String field;
  final String iconPath;
  final Color bgColor;
  final Color borderColor;
  // final Function action;

  const SelectFieldButton({super.key, required this.text, required this.field, required this.iconPath, required this.bgColor, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    const cornerValue = WidgetCircleRadius.buttonRadius;

    return GestureDetector(
      onTap: (){
        context.read<GetAnthropometricsByFieldInAdapter>().execute(field);
      },

      child: Container(
        height: 70,
        width: 70,
        alignment: .center,
        padding: const EdgeInsets.all(2),
        
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(cornerValue),
          color: bgColor,
          border: Border.all(color: borderColor, width: 2)
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(iconPath, height: 40, width: 40, fit: .contain),
            // const SizedBox(height: 5,),
            Text(text, style: SizedFonts.smallFont)
      
          ],
        ),
      ),
    );
  }
}






class SelectProgressTypeButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Widget page;

  const SelectProgressTypeButton({super.key, required this.title, required this.bgColor, required this.page});

  @override
  Widget build(BuildContext context) {
    final edgeValue = WidgetCircleRadius.bigButtonRadius;
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        height: 150,
        width: screenWidth,
        decoration: BoxDecoration(
          shape: .rectangle,
          borderRadius: BorderRadius.circular(edgeValue),
          color: bgColor,
        ),

        child: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(title, style: SizedFonts.largeFont,)
            ],
          ),
        ),
      ));
  }
}