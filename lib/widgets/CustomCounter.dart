import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/CounterViewModel.dart';

class CustomCounter extends StatelessWidget {
  const CustomCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterViewModel = context.watch<CounterViewModel>();

    return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: counterViewModel.decrement,
                  ),
                  Text(
                    "Voici le nombre : ${counterViewModel.counter}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Icon(
                    Icons.favorite,
                    color: counterViewModel.counter < 0 ? Colors.black : Colors.red,
                    size: 50,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: counterViewModel.increment,
                  ),
                ],
              ),
            );
  }
}