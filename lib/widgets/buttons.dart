import "package:flutter/material.dart"; 

class NavigateButton extends StatelessWidget {
  final Function nextScreen;
  final String buttonText;

  const NavigateButton({
    super.key,
    required this.nextScreen,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return InkWell
    (
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen()));
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
        child: Text(buttonText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 18)),
      ),
    );
  }
}



class ActionButton extends StatelessWidget {
  final Function action;
  final String buttonText;
  final bool isloading;

  const ActionButton({
    super.key,
    required this.action,
    required this.buttonText,
    required this.isloading
  });

  @override
  Widget build(BuildContext context) {
    return InkWell
    (
      onTap: () {
        action;
      },
      child: Container(
        width: 150,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF0559A2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
      
        ),
        child: isloading ? CircularProgressIndicator(color: Colors.white,) :
          Center(child: Text(buttonText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 18))),
      ),
    );
  }
}
