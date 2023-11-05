// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Set your home page here
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Username!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.cyan[700],
                      child: const Center(
                        child: Text('Quote of the day'),
                      ),
                    ),
                    const Column(
                      children: [
                        Text('“Lorem ipsum dolor sit amet,'),
                        Text('consectetur adipiscing elit,'),
                        Text('sed do eiusmod tempor incididunt ut'),
                        Text('labore et dolore magna aliqua.”'),
                        const Center(child: Text('-Anonymous')),
                        // Add more widgets for content
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
              child: const Center(
                child: Text(
                  'Subject 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            // Add more widgets for your home screen content
          ],
        ),
      ),
    );
  }
}
