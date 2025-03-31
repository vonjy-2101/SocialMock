import 'package:flutter_api_clean_architecture/domain/entities/user_entity.dart';

abstract class UserRepository {

    ///Get user by id
    ///Necessaire pour la récuperation de l'auteur d'un poste 
    Future<UserEntity> getUserById(int idUser);

}