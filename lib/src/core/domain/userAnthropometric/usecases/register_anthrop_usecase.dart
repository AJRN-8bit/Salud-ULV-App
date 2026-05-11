import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/middleware/errors.dart';
import '../ports/inports.dart';
import '../ports/outports.dart';
import '../models/user_anthropometric.dart';

class RegisterAntrhopometricDataUseCase implements IRegisterAnthropometricInPort{
  final IRegisterAnthropometricOutPort _registerAnthropometricOutPort;

  const RegisterAntrhopometricDataUseCase(this._registerAnthropometricOutPort);

  @override
  Future<void> registerAnthropometric(UserAnthropometric data) async{

    debugPrint("Inside use case");

    // ----- Anthropometrics validation: The values can be added a toleration of 2.
    // Heihght range: 100 cm - 250 cm
    if(!(data.height! >= 100 && data.height! <= 250)){throw ValidationError("Altura entre 100 cm a 250 cm");}
    
    // Weight range: 30 - 300
    if(!(data.weight! >= 30 && data.weight! <= 300)){throw ValidationError("Peso entre 30 - 300");} //stndy

    // SMM range: 15 - 38
    if(!(data.smm! >= 15 && data.smm! <= 38)){throw ValidationError("SMM entre 15 - 38");}

    // Fatmass range: 5 - 50 % (on kilograms stand by)
    if(!(data.fatMass! >= 5 && data.fatMass! <= 50)){throw ValidationError("Masa Grasa entre # - #");}

    // Body fat percentage range: 15 - 30
    if(!(data.bodyFatPercentage! >= 15 && data.bodyFatPercentage! <= 30)){throw ValidationError("% Grasa entre 15 - 30");}

    // Body mass index range: 18.5 - 40
    if(!(data.bmi! >= 18.5 && data.bmi! <= 40)){throw ValidationError("IMC entre 18.5 - 40");}

    // Waist hip ratio range: 0.7 - 0.9
    if(!(data.whr! >= 0.70 &&  data.whr! <= 0.90)){throw ValidationError("ICC entre 0.7 - 0.9");}
    
    
    // Save data on the local database
    await _registerAnthropometricOutPort.saveData(data);
  }
}
