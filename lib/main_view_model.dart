import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  String test = 'TEST';
  int counter = 0;

  void incCounter() {
    counter++;
    notifyListeners();
  }
}