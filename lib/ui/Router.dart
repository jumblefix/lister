import 'package:flutter/material.dart';
import 'package:lister/core/constants/RoutePaths.dart';
import 'package:lister/core/models/Post.dart';
import 'package:lister/ui/views/HomeView.dart';
import 'package:lister/ui/views/LoginView.dart';
import 'package:lister/ui/views/PostView.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
