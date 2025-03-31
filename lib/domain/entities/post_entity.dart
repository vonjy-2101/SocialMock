import 'package:equatable/equatable.dart';
import 'package:flutter_api_clean_architecture/domain/entities/comment_entity.dart';
import 'package:flutter_api_clean_architecture/domain/entities/user_entity.dart';

class PostEntity extends Equatable {

    late int id;
    late int userId;
    late String title;
    late String body;
    late UserEntity? userPost = UserEntity(email: "",name: "",id: 0,username: "");
    late List<CommentEntity> comments = [];

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

    setUserPost(UserEntity user)
    {userPost = user;}

    setComments(List<CommentEntity> commentsData)
    {comments = commentsData;}

    @override
    // TODO: implement props
    List<Object?> get props => [id,userId,title,body];
    
}