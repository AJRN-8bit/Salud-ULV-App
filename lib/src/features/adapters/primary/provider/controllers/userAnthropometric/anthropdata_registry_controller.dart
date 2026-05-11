import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/inports.dart';

class RegisterAnthropometricInAdapter {
  // final TextEditingController userid;
  final TextEditingController height;
  final TextEditingController weight;
  final TextEditingController smm;
  final TextEditingController fatMass;
  final TextEditingController bfp;
  final TextEditingController bmi;
  final TextEditingController whr;
  final IRegisterAnthropometricInPort useCase;

  /// Constructor recibe los controladores
  const RegisterAnthropometricInAdapter({
    // required this.userid,
    required this.height,
    required this.weight,
    required this.smm,
    required this.fatMass,
    required this.bfp,
    required this.bmi,
    required this.whr,
    required this.useCase
  });


  /// Método de conveniencia para construir la entidad desde los controladores
  Future<void> execute() async {
    var uuid = Uuid();
    var userid = dotenv.env['USER_ID'] ?? "090019"; // O cualquier valor por defecto

    final entity = UserAnthropometric(
      registryID: uuid.v4(),
      userID: int.tryParse(userid),
      height: double.tryParse(height.text),
      weight: double.tryParse(weight.text),
      smm: double.tryParse(smm.text),
      fatMass: double.tryParse(fatMass.text),
      bodyFatPercentage: double.tryParse(bfp.text),
      bmi: double.tryParse(bmi.text),
      whr: double.tryParse(whr.text),
      registryDate: DateTime.now()
    );

    debugPrint('Inside in adaptor to use case -->');
    // Llama al método del puerto
    await useCase.registerAnthropometric(entity);
  }
}

// import 'package:flutter/material.dart';
// import 'package:salud_ulv_app/src/core/domain/userAntrhopometric/entities/user_anthropometric.dart';
// import 'package:salud_ulv_app/src/core/domain/userAntrhopometric/ports/primary/register_anthrop.dart';

// typedef RegisterHandler = Future<void> Function({
//   required TextEditingController userid,
//   required TextEditingController height,
//   required TextEditingController weight,
//   required TextEditingController smm,
//   required TextEditingController fatMass,
//   required TextEditingController bfp,
//   required TextEditingController bmi,
//   required TextEditingController whr,
// });

// RegisterHandler registerAnthropometricAdapter(
//   IRegisterAnthropometricInputPort useCase,
// ) {
//   return ({
//     required TextEditingController userid,
//     required TextEditingController height,
//     required TextEditingController weight,
//     required TextEditingController smm,
//     required TextEditingController fatMass,
//     required TextEditingController bfp,
//     required TextEditingController bmi,
//     required TextEditingController whr,
//   }) async {
//     try {
//       final entity = UserAnthropometric(
//         userID: int.tryParse(userid.text),
//         height: double.tryParse(height.text),
//         weight: double.tryParse(weight.text),
//         smm: double.tryParse(smm.text),
//         fatMass: double.tryParse(fatMass.text),
//         bodyFatPercentage: double.tryParse(bfp.text),
//         bmi: double.tryParse(bmi.text),
//         whr: double.tryParse(whr.text),
//       );

//       debugPrint('Adapter -> enviando al caso de uso: $entity');

//       await useCase.registerAntrhopometric(entity);

//     } catch (e) {
//       debugPrint('Error en adapter: $e');
//       rethrow;
//     }
//   };
// }