import 'package:dio/dio.dart';
import 'package:flutter_api_clean_architecture/domain/entities/comment_entity.dart';

class CommentApiService {

    final Dio _dio;
    CommentApiService(this._dio);

    Future <List<CommentEntity>> fetchCommentByPost(int idPost) async
    {
        try{
            
            final response = await _dio.get('/comments?postId=$idPost');
            return (response.data as List).map((item) => CommentEntity.fromJson(item)).toList();

        }on DioException catch(e)
        {
            print('Erreur lors de la récupération des posts: ${e.message}');
            print('Statut: ${e.response?.statusCode}');
            print('Données: ${e.response?.data}');
            throw Exception('Impossible de charger les posts: ${e.message}');
        }
    }

}