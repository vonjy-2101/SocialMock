import 'package:dio/dio.dart';
import 'package:flutter_api_clean_architecture/domain/entities/user_entity.dart';

class UserApiService {

    final Dio _dio;
    UserApiService(this._dio);

    Future<UserEntity> fetchUserById(int idUser) async {
        try{

            final response = await _dio.get('/users/$idUser');
            final item = response.data;
            return UserEntity.fromJson(item);

        }on DioException catch (e)
        {
            print('Erreur lors de la récupération des users: ${e.message}');
            print('Statut: ${e.response?.statusCode}');
            print('Données: ${e.response?.data}');
            throw Exception('Impossible de charger les users: ${e.message}');
        }
    }

}
