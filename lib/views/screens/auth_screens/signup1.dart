import 'package:flutter/material.dart';
import 'package:salud_ulv_mobile_app/widgets/text_input_field.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/login.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/signup2.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Need of controller for a custom texform entry
  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(250),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,

            child: Column(
              mainAxisAlignment: .center,
              children: [
                const SizedBox(height: 50),
                Image.asset("assets/icons/register.png", width: 200, height: 200),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Nombre completo", hintText: "Ej. Juan Pérez", prefixIconRoute: "assets/icons/person-rounded.png", entryValue: fullnameController),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Correo electrónico", hintText: "Ej. test@gmail.com", prefixIconRoute: "assets/icons/email.png", entryValue: emailController),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Contraseña", hintText: "Ej. 12345678", prefixIconRoute: "assets/icons/password.png", entryValue: passwordController),
                const SizedBox(height: 20),

                                InkWell
                  (
                    onTap: () {
                      if(_formkey.currentState!.validate()){
                        debugPrint("Fullname: ${fullnameController.text}");
                        debugPrint("Email: ${emailController.text}");
                        debugPrint("Password: ${passwordController.text}");
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => 
                          RegisterUserDataScreen(fullname: fullnameController.text, email: emailController.text, password: passwordController.text)));

                      } else{debugPrint("Error");}
                    },
                    child: Container(
                      width: 150,
                      height: 70,
                      alignment: .center,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0559A2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                    
                      ),
                      child: Text("Registrar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 18)),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                  mainAxisAlignment: .center,
                  children:[
                    Text("¿Tienes una cuenta?", style: TextStyle(fontFamily: "Lato", fontSize: 12, color: Colors.black)),
                    const SizedBox(width: 5),
            
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                      child: Text("Inicia sesión", style: TextStyle(fontFamily: "Lato", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.cyan.shade400))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}