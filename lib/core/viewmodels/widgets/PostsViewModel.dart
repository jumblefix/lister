import 'package:flutter/widgets.dart';
import 'package:lister/core/models/Post.dart';
import 'package:lister/core/services/Api.dart';
import 'package:lister/core/viewmodels/BaseModel.dart';

class PostsModel extends BaseModel {
  Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
