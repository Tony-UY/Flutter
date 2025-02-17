import 'package:flutter/cupertino.dart';
import 'package:tp3/models/CaseModel.dart';
import 'package:tp3/models/MapModel.dart';

class GameViewModel extends ChangeNotifier {
  MapModel easyMap = MapModel(10, 18, 10);
  bool _isMapGenerated = false;

  void generateMap() {
    if (!_isMapGenerated) {
      easyMap.generateMap();
      _isMapGenerated = true;
      notifyListeners();
    }
  }

  void resetGame() {
    easyMap = MapModel(10, 18, 10);
    _isMapGenerated = false;
    generateMap();
    notifyListeners();
  }

  void click(int ligne, int colonne) {
    if (!easyMap.cases[ligne][colonne].hasFlag) {
      easyMap.reveal(ligne, colonne);
      if (easyMap.cases[ligne][colonne].hasBomb) {
        easyMap.explode(ligne, colonne);
        easyMap.revealAll();
      }
      notifyListeners();
    }
  }

  void onLongPress(int ligne, int colonne) {
    easyMap.toggleFlag(ligne, colonne);
    notifyListeners();
  }

  Image getIcon(int ligne, int colonne) {
    int condition;

    if (easyMap.cases[ligne][colonne].hidden){
      condition = 12;
    } else if (easyMap.cases[ligne][colonne].hasFlag) {
      condition = 9;
    } else if (easyMap.cases[ligne][colonne].hasBomb) {
      condition = 10;
    } else if (easyMap.cases[ligne][colonne].hasExploded) {
      condition = 11;
    } else {
      condition = easyMap.cases[ligne][colonne].number ?? 0;
    }

    switch (condition) {
      case 0: return Image.asset('assets/image0.jpeg', height: 40);
      case 1: return Image.asset('assets/image1.jpeg', height: 40);
      case 2: return Image.asset('assets/image2.jpeg', height: 40);
      case 3: return Image.asset('assets/image3.jpeg', height: 40);
      case 4: return Image.asset('assets/image4.jpeg', height: 40);
      case 5: return Image.asset('assets/image5.jpeg', height: 40);
      case 6: return Image.asset('assets/image6.jpeg', height: 40);
      case 7: return Image.asset('assets/image7.jpeg', height: 40);
      case 8: return Image.asset('assets/image8.jpeg', height: 40);
      case 9: return Image.asset('assets/drapeau.jpg', height: 40);
      case 10: return Image.asset('assets/bombe.png', height: 40);
      case 11: return Image.asset('assets/explose.png', height: 40);
      case 12: return Image.asset('assets/img_default.png', height: 40);
      default : return Image.asset('assets/img_default.png', height: 40);
    }
  }
}
