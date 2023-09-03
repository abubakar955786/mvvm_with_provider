
import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/routes/name_routes.dart';
import 'package:mvvm_with_provider/view/home_screen.dart';
import 'package:mvvm_with_provider/view/login_screen.dart';
import 'package:mvvm_with_provider/view/splash_screen.dart';
import 'package:mvvm_with_provider/view_model/login_provider.dart';
import 'package:provider/provider.dart';
import '';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context)=> const SplashScreen());


      case RouteName.logInScreen:
        final args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context)=>
            ChangeNotifierProvider(
                create: (BuildContext context) => LogInProvider(),
                child: LogInScreen(args:  args)));


      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());

      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(body: Center(child: Text("Something went wrong."),),);
        });
    }
  }
}