import 'package:flutter/material.dart';
import 'package:practical_task/model/last_fm_model.dart';

class LastFmProvider extends ChangeNotifier {
  LastFmModel lasFmResponse = LastFmModel();
  int? detailItemIndex;

  set setLastFmResponse(LastFmModel response) {
    lasFmResponse = response;
    notifyListeners();
  }

  set setDetailItemIndex(int index) {
    detailItemIndex = index;
    notifyListeners();
  }
}
