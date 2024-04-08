import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/splash.dart';
import 'package:netflix_clone/themes/themes.dart';

void main() async{

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        scaffoldBackgroundColor: dark,
        appBarTheme:const AppBarTheme(color: dark,titleTextStyle: heading1),
      splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
        
      ),
      home: const SplashScreen(),
    );
  }
}
