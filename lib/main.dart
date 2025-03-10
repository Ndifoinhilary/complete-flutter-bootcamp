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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 5, 78, 214),
        ),
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
    var theme = Theme.of(context);
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Universally Useful Tips'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Column(
              children: [
                Text("Total per Person", style: style),
                Text("\$20", style: style.copyWith(fontSize: 24)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
