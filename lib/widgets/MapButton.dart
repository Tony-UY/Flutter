import 'package:flutter/material.dart';
import 'package:tp3/viewmodel/GameViewModel.dart';
import 'package:provider/provider.dart';

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
      onTap: () => gameViewModel.click(y, x),
      onLongPress: () => gameViewModel.onLongPress(y, x),
      child: gameViewModel.getIcon(y, x),
    );
  }
}
