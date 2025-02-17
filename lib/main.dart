import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3/view/GameView.dart';
import 'package:tp3/viewmodel/GameViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameViewModel(),
      child: MaterialApp(
        title: 'Jeu de Démineur',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true, // Utilisation du design Material 3
        ),
        initialRoute: '/', // Route initiale de l'application
        routes: {
          '/': (context) => const GameView(), // Affiche la vue principale du jeu
        },
      ),
    );
  }
}