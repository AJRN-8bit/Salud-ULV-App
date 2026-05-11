
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/usecases/register_anthrop_usecase.dart';
import 'package:salud_ulv_app/src/core/middleware/errors.dart';
import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/userAnthropometric/anthropdata_registry_controller.dart';
import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/userAnthropometric/get_anthrop_controller.dart';
import 'package:salud_ulv_app/src/features/adapters/secondary/http/controllers/userAnthropometric/anthropdata_registry_controller.dart';

// import 'package:salud_ulv_app/src/features/adapters/secondary/http/controllers/userAnthropometric/anthropdata_registry_controller.dart';
import 'package:salud_ulv_app/src/features/adapters/secondary/sqflite/controllers/user_anthrop_controller.dart';
import 'package:salud_ulv_app/src/features/presentation/themes/themes.dart';


class RegisterAnthropometricPage extends StatefulWidget {
  const RegisterAnthropometricPage({super.key});

  @override
  State<RegisterAnthropometricPage> createState() => _RegisterAnthropometricPageState();
}

class _RegisterAnthropometricPageState extends State<RegisterAnthropometricPage> {
  final _formKey = GlobalKey<FormState>();
  final localDBOutput = RegisterAnthtopometricsSQFLOutAdapter();
  final httpOutPort = RegisterAnthropometricsHttpOutAdapter();

  
  // 8 Controladores para tus 8 datos
  // final _idController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _smmController = TextEditingController();
  final _fatMassController = TextEditingController();
  final _bfpController = TextEditingController();
  final _bmiController = TextEditingController();
  final _whrController = TextEditingController();


  void _saveData() async {
    if (_formKey.currentState!.validate()) {
        final useCase = RegisterAntrhopometricDataUseCase(localDBOutput);

      try {
        // Creamos la Entidad con los datos capturados
        RegisterAnthropometricInAdapter adapter = RegisterAnthropometricInAdapter(
          // userid: _idController,
          height: _heightController,
          weight: _weightController,
          smm: _smmController,
          fatMass: _fatMassController,
          bfp: _bfpController,
          bmi: _bmiController,
          whr: _whrController,
          useCase: useCase
        );
        // Adapter to use case
        await adapter.execute();


        if (!mounted) return; // Checks widget

        Provider.of<GetRecentAnthropometricInAdapter>(context, listen: false).execute();
        // Provider.of<GetRecentAnthropometricInAdapter>(context, listen: false).execute();
        Provider.of<GetAllAnthropometricsInAdapter>(context, listen: false).execute();

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Datos registrados con éxito"), backgroundColor: Colors.green),
          );

          Navigator.pop(context);

        
      } on ValidationError catch (e) {
          // AQUÍ capturamos el error que mandaste desde el Caso de Uso
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message), backgroundColor: Colors.orange),
          );
      } catch (e) {
        // Error genérico (ej. se rompió la base de datos)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error inesperado'), backgroundColor: Colors.red),
        );
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputColor = AnthropometricColors.primary;
    final btnColor = AnthropometricColors.primary;
    const paddingValue = PaddingValue.pagePadding;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Antropométrico'),
        centerTitle: true,
       backgroundColor: AnthropometricColors.appBar,
       
       ),
       
      backgroundColor: AnthropometricColors.background,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(paddingValue),

          child: ListView(
            children: [
              // _buildInput(_idController, 'User ID', isInt: true),
              _buildInput(_heightController, 'Altura (cm)', "" , inputColor),
              _buildInput(_weightController, 'Peso (kg)', "" , inputColor),
              _buildInput(_smmController, 'Masa musculo-esquelética', "" , inputColor),
              _buildInput(_fatMassController, 'Masa de grasa', "" , inputColor),
              _buildInput(_bfpController, 'Porcentaje de Grasa', "" , inputColor),
              _buildInput(_bmiController, 'Indice de Masa Corporal (IMC)', "", inputColor),
              _buildInput(_whrController, 'Índice Cintura-Cadera (ICC)', "" , inputColor),
              const SizedBox(height: 20),
          
              ElevatedButton(
                onPressed: _saveData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor,
                  minimumSize: const Size(double.infinity, 50)
                  ),

                child: const Text('Guardar datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // Data entry widget
  Widget _buildInput(TextEditingController controller, String label, String valueRange, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        controller: controller,
        decoration: InputDecoration(
          labelText: label, 
          border: const OutlineInputBorder(), 
          hintText: valueRange,
          filled: true,
          fillColor: color,
          ),


        validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
      ),
    );
  }
}