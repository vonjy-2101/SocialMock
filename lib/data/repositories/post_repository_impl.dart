import 'package:flutter_api_clean_architecture/data/datasources/post_api_service.dart';
import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository{

    final PostApiService _postApiService;
    PostRepositoryImpl(this._postApiService);


    @override
    Future<List<PostEntity>> getPost({int startIndex = 1}) async{
        return await _postApiService.fetchAllPost(startIndex: startIndex);
    }

    @override
    Future<PostEntity> getPostByID(int id) async {
        return await _postApiService.fetchPostById(id);
    }


}