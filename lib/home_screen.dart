import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/buttondata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late TextEditingController celsiusTextController;
  late TextEditingController fahrenheitTextController;
  FocusNode celsiusFocusNode = FocusNode();
  FocusNode fahrenheitFocusNode = FocusNode();

  bool isCelsiusFiledSelected = true;
  final integerNumbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    '.'
  ];
  @override
  void initState() {
    super.initState();
    celsiusTextController = TextEditingController();
    fahrenheitTextController = TextEditingController();
  }

  @override
  void dispose() {
    celsiusTextController.dispose();
    fahrenheitTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    print(isCelsiusFiledSelected);

    if (celsiusFocusNode.hasFocus) {
      isCelsiusFiledSelected = true;

      setState(() {});
    }
    if (fahrenheitFocusNode.hasFocus) {
      isCelsiusFiledSelected = false;

      setState(() {});
    }

    celsiusTextController.addListener(() {
      if (celsiusFocusNode.hasFocus) {
        isCelsiusFiledSelected = true;
      }
      setState(() {});
    });

    fahrenheitFocusNode.addListener(() {
      if (fahrenheitFocusNode.hasFocus) {
        isCelsiusFiledSelected = false;
      }
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Temperature Converter',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Flexible(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                // color: Colors.amber,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// celecius container
                            GestureDetector(
                              onTap: () {
                                isCelsiusFiledSelected =
                                    !isCelsiusFiledSelected;
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: isCelsiusFiledSelected
                                            ? Colors.blue
                                            : Colors.grey)),
                                constraints: const BoxConstraints(
                                    minWidth: 30,
                                    maxWidth: 120,
                                    maxHeight: 100),
                                child: TextField(
                                  autofocus: true,
                                  focusNode: celsiusFocusNode,
                                  keyboardType: TextInputType.none,
                                  controller: celsiusTextController,
                                  style: GoogleFonts.nunito(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '°C',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Icon(FeatherIcons.cornerRightDown,
                              color: isCelsiusFiledSelected
                                  ? Colors.blue
                                  : Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(FeatherIcons.cornerLeftUp,
                              color: isCelsiusFiledSelected
                                  ? Colors.grey
                                  : Colors.blue),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Fahrenheit  container
                            GestureDetector(
                              onTap: () {
                                isCelsiusFiledSelected = false;
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: isCelsiusFiledSelected
                                            ? Colors.grey
                                            : Colors.blue)),
                                constraints: const BoxConstraints(
                                    minWidth: 30,
                                    maxWidth: 120,
                                    maxHeight: 100),
                                child: TextField(
                                  focusNode: fahrenheitFocusNode,
                                  keyboardType: TextInputType.none,
                                  controller: fahrenheitTextController,
                                  style: GoogleFonts.nunito(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '°F',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Flexible(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: 0.2,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                  Flexible(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.count(
                        crossAxisCount: 4,
                        childAspectRatio: 1.25,
                        mainAxisSpacing: 30,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(gridData.length, (index) {
                          final data = gridData[index];

                          return MaterialButton(
                            onLongPress: () {
                              if (data.buttonText == 'X') {
                                celsiusTextController.clear();
                                fahrenheitTextController.clear();
                              }
                            },
                            onPressed: () {
                              if (integerNumbers.contains(data.buttonText)) {
                                if (celsiusFocusNode.hasFocus) {
                                  if (data.buttonText == '.' &&
                                      celsiusTextController.text
                                          .contains('.')) {
                                    return;
                                  }
                                  editText(
                                      data.buttonText, celsiusTextController);
                                } else {
                                  if (data.buttonText == '.' &&
                                      fahrenheitTextController.text
                                          .contains('.')) {
                                    return;
                                  }
                                  editText(data.buttonText,
                                      fahrenheitTextController);
                                }
                              }

                              if (data.buttonText == 'X') {
                                if (isCelsiusFiledSelected) {
                                  deleteText(celsiusTextController);
                                } else {
                                  deleteText(fahrenheitTextController);
                                }
                              }

                              HapticFeedback.mediumImpact();
                            },
                            child: data.buttonText == 'X'
                                ? const Icon(
                                    FeatherIcons.delete,
                                    color: Colors.red,
                                  )
                                : Text(
                                    data.buttonText,
                                    style: GoogleFonts.nunito(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: data.textColor),
                                  ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    flex: 1,
                    child: MaterialButton(
                      minWidth: width,
                      height: 50,
                      shape: const Border(),
                      color: Colors.blue,
                      child: Text(
                        'Convert',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      onPressed: () {
                        if (isCelsiusFiledSelected) {
                          fahrenheitTextController.text =
                              covertToFahrenheit(celsiusTextController.text);
                        } else {
                          celsiusTextController.text =
                              covertToCelsius(fahrenheitTextController.text);
                        }
                        HapticFeedback.mediumImpact();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// convert from fahrenheit to celsius
String covertToCelsius(String value) {
  if (value.isEmpty) {
    return '';
  }
  var result = num.parse(value) - 32;
  result = result * 5 / 9;

  return result.toString();
}

// convert from celsius to fahrenheit
String covertToFahrenheit(String value) {
  if (value.isEmpty) {
    return '';
  }
  var result = num.parse(value) * 9 / 5;
  result = result + 32;

  return result.toString();
}

// adds text to textcontroller
void editText(String data, TextEditingController controller) {
  var expression = controller.value;
  var newExpression = TextEditingValue(
      text: expression.text.replaceRange(
        expression.selection.baseOffset,
        expression.selection.extentOffset,
        data,
      ),
      selection: TextSelection.collapsed(
        offset: expression.selection.baseOffset + data.length,
      ));

  controller.value = newExpression;
}

// delete text from text controller
void deleteText(TextEditingController controller) {
  var oldValue = controller.value;
  int cursorPosition = oldValue.selection.start;
  String newValueText = oldValue.text.substring(0, cursorPosition - 1) +
      oldValue.text.substring(
        cursorPosition,
      );
  var newValue = TextEditingValue(
    text: newValueText,
    selection: TextSelection.collapsed(offset: cursorPosition - 1),
  );

  var textData = newValue.text;
  var newValue1 = newValue.copyWith(
      text: textData,
      selection: TextSelection.collapsed(
        offset: textData.length,
      ));
  controller.value = newValue1;
}
