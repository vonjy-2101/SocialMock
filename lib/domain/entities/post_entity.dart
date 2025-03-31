import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {

    late int id;
    late int userId;
    late String title;
    late String body;

    PostEntity({
        required this.id,
        required this.userId,
        required this.title,
        required this.body
    });

    PostEntity.fromJson(Map json)
    {
        id = json["id"];
        userId = json["userId"];
        title = json["title"];
        body = json["body"];
    }

    @override
    // TODO: implement props
    List<Object?> get props => [id,userId,title,body];
    
}