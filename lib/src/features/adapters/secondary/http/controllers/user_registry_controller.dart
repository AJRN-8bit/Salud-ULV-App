import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/user/ports/secondary/user_auth_outport.dart';

class UserRegistryOutAdapter implements IUserRegistryOutputPort{
  @override
  Future<void> registerUserOut(
    int userID,
    String email,
    String password
  ) async {
    try {
      debugPrint("Adaptador Out -> Saliendo de caso de uso");

      const apiURL = ('http://10.235.35.54:3000/api/v2/user/register');
      final response = await http.post(
        Uri.parse(apiURL),
        body: jsonEncode({
          "userID": userID.toString(),
          "email": email.toString(),
          "password": password.toString(),
        }),
        headers: {'Content-Type': 'application/json'},
      );
        debugPrint("Adaptador Out -> Saliendo a API");
      
      if (response.statusCode != 201) {
      debugPrint(response.statusCode.toString());
      throw Exception('Error al registrar usuario');
      }
    } catch (e) {
      debugPrint(' $e');
    }
  }
}