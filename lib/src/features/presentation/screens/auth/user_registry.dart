
import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/user/usecases/user_auth.dart';
import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/user_registry_controller.dart';
import 'package:salud_ulv_app/src/features/adapters/secondary/http/controllers/user_registry_controller.dart';

class CustomTextInputField extends StatefulWidget{
  final String topLabelText;
  final String hintText;
  // final String prefixIconRoute;
  final TextEditingController entryValue;

  const CustomTextInputField({
    super.key,
    required this.topLabelText,
    required this.hintText,
    // required this.prefixIconRoute,
    required this.entryValue
  });

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {

  final double textSize = 18;
  final double hintTextSize = 14;
  final double iconSize = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.topLabelText,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: textSize,
              fontWeight: .bold,
            ),
          ),
        ),
        TextFormField(
          controller: widget.entryValue,
          onChanged: (value){
            widget.entryValue.text = value;
          },
          validator: (value){
            if(value == null || value.isEmpty){
              return "Porfavor ingrese lo solicitado";
            }
            else{return null;}
          },

          showCursor: true,
          decoration: InputDecoration(
            labelText: widget.hintText,
            labelStyle: TextStyle(fontFamily: "Lato", fontSize: hintTextSize),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: Image.asset(widget.prefixIconRoute, width: iconSize, height: iconSize),
            ),
          ),
        // ),
      ],
    );
  }
}



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Need of controller for a custom texform entry
  final userIDController = TextEditingController();
  final emailController = TextEditingController();
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
                // const SizedBox(height: 50),
                // Image.asset("assets/icons/register.png", width: 200, height: 200),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "ID de Usuario", hintText: "Ej. 090017", entryValue: userIDController),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Correo electrónico", hintText: "Ej. test@gmail.com",  entryValue: emailController),
                const SizedBox(height: 20),
                CustomTextInputField(topLabelText: "Contraseña", hintText: "Ej. 12345678", entryValue: passwordController),
                const SizedBox(height: 20),

                                InkWell
                  (
                    onTap: ()  async{
                      if(_formkey.currentState!.validate()) {
                        debugPrint("Fullname: ${userIDController.text}");
                        debugPrint("Email: ${emailController.text}");
                        debugPrint("Password: ${passwordController.text}");

                        final outputAdapter = UserRegistryOutAdapter();
                        final useCase = RegisterUser(outputAdapter);

                        UserRegistryInAdapter authInController = UserRegistryInAdapter(
                          useridController: userIDController,
                          emailController: emailController,
                          passwordController: passwordController,
                          useCase: useCase
                        );

                        debugPrint("Desde UI");
                        await authInController.execute();
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => 
                        //   RegisterUserDataScreen(fullname: fullnameController.text, email: emailController.text, password: passwordController.text)));
                        

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
                      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
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


