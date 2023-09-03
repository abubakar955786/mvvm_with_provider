import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/routes/name_routes.dart';
import 'package:mvvm_with_provider/routes/routes.dart';
import 'package:mvvm_with_provider/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
     // home: const SplashScreen(),

      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
