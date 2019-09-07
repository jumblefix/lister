import 'package:flutter/material.dart';
import 'package:lister/core/constants/RoutePaths.dart';
import 'package:lister/core/models/User.dart';
import 'package:lister/core/viewmodels/widgets/PostsViewModel.dart';
import 'package:lister/ui/views/BaseWidget.dart';
import 'package:lister/ui/widgets/PostItemWidget.dart';
import 'package:provider/provider.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsModel>(
      model: PostsModel(api: Provider.of(context)),
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) => PostItemWidget(
                post: model.posts[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.Post,
                    arguments: model.posts[index],
                  );
                },
              ),
            ),
    );
  }
}
