import 'package:flutter/material.dart';

class SignUpFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formSignUp = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = '';
  String name = '';
  String lastName = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formSignUp.currentState?.validate() ?? false;
  }
}
