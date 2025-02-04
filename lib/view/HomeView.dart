import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp2/widgets/CustomCounter.dart';

import '../core/constants/constants.dart';
import 'Page2.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const Page2(),
      },
    );
  }
}

/*
 * Page d'accueil et son état mutable
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});


  // Fonction build qui construit l'UI associé à l'état de votre page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Image.asset('assets/logo.png', height: 40),
              ),
              const SizedBox(width: 10),
              const Text(appTitle),
            ],
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const CustomCounter(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Aller à la deuxième page'),
            ),
          ],
        ),
      ),
    );

  }
}

/*
 * La seconde page de votre app
 */
