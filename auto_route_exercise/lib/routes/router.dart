// @CupertinoAutoRouter    
// @AdaptiveAutoRouter    
// @CustomAutoRouter    
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_exercise/screens/first.dart';
import 'package:auto_route_exercise/screens/second.dart';
import 'package:auto_route_exercise/screens/third.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: SecondPage),
    AutoRoute(page: ThirdPage),
  ],
)
class $AppRouter {}