import 'package:flutter/material.dart';

class AddCarFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String carName = '';
  String year = '';
  String engine = '';
  String model = '';
  String price = '';
  String buyDate = '';
  String img = "";

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;
}
