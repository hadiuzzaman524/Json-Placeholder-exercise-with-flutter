import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/cubits/counter_cubit.dart';
import 'package:project2/cubits/helper_cubit.dart';
import 'package:project2/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HelperCubit(),
            ),
            BlocProvider(
              create: (ctx) => CounterCubit(),
            ),
          ],
          child: const Home(),
        ));
  }
}
