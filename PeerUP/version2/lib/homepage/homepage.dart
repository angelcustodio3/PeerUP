import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required String title});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6493A5),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment(-0.80, -0.98),
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
                          color: Color(0xFF6493A5),
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
                    color: const Color(0xFF333232),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x34090F13),
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Color(0xFF6493A5),
              size: 40,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
