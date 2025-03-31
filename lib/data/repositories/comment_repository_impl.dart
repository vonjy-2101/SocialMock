import 'package:flutter_api_clean_architecture/data/datasources/comment_api_service.dart';
import 'package:flutter_api_clean_architecture/domain/entities/comment_entity.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/comment_repository.dart';

class CommentRepositoryImpl extends CommentRepository{

    CommentApiService _commentApiService;
    CommentRepositoryImpl(this._commentApiService);

    @override
    Future<List<CommentEntity>> getCommentByPost(int idPost) {
        return _commentApiService.fetchCommentByPost(idPost);
    }
    
}