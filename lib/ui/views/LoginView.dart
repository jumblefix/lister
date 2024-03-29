import 'package:flutter/material.dart';
import 'package:lister/core/viewmodels/views/LoginViewModel.dart';
import 'package:lister/ui/shared/AppColors.dart';
import 'package:lister/ui/views/BaseWidget.dart';
import 'package:lister/ui/widgets/LoginHeaderWidget.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      child: LoginHeaderWidget(controller: _controller),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            renderLogin(model),
          ],
        ),
      ),
    );
  }

  Widget renderLogin(LoginViewModel model) {
    if (model.hasErrorMessage) {
      return Center(
        child: Text(model.errorMessage),
      );
    } else if (model.busy) {
      return CircularProgressIndicator();
    } else {
      return FlatButton(
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () => model.login(_controller.text),
      );
    }
  }
}
