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
      create: (context) {
        final gameViewModel = GameViewModel();
        gameViewModel.generateMap();
        return gameViewModel;
      },
      child: MaterialApp(
        title: 'Jeu de Démineur',
        initialRoute: '/',
        routes: {
          '/': (context) => const GameView(),
        },
      ),
    );
  }
}
