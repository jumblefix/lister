import 'package:flutter/material.dart';
import 'package:lister/core/constants/RoutePaths.dart';
import 'package:lister/provider_setup.dart';
import 'package:lister/ui/Router.dart';
import 'package:lister/ui/shared/AppConstants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
