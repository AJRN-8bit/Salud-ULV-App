
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';
import '../../../../../../core/domain/userAnthropometric/ports/outports.dart';

class RegisterAnthropometricsHttpOutAdapter implements IRegisterAnthropometricOutPort{
  @override
  Future<void> saveData(UserAnthropometric data) async {
      const apiURL = ('http://10.210.90.54:3010/api/v2/user/register/antrophometric');
      
    try {
      debugPrint("-- Sending data to API --");
      debugPrint(data.toString());

      final response = await http.post(
        Uri.parse(apiURL),
        body: jsonEncode(
        {
          // "registerID": data.registryID.toString(),
          "userID": data.userID.toString(),
          "height": data.height.toString(),
          "weight": data.weight.toString(),
          "smm": data.smm.toString(),
          "fatMass": data.fatMass.toString(),
          "bodyFatPercentage": data.bodyFatPercentage.toString(), 
          "bmi": data.bmi.toString(),
          "whr": data.whr.toString(),
          // "registryDate": data.registryDate.toString()
        }),   
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
      throw Exception('Error al registrar antropometricos');
      }
      else if(response.persistentConnection == false){
        debugPrint(response.persistentConnection.toString());
      throw Exception('No pudo conectarse a la API');
      }
    } catch (e) {
      debugPrint('${e}');
    }

  }
}