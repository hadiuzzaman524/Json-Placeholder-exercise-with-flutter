import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/cubits/counter_cubit.dart';
import 'package:project2/screens/fourth.dart';
import 'package:project2/screens/third.dart';

import '../main.dart';
import '../screens/home.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case FourthScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider.value(
            value: MyApp.counterCubit,
            child: const FourthScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (ctx) => const Home());
    }
  }
}
