import 'package:flutter/material.dart';

class LearnStateFullWidget extends StatefulWidget {
  const LearnStateFullWidget({super.key});

  @override
  State createState() => _StateCrateClassLearn();
}

class _StateCrateClassLearn extends State {
  TextEditingController controller = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(width: 2, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(20),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: Text("Currency Converter app"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                "${result != 0 ? result : 0}",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter the amount",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.money),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(controller.text) * 81;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
