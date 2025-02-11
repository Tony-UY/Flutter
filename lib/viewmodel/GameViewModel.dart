import 'package:flutter/cupertino.dart';
import 'package:tp3/models/CaseModel.dart';
import 'package:tp3/models/MapModel.dart';

class GameViewModel extends ChangeNotifier {

  MapModel easyMap = MapModel(10, 18, 10);

  void generateMap() {
    easyMap.generateMap();
  }

  void click(int x, int y) {
    if (easyMap.cases[x][y].hasFlag) {
      easyMap.reveal(x,y);
      if (easyMap.cases[x][y].hasBomb) {
        easyMap.explode(x,y);
        easyMap.revealAll();
      }
    }
    notifyListeners();
  }

  void onLongPress(int x, int y) {
    easyMap.toggleFlag(x,y);
    notifyListeners();
  }

  Image getIcon(int x, int y) {
    int ?condition;

    if (easyMap.cases[x][y].hasFlag) {
      condition = 9;
    }

    else if (easyMap.cases[x][y].hasBomb) {
      condition = 10;
    }

    else if (easyMap.cases[x][y].hasExploded) {
      condition = 11;
    }
    else {
      condition = easyMap.cases[x][y].number;
    }

    switch (condition) {
      case 0:
        return Image.asset('assets/image0.jpeg', height: 40);

      case 1:
        return Image.asset('assets/image1.jpeg', height: 40);

      case 2:
        return Image.asset('assets/image2.jpeg', height: 40);

      case 3:
        return Image.asset('assets/image3.jpeg', height: 40);

      case 4:
        return Image.asset('assets/image4.jpeg', height: 40);

      case 5:
        return Image.asset('assets/image5.jpeg', height: 40);

      case 6:
        return Image.asset('assets/image6.jpeg', height: 40);

      case 7:
        return Image.asset('assets/image7.jpeg', height: 40);

      case 8:
        return Image.asset('assets/image8.jpeg', height: 40);

      case 9:
        return Image.asset('assets/drapeau.jpg', height: 40);

      case 10:
        return Image.asset('assets/bombe.png', height: 40);

      case 11:
        return Image.asset('assets/explose.png', height: 40);

      default:
        return Image.asset('assets/img_default.png', height: 40);
    }
    notifyListeners();
  }
}