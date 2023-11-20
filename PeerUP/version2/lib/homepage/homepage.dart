import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peerup/homepage/subject1.dart';
import 'package:peerup/homepage/subject2.dart';
import 'package:peerup/homepage/LogIn.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required String title}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController textController = TextEditingController();
  FocusNode textFieldFocusNode = FocusNode();
  String selectedBackground = 'default';

  @override
  void initState() {
    super.initState();
    // _generateSubjectColors();
  }

  @override
  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  // void _generateSubjectColors() {
  // Generate colors for each subject and store them in the map
  // final random = Random();
  // for (String subject in subjects) {
  // final color = Color.fromRGBO(
  // random.nextInt(156),
  // random.nextInt(156),
  // random.nextInt(256),
  // 1.0,
  // );
  // subjectColors[subject] = color;
  // }
  // }

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
                  // Background image
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _getImage(selectedBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

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
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.00, -0.10),
                            child: Text(
                              ' ❝ It is during our darkest moments \nthat we must focus to see the light ❞ ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFF9F7F3),
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.00, 0.86),
                            child: Text(
                              '- Aristotle',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200),
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
                          color: const Color(
                              0xFFF9F7F3), // Change the color as needed
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
                                color: Color(0xFF0FA3B1),
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
                    alignment: const Alignment(0.75, -1.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.account_circle,
                        color: Color(0xFF0FA3B1),
                        size: 60,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    ),
                  ),

                  // Subjects sections
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 350.0),
                          padding: EdgeInsets.zero,
                          height: 140,
                          color: const Color(0xFFFFEDCE),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Subject1()),
                              );
                            },
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
                                  margin: const EdgeInsets.fromLTRB(
                                      10, 105, 10, 10),
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
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 350.0),
                          padding: EdgeInsets.zero,
                          height: 140,
                          color: const Color(0xFFFFEDCE),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Subject2()),
                              );
                            },
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
                                  margin: const EdgeInsets.fromLTRB(
                                      10, 105, 10, 10),
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
                          )),
                    ],
                  ),

                  const Align(
                    alignment: Alignment(0.81, 0.80),
                    child: Icon(
                      Icons.add_circle,
                      color: Color(0xFF0FA3B1),
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

  void _showBackgroundMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(10, 50, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'Sunset',
          child: Text('Sunset'),
        ),
        PopupMenuItem<String>(
          value: 'Road',
          child: Text('Road'),
        ),
        PopupMenuItem<String>(
          value: 'Lofi',
          child: Text('Lofi'),
        ),
        PopupMenuItem<String>(
          value: 'Town',
          child: Text('Town'),
        ),
        PopupMenuItem<String>(
          value: 'Default',
          child: Text('Default'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedBackground = value;
        });
      }
    });
  }

  AssetImage _getImage(String imageName) {
    switch (imageName) {
      case 'Sunset':
        return AssetImage('assets/graphics/sunset.jpg');
      case 'Road':
        return AssetImage('assets/graphics/road.jpg');
      case 'Lofi':
        return AssetImage('assets/graphics/lofi.jpeg');
      case 'Town':
        return AssetImage('assets/graphics/town.jpg');
      default:
        return AssetImage('assets/graphics/white.jpeg');
    }
  }
}
