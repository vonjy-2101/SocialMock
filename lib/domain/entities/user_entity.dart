import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{

    late int id;
    late String name;
    late String username;
    late String email;

    UserEntity({
        required this.id,
        required this.name,
        required this.username,
        required this.email
    });

    UserEntity.fromJson(Map json)
    {
        id = json["id"];
        name = json["name"];
        username = json["username"];
        email = json["email"];
    }
    
    @override
    // TODO: implement props
    List<Object?> get props => [id,name,username,email];
    

}