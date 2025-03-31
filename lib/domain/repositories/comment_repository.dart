import 'package:flutter_api_clean_architecture/domain/entities/comment_entity.dart';

abstract class CommentRepository{

    ///Cette méthode permet de récuperer les commentaires de chaque poste récuperer
    Future<List<CommentEntity>> getCommentByPost(int idPost);

}