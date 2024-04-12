import 'package:flutter/material.dart';
import 'package:ejercicio4/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff23202a),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple[400],
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white70,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.grey[800]),
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      home: const PersonaListPage(),
    );
  }
}