import 'dart:math';

import 'CaseModel.dart';

class MapModel {
  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();


  MapModel(this.nbLine, this.nbCol, this.nbBomb);

  void initCases() {
    _cases = List<List<CaseModel>>.generate(
        nbLine, (i) => List<CaseModel>.generate(nbCol, (j) => CaseModel()));
  }

  void initBomb() {
    int bombCount = 0;
    while (bombCount < nbBomb) {
      int x = Random().nextInt(nbCol);
      int y = Random().nextInt(nbLine);
      if (_cases[x][y].hasBomb == false) {
        _cases[x][y].hasBomb = true;
        bombCount++;
      }
    }
  }


  CaseModel? tryGetCase(int x, int y) {
    if ((x > nbCol && x >= 0) && (y < nbLine && y >= 0)) {
      return _cases[x][y];
    }
    return null;
  }

  int computeNumber(int x, int y) {
    int compteurBombe = 0;
    CaseModel? a = tryGetCase(x, y);
    int i = -1;
    int j = -1;
    while (j < 2) {
      while (i < 2) {
        if (_cases[x + i][y + j].hasBomb) {
          compteurBombe++;
        }
        i++;
      }
      i = -1;
      j++;
    }
    return compteurBombe;
  }


  void initNumbers() {
    for (int y = 0; y < nbLine; y++) {
      for (int x = 0; x < nbCol; x++) {
        if (_cases[x][y].hasBomb == false) {
          _cases[x][y].number = computeNumber(x, y);
        }
      }
    }
  }

  void generateMap() {
    initCases();
    initBomb();
    initNumbers();
  }

  void reveal(int x, int y) {
    _cases[x][y].hidden == false;
  }

  void revealAll() {
    for (int y = 0; y < nbLine; y++) {
      for (int x = 0; x < nbCol; x++) {
        _cases[x][y].hidden = false;
      }
    }
  }

  void explode(int x, int y) {
    _cases[x][y].hasExploded == true;
  }
  void toggleFlag(int x, int y){
    if(_cases[x][y].hasFlag == false){
      _cases[x][y].hasFlag == true;
    }
    else {
      _cases[x][y].hasFlag = false;
    }
  }

  List<List<CaseModel>> get cases => _cases;
}




