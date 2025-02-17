import 'package:flutter/material.dart';
import 'package:tp3/viewmodel/GameViewModel.dart';
import 'package:tp3/widgets/MapButton.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final gameViewModel = context.watch<GameViewModel>();

    gameViewModel.generateMap();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de Démineur'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Table(
                border: TableBorder.all(),
                children: List.generate(gameViewModel.easyMap.nbLine, (y) {
                  return TableRow(
                    children: List.generate(gameViewModel.easyMap.nbCol, (x) {
                      return MapButton(x: x, y: y);
                    }),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                gameViewModel.resetGame();
              },
              child: const Text('Recommencer'),
            ),
          ),
        ],
      ),
    );
  }
}
