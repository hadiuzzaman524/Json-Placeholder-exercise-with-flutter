import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/cubits/counter_cubit.dart';

class FourthScreen extends StatelessWidget {
  static const routeName = "/FourthScreen";

  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth Screen"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return Builder(builder: (context) {
            final state = BlocProvider.of<CounterCubit>(context).state;

            return Text(
              "Using Generate Route Count: ${state.count}",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            );
          });
        }),
      ),
    );
  }
}
