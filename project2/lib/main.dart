import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/cubits/counter_cubit.dart';
import 'package:project2/cubits/helper_cubit.dart';
import 'package:project2/routs/mainroute.dart';
import 'package:project2/screens/fourth.dart';
import 'package:project2/screens/home.dart';
import 'package:project2/screens/third.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static final CounterCubit counterCubit = CounterCubit();
  final appRoute = AppRoute();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Named Route..
      initialRoute: '/',
      onGenerateRoute: appRoute.onGenerateRoute,
      routes: {
        ThirdScreen.routeName: (ctx) => BlocProvider.value(
              value: counterCubit, //BlocProvider.of<CounterCubit>(context),
              child: const ThirdScreen(),
            ),
        '/': (ctx) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HelperCubit(),
                ),
                BlocProvider(
                  create: (ctx) => counterCubit,
                ),
              ],
              child: const Home(),
            ),
      },
    );
  }
}
