import 'package:flutter/material.dart';
import 'package:salud_ulv_mobile_app/controllers/auth_controller.dart';
import 'package:salud_ulv_mobile_app/widgets/text_input_field.dart';
import 'package:salud_ulv_mobile_app/views/screens/auth_screens/login.dart';


class RegisterUserDataScreen extends StatefulWidget {
  final String fullname;
  final String email;
  final String password;
  const RegisterUserDataScreen({super.key,  required this.fullname, required this.email, required this.password});

  @override
  State<RegisterUserDataScreen> createState() => _RegisterUserDataScreenState();
}

class _RegisterUserDataScreenState extends State<RegisterUserDataScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  // Need of controller for a custom texform entry
  final userIDController = TextEditingController();
  final workPlaceController = TextEditingController();
  final vicerrectoriaController = TextEditingController();
  bool _isLoading = false;

  void registerUser() async{
  setState(() {
      _isLoading = true;
  });
    await _authController.registerUser(
      context: context, 
      userID: userIDController.text, 
      fullname: widget.fullname,
      workPlace: workPlaceController.text,
      vicerrectoria: vicerrectoriaController.text,
      email: widget.email,
      password: widget.password
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
                const SizedBox(height: 75),
                Image.asset("assets/icons/organization.png", width: 150, height: 150),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "ID de empleado", hintText: "Ej. 12345", prefixIconRoute: "assets/icons/person-rounded.png", entryValue: userIDController),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Área de trabajo", hintText: "Ej. Escuela IDS", prefixIconRoute: "assets/icons/family-group.png", entryValue: workPlaceController),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Vicerrectoría", hintText: "Ej. Vicerrectoría Académica", prefixIconRoute: "assets/icons/hat-top.png", entryValue: vicerrectoriaController),
                const SizedBox(height: 20),

                InkWell
                  (
                    onTap: () {
                      if(_formkey.currentState!.validate()){
                        debugPrint("UserID: ${userIDController.text}");
                        debugPrint("WorkPlace: ${workPlaceController.text}");
                        debugPrint("Vicerrectoria: ${vicerrectoriaController.text}");
                        registerUser();
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
                        Text("Registrar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 18)),
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