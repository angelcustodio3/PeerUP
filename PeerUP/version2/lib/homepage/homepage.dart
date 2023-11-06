// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key, required String title});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController textController = TextEditingController();
  FocusNode textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (textFieldFocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(textFieldFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment(-0.80, -0.93),
                child: Text(
                  'Welcome,\nUsername!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.00, -0.59),
                child: Container(
                  width: 331,
                  height: 176,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6493A5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x40000000),
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Stack(
                    children: [
                      Align(
                        alignment: Alignment(0.00, -0.80),
                        child: Text(
                          'QUOTE OF THE DAY',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.00, -0.10),
                        child: Text(
                          '“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.00, 0.86),
                        child: Text(
                          '- Anonymous',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.00, -0.10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white, // Change the color as needed
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x34090F13),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: TextFormField(
                        controller: textController,
                        focusNode: textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Search',
                          labelStyle: const TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          hintStyle: const TextStyle(
                            // Define hint text style
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF6493A5),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        // Add validator if needed
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.70, -0.92),
                child: IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: Color(0xFF6493A5),
                    size: 60,
                  ),
                  onPressed: () {
                  },
                ),
              ),
              Align(
                alignment: const Alignment(-0.70, 0.23),
                child: Container(
                  width: 144,
                  height: 95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFADD),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-2.58, 0.86),
                child: Container(
                  width: 144,
                  height: 95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFADD),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.70, 0.17),
                child: Container(
                  width: 144,
                  height: 57,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5CCEC),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.59, 0.23),
                child: Container(
                  width: 144,
                  height: 95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFADD),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.60, 0.17),
                child: Container(
                  width: 144,
                  height: 57,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2DDFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.70, 0.57),
                child: Container(
                  width: 144,
                  height: 95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFADD),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.70, 0.49),
                child: Container(
                  width: 144,
                  height: 57,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDDDD),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(-0.71, 0.29),
                child: Text(
                  'CMSC 128',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF6493A5),
                    fontSize: 15,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(-0.71, 0.59),
                child: Text(
                  'CMSC 131',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF6493A5),
                    fontSize: 15,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(0.28, 0.29),
                child: Text(
                  'CMSC 134',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF6493A5),
                    fontSize: 15,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(0.81, 0.82),
                child: Icon(
                  Icons.add_circle,
                  color: Color(0xFF6493A5),
                  size: 50,
                ),
              ),
              Align(
                alignment: const Alignment(-0.17, 0.13),
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),

              Align(
                alignment: const Alignment(-0.17, 0.44),
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),

              Align(
                alignment: const Alignment(0.72, 0.13),
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
<<<<<<< HEAD
      body: ListView(
        children: [ 
          Container(
            // child: TextField(
            //   decoration: InputDecoration(
            //     focusedBorder: 
            //   ),
            // ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.amber,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.blue,
          )
        ],
      ),
=======
>>>>>>> e49f1156967c22ddc3c120a9ba0601645a69e832
    );
  }
}


