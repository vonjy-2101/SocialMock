import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable{

    late int id;
    late int postId;
    late String name;
    late String email;
    late String body;
    
    CommentEntity({
        required this.id,
        required this.postId,
        required this.name,
        required this.email,
        required this.body,
    });

    CommentEntity.fromJson(Map json)
    {
        id = json["id"];
        postId = json["postId"];
        name = json["name"];
        email = json["email"];
        body = json["body"];
    }

    
    @override
    // TODO: implement props
    List<Object?> get props => [id,postId,name,email,body];

}