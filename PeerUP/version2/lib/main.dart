// ignore_for_file: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:peerup/homepage/loading_page.dart';
import 'package:peerup/homepage/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(  
      debugShowCheckedModeBanner: false,
      title: 'PeerUP',
      home: MyHomePage(),
    );
  }
}

