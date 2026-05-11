import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';


class ScrollableLineGraph extends StatelessWidget{
  final List<Map<String,dynamic>> data;
  final String field;

  // static List<FlSpot> spots = const [
  //   FlSpot(0, 0),
  //   FlSpot(1, 1),
  //   FlSpot(2, 1.5),
  //   FlSpot(3, 1.4),
  //   FlSpot(4, 2),
  // ];

  // const ScrollableLineGraph({super.key, required this.data});
  const ScrollableLineGraph({super.key, required this.data, required this.field});


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final String selectedField = field.isEmpty ? "weight" : field;
    final double maxY;
    final double minY;
    final double intervalY;
  
    if(data.isEmpty || data.length < 2){return const Center(child: Text("Realiza 2 registros para visualizar datos"));}

    //   final List<FlSpot> spots = data.map((items) {
    //     final date = DateTime.parse(items['registryDate'] as String);
    //     final x = date.hour.toDouble(); // Ajusta 'valor' al nombre de tu campo
    //     final y = (items[selectedField] as num).toDouble(); // Ajusta 'valor' al nombre de tu campo
    //     return FlSpot(x, y);
    // }).toList();

    final yValues = data.map((item)=> item[field] as double).toList();
    // final List<double> xValues = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0];
    // final date = DateTime.parse(items['registryDate'] as String);
    // final List<double> xValues = date.hour.toDouble();

    // final xValues = data.map((item) {
    //   final date = DateTime.parse(item['registryDate'] as String);
    //   return date.minute.toDouble(); // Esto genera un double por cada vuelta del map
    // }).toList();

    final xValues = [];
    for (var i = 1; i < yValues.length; i++) {
      xValues.add(i.toDouble());
    }

    final List<FlSpot> points = List.generate(
      xValues.length, (i){
        return FlSpot(xValues[i], yValues[i]);
      } 
    );

    maxY = yValues.reduce(max)+2;
    minY = yValues.reduce(min)-2;
    intervalY = ((maxY - minY)/5).abs().toDouble();
    // intervalY = ((maxY - minY)/5).abs().toInt().toDouble();

    
    return LineChart(
            LineChartData(
              
              // clipData: FlClipData.none(),
              // minX: 0,
              // maxX: 20,
              minY: minY,
              maxY: maxY,
              // maxX: data.length.toDouble() -1,
              
            
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(), left: BorderSide())),
    
            gridData: FlGridData(show: false),
    
            // minX: 2, 
            // minY: 5,
    
            titlesData: FlTitlesData(
            // bottomTitles: const AxisTitles(sideTitles: ),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  interval: intervalY,
                  reservedSize: 40,
                  showTitles: true
                )),
            ),      
            
            
    
    
    
    
            lineBarsData: [
              LineChartBarData(
                spots: points,   ///Data
                isCurved: true,
                isStrokeCapRound: true,
                // curveSmoothness: 0.5,
                barWidth: 3,
                dotData: FlDotData(show: true),
                color: Colors.blue,
    
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [const Color.fromARGB(255, 28, 242, 67).withAlpha(3), const Color.fromARGB(255, 36, 238, 198), const Color.fromARGB(255, 42, 147, 233)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          )
        );
            
          
  }
    
}




// SizedBox(
//                   height: 250,
//                   width: 300,
//                   child: LineChart(
//                     LineChartData(
//                       // minX: 4,
//                       // minY: 5,
//                       titlesData: FlTitlesData(show: false),
//                       gridData: FlGridData(show: false),
//                       borderData: FlBorderData(show: true),
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: const [
//                             FlSpot(0, 0),
//                             FlSpot(1, 1),
//                             FlSpot(2, 1.5),
//                             FlSpot(3, 1.4),
//                             FlSpot(4, 2),
//                           ],
//                           isCurved: true,
//                           barWidth: 3,
//                           color: Colors.blue,
//                           dotData: FlDotData(show: true),
//                         ),
//                       ],
//                     )
//                   ),
//                 ),