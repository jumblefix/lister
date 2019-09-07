import 'package:flutter/material.dart';
import 'package:lister/core/models/Post.dart';
import 'package:lister/core/models/User.dart';
import 'package:lister/ui/shared/AppColors.dart';
import 'package:lister/ui/shared/TextStyles.dart';
import 'package:lister/ui/shared/UIHelper.dart';
import 'package:lister/ui/widgets/CommentsWidget.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(post.title, style: TextStyles.headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body),
            CommentsWidget(post.id),
          ],
        ),
      ),
    );
  }
}
