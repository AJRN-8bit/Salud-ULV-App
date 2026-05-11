// import '../entities/user.dart';
import 'package:flutter/material.dart';

import '../ports/primary/user_auth_inport.dart';
import '../ports/secondary/user_auth_outport.dart';

class RegisterUser implements IUserRegistryInputPort{
  final IUserRegistryOutputPort userRegistryOutputPort;

  RegisterUser(this.userRegistryOutputPort);

  // Future<void> execute() async{
  @override
    Future<void> registerUserIn( int userID, String email, String password) async {

      // Input validation functions
      bool isValidUserID(int userID) {
        String idStr = userID.toString();
        return idStr.length <= 6 && RegExp(r'^[0-9]+$').hasMatch(idStr);
      }

      bool isValidEmail(String email) {
        final pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
        return RegExp(pattern).hasMatch(email);
      }

      bool isValidPassword(String password) {
        final hasMinLength = password.length >= 8;
        final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
        final hasNumber = RegExp(r'[0-9]').hasMatch(password);
        return hasMinLength && hasLetter && hasNumber;
      }


      debugPrint("Caso de Uso: -> Dentro de caso de uso");
      // Validates user input
      if (!isValidUserID(userID)) {
        throw Exception('UserID must be numeric and up to 6 digits.');
      }

      if (!isValidEmail(email)) {
        throw Exception('Invalid email format.');
      }

      if (!isValidPassword(password)) {
        throw Exception('Password must be at least 8 characters long and contain both letters and numbers.');
      }


      await userRegistryOutputPort.registerUserOut(userID, email, password);
  }
}