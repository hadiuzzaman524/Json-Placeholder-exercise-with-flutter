import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  static const routeName = "/FourthScreen";

  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth Screen"),
      ),
      body:  Center(
        child: Builder(
          builder: (context) {
            return const Text(
              "Count: 4}",
              style: TextStyle(
                fontSize: 22,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            );
          }
        ),
      ),
    );
  }
}
