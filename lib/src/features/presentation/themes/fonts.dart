import 'package:flutter/material.dart';

class SizedFonts{
  static const String _fontFamily = 'Roboto';
  static const Color _fontColor = Colors.black;

  static const TextStyle smallFont = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: Colors.black
  );

  static const  TextStyle mediumFont =  TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    color: Colors.black
  );

  static const  TextStyle largeFont = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    color: _fontColor
  );
}


class SpecialFonts{
  static const String _fontFamily = 'Roboto';
  static const Color _fontColor = Colors.black;

  static const TextStyle smallFont = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: Colors.black,
    fontWeight: .bold,
    decoration: .underline 
  );

  static const  TextStyle mediumFont =  TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    color: Colors.black,
    fontWeight: .bold,
    decoration: .underline
  );

  static const  TextStyle largeFont = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    color: _fontColor,
    fontWeight: .bold,
    // decoration: .underline
  );

  static const  TextStyle xLargeFont = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    color: _fontColor,
    fontWeight: .bold,
    // decoration: .underline
  );
}