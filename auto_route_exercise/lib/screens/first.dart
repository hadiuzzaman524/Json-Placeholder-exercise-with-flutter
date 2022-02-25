import 'package:auto_route/auto_route.dart';
import 'package:auto_route_exercise/routes/router.gr.dart';
import 'package:auto_route_exercise/screens/second.dart';
import 'package:auto_route_exercise/screens/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
             /*   Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SecondPage()));*/
                AutoRouter.of(context).pushNamed(SecondRoute.name);
              },
              child: const Text("Go to second page"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
              /*  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const ThirdPage()));*/
                //AutoRouter.of(context).pushNamed(ThirdRoute.name);
                context.router.push(const ThirdRoute());
              },
              child: const Text("Go to third page"),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
