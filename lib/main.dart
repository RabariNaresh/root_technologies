import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:root_technologies/provider/provider.dart';

import 'View/Screens/Landing_Page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ProProvider(),
      builder: (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
