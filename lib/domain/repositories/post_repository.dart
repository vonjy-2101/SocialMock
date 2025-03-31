import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';

abstract class PostRepository{

    ///Get post
    Future<List<PostEntity>> getPost();

    ///Get post be ID post
    Future<PostEntity> getPostByID(int id);

}