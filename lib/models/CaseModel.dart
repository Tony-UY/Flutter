class CaseModel {
  bool hidden = true;
  bool _hasBomb = false;
  bool hasExploded = false;
  bool hasFlag = false;
  int? number;


  bool get hasBomb => _hasBomb;


  set hasBomb(bool value) {
    _hasBomb = value;
  }


}

