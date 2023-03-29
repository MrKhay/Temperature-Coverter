// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonData {
  final String buttonText;
  final Color textColor;
  const ButtonData({
    required this.buttonText,
    required this.textColor,
  });
}

const colorBlue = Colors.blue;
const colorWhite = Colors.white;
const List<ButtonData> gridData = [
  ButtonData(buttonText: '7', textColor: colorWhite),
  ButtonData(buttonText: '8', textColor: colorBlue),
  ButtonData(buttonText: '9', textColor: colorWhite),
  ButtonData(buttonText: '.', textColor: colorWhite),
  ButtonData(buttonText: '4', textColor: colorBlue),
  ButtonData(buttonText: '5', textColor: colorWhite),
  ButtonData(buttonText: '6', textColor: colorBlue),
  ButtonData(buttonText: '0', textColor: colorWhite),
  ButtonData(buttonText: '1', textColor: colorWhite),
  ButtonData(buttonText: '2', textColor: colorBlue),
  ButtonData(buttonText: '3', textColor: colorWhite),
  ButtonData(buttonText: 'X', textColor: Colors.red),
];
