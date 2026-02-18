
import 'package:flutter/material.dart';
import 'package:salud_ulv_mobile_app/models/user.dart';
import 'package:salud_ulv_mobile_app/service/http_response_manager.dart';
import 'package:salud_ulv_mobile_app/global_variables.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/login.dart';
import 'package:salud_ulv_mobile_app/views/screens/register_activity/main.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<void> registerUser({
    required BuildContext context,
    required String userID,
    required String workPlace,
    required String vicerrectoria,
    required String email,
    required String password,
    required String fullname,

  }) async {
    try {
      final User user = User(
        id: '',
        userID: userID, 
        fullname: fullname,
        workPlace: workPlace, 
        vicerrectoria: vicerrectoria, 
        email: email, 
        password: password, 
        token: ''
        );

      final http.Response response = await http.post(
        Uri.parse('$uri/auth/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        }
      );

      manageHTTPResponse(
        response: response,
        context: context,
        onSuccess: (){
          showSnackbar(context, 'Account successfully created!');
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      });

    } catch (e) {
      debugPrint(e.toString());
      showSnackbar(context, e.toString());
    }
  }


    // Implementation for user login
  Future<void> loginUser({
  required BuildContext context,
  required String email,
  required String password
  }) async {
    try {
      final User user = User(
        id: '',
        userID: '', 
        fullname: '',
        workPlace: '', 
        vicerrectoria: '', 
        email: email, 
        password: password, 
        token: ''
        );

      final http.Response response = await http.post(
        Uri.parse('$uri/auth/api/login'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        }
      );

      manageHTTPResponse(
        response: response,
        context: context,
        onSuccess: (){
          showSnackbar(context, 'Signed in successfully!');
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterActivityMainScreen()));
      });
      
    } catch (e) {
      debugPrint(e.toString());
      showSnackbar(context, e.toString());
    }
  }
}