import 'package:flutter/material.dart';

import 'Aula Outra/home_Aula.dart';
import 'UI/Home_page.dart';
import 'minh vez/Home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeAula(),
    );
  }
}
