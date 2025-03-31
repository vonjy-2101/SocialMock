import 'package:flutter_api_clean_architecture/data/datasources/user_api_service.dart';
import 'package:flutter_api_clean_architecture/domain/entities/user_entity.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
    
    UserApiService _userApiService;
    UserRepositoryImpl(this._userApiService);

    @override
    Future<UserEntity> getUserById(int idUser) async{
        return await _userApiService.fetchUserById(idUser);
    }

}