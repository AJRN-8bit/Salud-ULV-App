import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';


class RecentAnthropometricListView extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final TextStyle dataTextStyle;
  final TextStyle subTitleTextStyle;
  final UserAnthropometric? data;

  const RecentAnthropometricListView({super.key, required this.bgColor, required this.data, required this.borderColor, required this.subTitleTextStyle, required this.dataTextStyle});

  @override
  Widget build(BuildContext context) {

    if(data == UserAnthropometric()){
      debugPrint("No hay datos para mostrar");
      return const Center(child: Text("No hay datos para mostrar"));
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(2),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: .center,
        children: [
          _dataCell(data?.height, "Altura", "cm", bgColor, borderColor, dataTextStyle, subTitleTextStyle),
          const SizedBox(height: 10),
          _dataCell(data?.weight, "Peso", "kg", bgColor, borderColor, dataTextStyle, subTitleTextStyle),
          const SizedBox(height: 10),
          _dataCell(data?.smm, "Masa musculo-esquelética", "kg", bgColor, borderColor, dataTextStyle, subTitleTextStyle),
          const SizedBox(height: 10),
          _dataCell(data?.fatMass, "Masa de Grasa", "kg", bgColor, borderColor, dataTextStyle, subTitleTextStyle),
          const SizedBox(height: 10),
          _dataCell(data?.bodyFatPercentage, "Porcentaje de Grasa", "%", bgColor, borderColor, dataTextStyle, subTitleTextStyle),
          const SizedBox(height: 10),
          _dataCell(data?.bmi, "Indice de Masa Corporal", "", bgColor, borderColor, dataTextStyle, subTitleTextStyle),
          const SizedBox(height: 10),
          _dataCell(data?.whr, "Indice Cintura-Cadera", "", bgColor, borderColor, dataTextStyle, subTitleTextStyle),
          const SizedBox(height: 10),
          
        ],
      ),
    );
  }

  Widget _dataCell(double? value, String description, String sufix, Color bgColor, Color borderColor, TextStyle dataTextStyle, TextStyle subTitleTextStyle){
    return Container(
      height: 70,
      width: 175,
      decoration: BoxDecoration(
        shape: .rectangle,
        borderRadius: BorderRadius.circular(15),
        color: bgColor,
        border: Border.all(color: borderColor, width: 2)
      ),

      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text('$value $sufix', style: dataTextStyle,),
          Text(description, style: subTitleTextStyle,),
        ],
      ),
    );
  }
}












class AnthropRecordsListView extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final TextStyle textStyle;
  final Axis scrollDirection;
  final List<UserAnthropometric> data;
  final bool limit;

  const AnthropRecordsListView({super.key, required this.bgColor, required this.data, required this.borderColor, required this.textStyle, required this.scrollDirection, required this.limit});

  @override
  Widget build(BuildContext context) {
     var dataCount = data.length;
    
    if(data.isEmpty){
      debugPrint("No hay datos para mostrar");
      return const Center(child: Text("No hay datos para mostrar"));
    }

    if(limit == true){
      dataCount = data.take(3).length;
    }
    


    return Expanded(
      child: ListView.separated(
        scrollDirection: scrollDirection,
        padding: const EdgeInsets.all(10),
        itemCount: dataCount,
        separatorBuilder: (_,_) => const SizedBox(height: 10, width: 10,),
        itemBuilder: (context, index) {
          final item = data[index];
      
          return Container(
            width: 400,
            // height: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: borderColor, width: 2)
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fecha de registro: ${item.registryDate!.day}/${item.registryDate!.month}/${item.registryDate!.year}", style: textStyle),
                  Text("Altura: ${item.height} cm", style: textStyle),
                  Text("Peso: ${item.weight} kg", style: textStyle),
                  Text("SMM: ${item.smm} kg", style: textStyle),
                  Text("Grasa masa: ${item.fatMass} kg", style: textStyle),
                  Text("Grasa %: ${item.bodyFatPercentage} %", style: textStyle),
                  Text("IMC: ${item.bmi}", style: textStyle),
                  Text("ICC: ${item.whr}", style: textStyle),
                ],
              ),
          );
        },
       ),
    );
  }
}