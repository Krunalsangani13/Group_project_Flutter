import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../Model/post_model.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;  // Observable list of posts
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        var jsonData = response.data as List;
        posts.value = jsonData.map((post) => PostModel.fromJson(post)).toList();
      }
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading(false);
    }
  }
}
