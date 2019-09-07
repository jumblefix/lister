import 'package:flutter/material.dart';
import 'package:lister/core/constants/RoutePaths.dart';
import 'package:lister/core/services/AuthenticationService.dart';
import 'package:lister/core/services/NavigationService.dart';
import 'package:lister/core/viewmodels/BaseModel.dart';
import 'package:lister/locator.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;
  final NavigationService _navigationService = locator<NavigationService>();

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    if (success) {
      _navigationService.navigateTo(RoutePaths.Home, arguments: 'fromLogin');
    } else {
      setErrorMessage('User not found!');
    }
    setBusy(false);
    return success;
  }
}
