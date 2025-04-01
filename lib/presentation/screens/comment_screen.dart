import 'package:flutter/material.dart';
import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';

class CommentScreen extends StatefulWidget{
    PostEntity post;
    CommentScreen({required this.post});
    CommentScreenState createState() => CommentScreenState();
}

class CommentScreenState extends State<CommentScreen>
{

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text("Post Details")),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            SizedBox(height: 8),
                            // Titre du post
                            Text(widget.post.title,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            // Contenu du post
                            Text(widget.post.body, style: TextStyle(fontSize: 16)),
                            SizedBox(height: 20),
                            // Auteur du post
                            SizedBox(width: MediaQuery.sizeOf(context).width,child: Text("Auteur by ${widget.post.userPost?.name}",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,),textAlign: TextAlign.end,),),
                            SizedBox(height: 16),
                            Divider(),
                            // Nombre total de commentaires
                            Text("Commentaires (${widget.post.comments.length})",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            // Affichage des commentaires
                            ...widget.post.comments.map((comment) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                    leading: CircleAvatar(child: Icon(Icons.person)),
                                    title: Text(comment.email!,
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                    subtitle: Text(comment.body!),
                                ),
                                )),
                            Divider(),
                            SizedBox(height: 5),
                            // Button comment
                            Center(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Commenter"),
                                ),
                            ),
                            SizedBox(height: 80),
                        ],
                    ),
                ),
            ),
        );
    }

}