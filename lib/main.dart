import 'package:budaya/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budaya Indonesia',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MainPage(),
      },
    );
  }
}
