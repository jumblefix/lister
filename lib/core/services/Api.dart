import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lister/core/models/Comment.dart';
import 'package:lister/core/models/Post.dart';
import 'package:lister/core/models/User.dart';
import 'package:lister/ui/shared/AppConstants.dart';

class Api {
  static const endpoint = AppConstants.apiHost;

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    var response = await client.get('$endpoint/users/$userId');

    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();

    var response = await client.get('$endpoint/posts?userId=$userId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    var response = await client.get('$endpoint/comments?postId=$postId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
