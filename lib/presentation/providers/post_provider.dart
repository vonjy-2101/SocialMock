import 'package:flutter/material.dart';
import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/post_repository.dart';

class PostProvider extends ChangeNotifier {

    final PostRepository _postRepository;
    PostProvider(this._postRepository);

    bool _isLoading = false;
    List<PostEntity> _posts = [];
    String? _error;

    bool get isLoading => _isLoading;
    List<PostEntity> get posts => _posts;

    Future<void> fetchAllPosts() async
    {
        _isLoading = true;
        notifyListeners();

        try{
            _isLoading = false;
            _posts = await _postRepository.getPost();
            _error = null;
            notifyListeners();
        }catch(e)
        {
            _isLoading = false;
            _error = e.toString();
            notifyListeners();
        }
    }

}