// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peerup/homepage/subject1.dart';
import 'package:peerup/homepage/subject2.dart';


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
        backgroundColor: const Color(0xFFF9F7F3),
        body: SafeArea(
          top: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [

                  // Welcome Peer message at top
                  const Align(
                    alignment: Alignment(-0.80, -0.93),
                    child: Text(
                      'Welcome, Peer001!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Quote of the day container
                  Align(
                    alignment: const Alignment(0.00, -0.59),
                    child: Container(
                      width: constraints.maxWidth * 0.9, // Adjust as needed
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
                                color: const Color(0xFFF9F7F3),
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

                  // Search bar container
                  Align(
                    alignment: const Alignment(0.00, -0.10),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        width: constraints.maxWidth * 0.9, // Adjust as needed
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F7F3), // Change the color as needed
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

                  // Profile button container
                  Align(
                    alignment: const Alignment(0.70, -0.92),
                    child: IconButton(
                      icon: const Icon(
                        Icons.account_circle,
                        color: Color(0xFF6493A5),
                        size: 60,
                      ),
                      onPressed: () {
                        // Handle button press
                      },
                    ),
                  ),

                  // Subjects sections
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 350.0),
                        padding: EdgeInsets.zero,
                        height: 140,
                        color: const Color(0xFFFFEDCE),
                        child: GestureDetector(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Subject1()),
                          );},
                          child: Stack(
                          children: [
                            Container(
                              width: 200, // Adjust as needed
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFF81B29A),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 105, 10, 10),
                              child: const Text(
                              'CMSC 128',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF333232),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            )
                          ],
                        ),
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 350.0),
                        padding: EdgeInsets.zero,
                        height: 140,
                        color: const Color(0xFFFFEDCE),
                        child: GestureDetector(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Subject2()),
                          );},
                          child: Stack(
                          children: [
                            Container(
                              width: 200, // Adjust as needed
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7A072),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 105, 10, 10),
                              child: const Text(
                              'CMSC 134',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF333232),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            )
                          ],
                          
                        ),

                        )
                        
                      ),
                    ],
                  ),

                  
                  
                  const Align(
                    alignment: Alignment(0.81, 0.80),
                    child: Icon(
                      Icons.add_circle,
                      color: Color(0xFF6493A5),
                      size: 58,
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-0.17, 0.12),
                    child: SvgPicture.asset(
                      'assets/icons/menu2.svg',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  Align(
                    alignment: const Alignment(0.80, 0.12),
                    child: SvgPicture.asset(
                      'assets/icons/menu2.svg',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
