import "package:flutter/material.dart"; 

class CustomTextInputField extends StatefulWidget{
  final String topLabelText;
  final String hintText;
  final String prefixIconRoute;
  final TextEditingController entryValue;

  const CustomTextInputField({
    super.key,
    required this.topLabelText,
    required this.hintText,
    required this.prefixIconRoute,
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
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(widget.prefixIconRoute, width: iconSize, height: iconSize),
            ),
          ),
        ),
      ],
    );
  }
}