import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  double _position = 100;

  List<String> errors = [];

  bool _isLoading = false;

  set position(double val) {
    _position = val;
    notifyListeners();
  }

  double get position => _position;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  double positionn(BuildContext context) {
    final size = MediaQuery.of(context).size;

    switch (errors.length) {
      case 1:
        return size.height * 0.27;

      default:
        return size.height * 0.25;
    }
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;
}
