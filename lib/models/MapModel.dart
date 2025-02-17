import 'dart:math';
import 'CaseModel.dart';

class MapModel {
  int nbLine;
  int nbCol;
  int nbBomb;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  MapModel(this.nbLine, this.nbCol, this.nbBomb);

  void initCases() {
    _cases = List<List<CaseModel>>.generate(
      nbLine,
          (int y) => List<CaseModel>.generate(nbCol, (int x) => CaseModel(), growable: true),
      growable: true,
    );
  }

  void initBomb() {
    int bombCount = 0;
    while (bombCount < nbBomb) {
      int x = Random().nextInt(nbCol);
      int y = Random().nextInt(nbLine);
      if (_cases[y][x].hasBomb == false) {
        _cases[y][x].hasBomb = true;
        bombCount++;
      }
    }
  }

  CaseModel? tryGetCase(int ligne, int colonne) {
    if ((colonne >= 0 && colonne < nbCol) && (ligne >= 0 && ligne < nbLine)) {
      return _cases[ligne][colonne];
    }
    return null;
  }

  int computeNumber(int ligne, int colonne) {
    int compteurBombe = 0;

    for (int j = -1; j <= 1; j++) {
      for (int i = -1; i <= 1; i++) {
        CaseModel? voisin = tryGetCase(ligne + i, colonne + j);
        if (voisin != null && voisin.hasBomb) {
          compteurBombe++;
        }
      }
    }
    return compteurBombe;
  }

  void initNumbers() {
    for (int y = 0; y < nbLine; y++) {
      for (int x = 0; x < nbCol; x++) {
        if (_cases[y][x].hasBomb == false) {
          _cases[y][x].number = computeNumber(y, x);
        }
      }
    }
  }

  void generateMap() {
    initCases();
    initBomb();
    initNumbers();
  }

  void reveal(int ligne, int colonne) {
    _cases[ligne][colonne].hidden = false;
  }

  void revealAll() {
    for (int y = 0; y < nbLine; y++) {
      for (int x = 0; x < nbCol; x++) {
        _cases[y][x].hidden = false;
      }
    }
  }

  void explode(int ligne, int col) {
    _cases[ligne][col].hasExploded = true;
  }

  void toggleFlag(int ligne, int colonne) {
    _cases[ligne][colonne].hasFlag = !_cases[ligne][colonne].hasFlag;
  }

  List<List<CaseModel>> get cases => _cases;
}
