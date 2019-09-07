import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lister/core/constants/RoutePaths.dart';
import 'package:lister/core/services/NavigationService.dart';
import 'package:lister/locator.dart';
import 'package:lister/provider_setup.dart';
import 'package:lister/ui/Router.dart';
import 'package:lister/ui/shared/AppConstants.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  setupLocator();

  runApp(MyApp());
}

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
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
