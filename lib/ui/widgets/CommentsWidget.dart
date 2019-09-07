import 'package:flutter/material.dart';
import 'package:lister/core/models/Comment.dart';
import 'package:lister/core/viewmodels/widgets/CommentsViewModel.dart';
import 'package:lister/ui/shared/AppColors.dart';
import 'package:lister/ui/shared/UIHelper.dart';
import 'package:lister/ui/views/BaseWidget.dart';
import 'package:provider/provider.dart';

class CommentsWidget extends StatelessWidget {
  final int postId;
  CommentsWidget(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommentsModel>(
      onModelReady: (model) => model.fetchComments(postId),
      model: CommentsModel(api: Provider.of(context)),
      builder: (context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: model.comments.length,
                itemBuilder: (context, index) =>
                    CommentItem(model.comments[index]),
              ),
            ),
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.commentColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
