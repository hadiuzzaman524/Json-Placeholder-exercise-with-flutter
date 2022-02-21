import 'package:auto_route_exercise/routes/router.gr.dart';
import 'package:auto_route_exercise/screens/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   final _appRouter = AppRouter();

   @override
   Widget build(BuildContext context){
     return MaterialApp.router(
       routerDelegate: _appRouter.delegate(),
       routeInformationParser: _appRouter.defaultRouteParser(),
     );
   }
}
