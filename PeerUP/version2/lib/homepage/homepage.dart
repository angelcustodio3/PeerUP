import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
      body: SafeArea(
        child: ListView(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //welcome
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Username!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 24),
                      )
                    ],
                  ),

                  //profile
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 230, 211, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //quote
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    //quoute of the day
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.cyan[700],
                      child: const Text('Quote of the day'),
                    ),
                    //quotes
                    const Column(
                      children: [
                        Text('“Lorem ipsum dolor sit amet,'),
                        Text('consectetur adipiscing elit,'),
                        Text(
                          'sed do eiusmod tempor incididunt ut',
                        ),
                        Text('labore et dolore magna aliqua.”'),
                        Center(child: Text('-Anonymous')),

                        //subject 1
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
              padding: const EdgeInsets.only(bottom: 25),
              color: const Color.fromRGBO(255, 230, 211, 1),
              child: const Text(
                'Subject 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
