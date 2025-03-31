import 'package:flutter/material.dart';
import 'package:flutter_api_clean_architecture/domain/entities/comment_entity.dart';
import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/comment_repository.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/post_repository.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/user_repository.dart';

class PostProvider extends ChangeNotifier {

    final PostRepository _postRepository;
    final CommentRepository _commentRepository;
    final UserRepository _userRepository;

    PostProvider(this._postRepository,this._commentRepository,this._userRepository);

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
            _posts = await _postRepository.getPost();
            await Future.forEach(_posts, (post) async {
                var autor = await _userRepository.getUserById(post.userId);
                post.setUserPost(autor);

                var comments = await _commentRepository.getCommentByPost(post.id);
                post.setComments(comments);
            });
            _error = null;   
        }catch(e)
        {
            _error = e.toString();
        }finally{
            _isLoading = false;
            notifyListeners();
        }
    }

}