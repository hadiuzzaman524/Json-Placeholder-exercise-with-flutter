import 'package:flutter/material.dart';
import 'package:jsonex/cubit/helper_cubit.dart';
import 'package:jsonex/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HelperCubit(),
        child: HomePage(),
      ),
    );
  }
}
