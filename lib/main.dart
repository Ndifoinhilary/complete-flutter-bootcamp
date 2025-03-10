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
  int _personCount = 1;

  double _tipPercentage = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );

    void increment() {
      setState(() {
        _personCount = _personCount + 1;
      });
    }

    void decrement() {
      setState(() {
        if (_personCount > 1) {
          _personCount = _personCount - 1;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Universally Useful Tips'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Container(
            padding: EdgeInsets.all(20),
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

          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.money),
                      label: Text("Enter money to share"),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (String value) {},
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: theme.textTheme.titleMedium),
                      Row(
                        children: [
                          IconButton(
                            color: theme.colorScheme.primary,

                            onPressed: decrement,
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            "$_personCount",
                            style: theme.textTheme.titleMedium,
                          ),
                          IconButton(
                            color: theme.colorScheme.primary,
                            onPressed: increment,
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tips", style: style),
                      Text("\$20", style: style),
                    ],
                  ),
                  Text(
                    "${(_tipPercentage * 100).round()} %",
                    style: style.copyWith(fontSize: 12),
                  ),
                  Slider(
                    value: _tipPercentage,
                    onChanged:
                        (value) => {
                          setState(() {
                            _tipPercentage = value;
                          }),
                        },
                    min: 0.0,
                    max: 0.7,
                    label: "Percentage",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
