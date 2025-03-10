import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const UTips(),
    );
  }
}

class UTips extends StatefulWidget {
  const UTips({super.key});

  @override
  State<UTips> createState() => _UTipsState();
}

class _UTipsState extends State<UTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Universally Useful Tips'), centerTitle: true),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurple,
            ),
            child: Column(
              children: [
                Text("Column running here"),
                Text("20")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
