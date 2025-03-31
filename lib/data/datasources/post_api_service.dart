import 'package:dio/dio.dart';
import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';

class PostApiService {

    final Dio _dio;

    PostApiService(this._dio);

    Future<List<PostEntity>> fetchAllPost() async
    {
        try{

            final response = await _dio.get('/posts');
            return (response.data as List).map((item) => PostEntity.fromJson(item)).toList();

        }on DioException catch (e)
        {
            print('Erreur lors de la récupération des posts: ${e.message}');
            print('Statut: ${e.response?.statusCode}');
            print('Données: ${e.response?.data}');
            throw Exception('Impossible de charger les posts: ${e.message}');
        }
    }

    Future<PostEntity> fetchPostById(int id) async
    {
        try{

            final response = await _dio.get('/posts/$id');
            final item = response.data;
            return PostEntity.fromJson(item);

        }on DioException catch (e)
        {
            print('Erreur lors de la récupération des posts: ${e.message}');
            print('Statut: ${e.response?.statusCode}');
            print('Données: ${e.response?.data}');
            throw Exception('Impossible de charger les posts: ${e.message}');
        }
    }

}