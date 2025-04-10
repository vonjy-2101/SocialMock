import 'package:dio/dio.dart';
import 'package:flutter_api_clean_architecture/data/datasources/comment_api_service.dart';
import 'package:flutter_api_clean_architecture/data/datasources/post_api_service.dart';
import 'package:flutter_api_clean_architecture/data/datasources/user_api_service.dart';
import 'package:flutter_api_clean_architecture/data/repositories/comment_repository_impl.dart';
import 'package:flutter_api_clean_architecture/data/repositories/post_repository_impl.dart';
import 'package:flutter_api_clean_architecture/data/repositories/user_repository_impl.dart';

class AppModules {

    static late Dio _dio;
    static late PostApiService _postApi;
    static late PostRepositoryImpl postRepository;
    static late CommentApiService _commentApiService;
    static late CommentRepositoryImpl commentRepositoryImpl;
    static late UserApiService _userApiService;
    static late UserRepositoryImpl userRepositoryImpl;

    static void setup()
    {
        // Configuration Dio
        _dio = Dio(BaseOptions(
            baseUrl: 'https://jsonplaceholder.typicode.com',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 3),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
            },
        ));

        // Ajout d'intercepteurs
        _dio.interceptors.add(LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
        ));

        //service for post
        _postApi = PostApiService(_dio);
        postRepository = PostRepositoryImpl(_postApi);

        //service for comment
        _commentApiService = CommentApiService(_dio);
        commentRepositoryImpl = CommentRepositoryImpl(_commentApiService);

        //servuce for user
        _userApiService = UserApiService(_dio);
        userRepositoryImpl = UserRepositoryImpl(_userApiService);

    }

}
