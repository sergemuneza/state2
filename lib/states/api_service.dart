import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:state/models/post_model.dart';

class ApiService {
  Future<List<Post>> fetchPost() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      final List<dynamic> posts = json.decode(response.body);
      return posts.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Failed to  fetch post from APi");
    }
  }
}
