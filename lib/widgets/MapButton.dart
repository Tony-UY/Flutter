import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3/viewmodel/GameViewModel.dart';

class MapButton extends StatelessWidget {
  final int x;
  final int y;

  const MapButton({
    super.key,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    final gameViewModel = context.watch<GameViewModel>();

    return InkWell(
      onTap: () => gameViewModel.click(x, y),
      onLongPress: () => gameViewModel.onLongPress(x, y),
      child: gameViewModel.getIcon(x, y),
    );
  }
}
