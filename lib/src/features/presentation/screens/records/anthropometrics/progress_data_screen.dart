import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/userAnthropometric/get_anthrop_controller.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/records/anthropometrics/all_records_screen.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/records/anthropometrics/register_data_screen.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/fonts.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/themes.dart';
import 'package:salud_ulv_app/src/features/presentation/widgets/buttons.dart';
import 'package:salud_ulv_app/src/features/presentation/widgets/graphs.dart';
import 'package:salud_ulv_app/src/features/presentation/widgets/listviews.dart';


class AnthropometricProgressScreen extends StatefulWidget {
  const AnthropometricProgressScreen({super.key});

  @override
  State<AnthropometricProgressScreen> createState() => _AnthropometricProgressScreenState();
}

class _AnthropometricProgressScreenState extends State<AnthropometricProgressScreen> {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    // final _textFont = SizedFonts.smallFont;
    final _textDataFont = SizedFonts.smallFont;
    final _sectionsDataFont = SpecialFonts.largeFont;
    final _containerColor = AnthropometricColors.primary;
    final _btnColor = AnthropometricColors.button;
    final _borderColor = AnthropometricColors.secondary;
    final field = "weight";
    
  
    @override
    void initState() {
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_){
        context.read<GetRecentAnthropometricInAdapter>().execute();
        context.read<GetAnthropometricsByFieldInAdapter>().execute(field);
        context.read<GetAllAnthropometricsInAdapter>().execute();
        context.read<RegisterAntrhopometricDataInAdapter>().execute();
      });
    }

  @override
  Widget build(BuildContext context) {{
    const edgeValue = WidgetCircleRadius.containerRadius; 
    const paddingValue = PaddingValue.pagePadding;
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = screenWidth - (screenWidth * 0.1);
    final recentRecord = context.watch<GetRecentAnthropometricInAdapter>();
    final graphData = context.watch<GetAnthropometricsByFieldInAdapter>().data ?? [];
    final field = context.watch<GetAnthropometricsByFieldInAdapter>().field ?? "weight";
    final allRecords = context.watch<GetAllAnthropometricsInAdapter>();
    context.watch<RegisterAntrhopometricDataInAdapter>();

    //   final recentRecord = inAdapter.execute();
      // final inAdapter = context.watch<GetRecentAnthropometricInAdapter>().execute();
      // final recentRecord = inAdapter.execute();

      // final outAdapter = GetAnthropometricsSQFLOutAdapter();
      // final useCase = GetAnthropometricsUseCase(outAdapter);
      // GetAnthropometricsInAdapter inAdapter = GetAnthropometricsInAdapter(useCase);
    // final outAdapter = GetAnthropometricsSQFLOutAdapter();
    // final useCase = GetAnthropometricsUseCase(outAdapter);
    // GetAnthropometricsInAdapter inAdapter = GetAnthropometricsInAdapter(useCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Antropométricos' ,style: SpecialFonts.xLargeFont),
        centerTitle: true,
        backgroundColor: AnthropometricColors.appBar,
        actions: [
          IconButton(
            onPressed: (){ Navigator.push(context,  MaterialPageRoute(builder: (context) => RegisterAnthropometricPage()));}, 
            icon: Icon(Icons.add))
        ],
      ),
      
      backgroundColor: AnthropometricColors.background,
      body: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: .center,
              children: [


                /// My data container
                Container(
                  height: 250,
                  width: screenWidth,
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: _containerColor,
                    shape: .rectangle,
                    borderRadius: BorderRadius.circular(edgeValue),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          // const SizedBox(height: 10),
                          
                          // const SizedBox(width: 20),
                          Text("Mis datos", style: _sectionsDataFont),
                            
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: .center,
                            children: [

                              Container(
                                height: 150,
                                alignment: .center,
                                child: RecentAnthropometricListView(
                                  bgColor: _containerColor, 
                                  data: recentRecord.recentRecord, 
                                  borderColor: _borderColor, 
                                  subTitleTextStyle: SizedFonts.smallFont,
                                  dataTextStyle: SpecialFonts.largeFont),
                              ),
                            ],
                          ),

                      
                                                                     
                          const SizedBox(width: 20),
                        ]
                      ),
                    )
                    ),                  

                const SizedBox(height: 10),



                // Graph container
                Container(
                  height: 500,
                  width: screenWidth,
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: _containerColor,
                    shape: .rectangle,
                    borderRadius: BorderRadius.circular(edgeValue),
                  ),
                    child: Padding(
                        padding: const EdgeInsets.all(2.0),
                      child: Column(
                      children: [
                        const SizedBox(height: 10),

                        const SizedBox(width: 20),
                        Text("Gráficos", style: _sectionsDataFont),

                        const SizedBox(height: 10),

                        if(graphData.isEmpty) const SizedBox(height: 5, width: 5,)
                        else

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              const SizedBox(width: 10),
                              SelectFieldButton(text: "Peso", field: "weight", iconPath: "assets/icons/anthropometric/weight.png", bgColor: _btnColor, borderColor: _borderColor),
                              const SizedBox(width: 10),
                              SelectFieldButton(text: "SMM", field: "smm", iconPath: "assets/icons/anthropometric/smm.png", bgColor: _btnColor, borderColor: _borderColor),
                              const SizedBox(width: 10),
                              SelectFieldButton(text: "Grasa", field: "fatMass", iconPath: "assets/icons/anthropometric/fat-mass.png", bgColor: _btnColor, borderColor: _borderColor),
                              const SizedBox(width: 10),
                              SelectFieldButton(text: "Grasa %", field: "bodyFatPercentage", iconPath: "assets/icons/anthropometric/body-fat-percentage.png", bgColor: _btnColor, borderColor: _borderColor),
                              const SizedBox(width: 10),
                              SelectFieldButton(text: "IMC", field: "bmi", iconPath: "assets/icons/anthropometric/bmi.png", bgColor: _btnColor, borderColor: _borderColor),
                              const SizedBox(width: 10),
                              SelectFieldButton(text: "ICC", field: "whr", iconPath: "assets/icons/anthropometric/whr.png", bgColor: _btnColor, borderColor: _borderColor),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      
                        const SizedBox(height: 30),

                        
                      
                        SizedBox(height:300, child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ScrollableLineGraph(data: graphData, field: field),
                        )),  // Graph
                      ],
                                        ),
                    ),
                ),





                const SizedBox(height: 20),


                // Recent records container
                Container(
                  height: 300,
                  width: screenWidth,
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: _containerColor,
                    shape: .rectangle,
                    borderRadius: BorderRadius.circular(edgeValue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                    
                        
                        Text("Registros recientes", style: _sectionsDataFont),
                        const SizedBox(height: 10),
                    
                        // Aquí irían los ListTiles generados a partir de los datos obtenidos
                        if(allRecords.isLoading) const CircularProgressIndicator() 
                        else if(allRecords.records != null)
                    
                        AnthropRecordsListView(
                          bgColor: _containerColor, 
                          data: allRecords.records ?? [], 
                          borderColor: _borderColor, 
                          textStyle: _textDataFont,
                          scrollDirection: Axis.horizontal,
                          limit: true,
                        )
                        
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllAnthropRecordsScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: _btnColor,
                    minimumSize: const Size(double.infinity, 50)
                    ),
                  
                  child: const Text('Todos los registros'),
                ),
                const SizedBox(height: 30),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
}

