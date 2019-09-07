import 'package:flutter/material.dart';
import 'package:lister/ui/shared/TextStyles.dart';
import 'package:lister/ui/shared/UIHelper.dart';

class LoginHeaderWidget extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;

  LoginHeaderWidget({@required this.controller, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Login', style: TextStyles.headerStyle),
        UIHelper.verticalSpaceMedium,
        Text('Enter a number between 1 - 10', style: TextStyles.subHeaderStyle),
        LoginTextField(controller),
        this.validationMessage != null
            ? Text(
                validationMessage,
                style: TextStyle(color: Colors.red),
              )
            : Container()
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;

  LoginTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: 'User Id'),
        controller: controller,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
