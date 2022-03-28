import 'package:flutter/material.dart';
import 'core/dependency_injector.dart';
import 'features/pokemons/presentation/pages/details_page.dart';
import 'features/pokemons/presentation/pages/favorit_page.dart';
import 'features/pokemons/presentation/pages/home_page.dart';
import 'features/pokemons/presentation/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokedex',
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const SplashPage(),
        '/HomePage': (BuildContext context) => const HomePage(),
        '/details': (BuildContext context) => const DetailsPage(),
        '/favorit': (BuildContext context) => const FavoritPage()
      },
    );
  }
}
