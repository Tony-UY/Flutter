
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(secondPageTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur la seconde page !',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}