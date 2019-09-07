import 'package:flutter/widgets.dart';
import 'package:lister/core/models/Comment.dart';
import 'package:lister/core/services/Api.dart';
import 'package:lister/core/viewmodels/BaseModel.dart';

class CommentsModel extends BaseModel {
  Api _api;

  CommentsModel({
    @required Api api,
  }) : _api = api;

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }
}
