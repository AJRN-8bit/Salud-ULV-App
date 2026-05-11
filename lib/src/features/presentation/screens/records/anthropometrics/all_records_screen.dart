import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/userAnthropometric/get_anthrop_controller.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/fonts.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/themes.dart';
import 'package:salud_ulv_app/src/features/presentation/widgets/listviews.dart';


class AllAnthropRecordsScreen extends StatefulWidget {
  const AllAnthropRecordsScreen({super.key});

  @override
  State<AllAnthropRecordsScreen> createState() => _AllAnthropRecordsScreenState();
}

class _AllAnthropRecordsScreenState extends State<AllAnthropRecordsScreen> {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    @override
    void initState() {
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_){
        context.read<GetAllAnthropometricsInAdapter>().execute();
      });
    }

  @override
  Widget build(BuildContext context) {{
    const edgeValue = WidgetCircleRadius.containerRadius;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    const paddingValue = PaddingValue.pagePadding;

    final allRecord = context.watch<GetAllAnthropometricsInAdapter>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Historial' ,style: SpecialFonts.xLargeFont),
        backgroundColor: AnthropometricColors.appBar,
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

                Container(
                  height: screenHeight,
                  width: screenWidth,
                  
                  decoration: BoxDecoration(
                        color: AnthropometricColors.primary,
                        shape: .rectangle,
                        borderRadius: BorderRadius.circular(edgeValue),
                      ),
                
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        AnthropRecordsListView(
                          bgColor: AnthropometricColors.primary,
                          borderColor: AnthropometricColors.secondary,
                          textStyle: SizedFonts.mediumFont,
                          scrollDirection: Axis.vertical,
                          data: allRecord.records ?? [],
                          limit: false,
                        ),
                      ],
                    ),
                  
                ),
              ],
            ),
          ),
        ),
      )
      
    );
  }}
}