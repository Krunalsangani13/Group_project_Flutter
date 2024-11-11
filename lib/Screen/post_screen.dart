import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/post_controller.dart';

class

PostsScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: postController.posts.length,
          itemBuilder: (context, index) {
            var post = postController.posts[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  post.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(post.body),
              ),
            );
          },
        );
      }),
    );
  }
}
