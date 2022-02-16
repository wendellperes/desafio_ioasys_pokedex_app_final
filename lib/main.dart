import 'package:flutter/material.dart';

import 'features/pokemons/presentation/pages/home_page.dart';
import 'features/pokemons/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Pokedex',
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) =>  SplashPage(),
        '/HomePage': (BuildContext context) =>  const HomePage(),
      },
    );
  }
}

