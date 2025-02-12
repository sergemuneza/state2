import 'package:flutter/material.dart';
import 'package:state/models/post_model.dart';
import 'package:state/states/api_service.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  String _errorMessage = "";

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final ApiService _apiService = ApiService();
  Future<void> fetchPost() async {
    _isLoading = true;
    notifyListeners();

    try {
      _posts = await _apiService.fetchPost();
      _errorMessage = "";
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
