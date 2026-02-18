import "package:flutter/material.dart"; 
import 'package:salud_ulv_mobile_app/controllers/auth_controller.dart';
import 'package:salud_ulv_mobile_app/widgets/text_input_field.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/signup1.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  bool _isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async{
  setState(() {
      _isLoading = true;
  });
    await _authController.loginUser(
      context: context, 
      email: emailController.text, 
      password: passwordController.text
    ).whenComplete((){
      setState(() {
        _isLoading = false;
      });
    });
  }

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
                const SizedBox(height: 100),
                Image.asset("assets/icons/login.png", width: 200, height: 200),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Correo electrónico", hintText: "", prefixIconRoute: "assets/icons/email.png", entryValue: emailController),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Contraseña", hintText: "", prefixIconRoute: "assets/icons/password.png", entryValue: passwordController),
                const SizedBox(height: 20),

                // ActionButton(action: ()=> loginUser(), buttonText: "Ingresar", isloading: _isLoading)
                InkWell
                  (
                    onTap: () {
                      if(_formkey.currentState!.validate()){
                        debugPrint("Email: ${emailController.text}");
                        debugPrint("Password: ${passwordController.text}");
                        loginUser();
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
                      child: _isLoading ? CircularProgressIndicator(color: const Color.fromARGB(255, 206, 245, 255),) :
                        Text("Ingresar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 18)),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                  mainAxisAlignment: .center,
                  children:[
                    Text("¿No tienes una cuenta?", style: TextStyle(fontFamily: "Lato", fontSize: 12, color: Colors.black)),
                    const SizedBox(width: 5),
            
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                      child: Text("Regístrate", style: TextStyle(fontFamily: "Lato", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.cyan.shade400))),
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
  