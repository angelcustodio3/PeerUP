import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Username!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),

                  //profile
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 230, 211, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            //quote
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(10),
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
                      child: Text('Quote of the day'),
                    ),
                    //quotes
                    Column(
                      children: [
                        Text('“Lorem ipsum dolor sit amet,'),
                        Text('consectetur adipiscing elit,'),
                        Text(
                          'sed do eiusmod tempor incididunt ut',
                        ),
                        Text('labore et dolore magna aliqua.”'),
                        Container(
                          child: Center(child: Text('-Anonymous')),
                        ),

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
              margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
              padding: EdgeInsets.only(bottom: 25),
              color: const Color.fromRGBO(255, 230, 211, 1),
              child: Text(
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
