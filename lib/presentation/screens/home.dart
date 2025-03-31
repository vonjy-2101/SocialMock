import 'package:flutter/material.dart';
import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';
import 'package:flutter_api_clean_architecture/presentation/providers/post_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget
{
    HomeState createState() => HomeState();
}

class HomeState extends State<Home>
{

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<PostProvider>().fetchAllPosts();
        });
    }

    @override
    Widget build(BuildContext context) {
        final postProvider = context.watch<PostProvider>();

        return Scaffold(
            body: SafeArea(
                child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child : postProvider.isLoading
                        ? Center(child: CircularProgressIndicator(color: Colors.black12,),)
                        : PostList(posts: postProvider.posts),
                )
            ),
        );
    }

}

class PostList extends StatelessWidget
{
    final List<PostEntity> posts;
    PostList({super.key, required this.posts});
    
    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            scrollDirection : Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (context, index){
                final post = posts[index];
                return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    "Static User",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                    post.title,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(post.body),
                                SizedBox(height: 10),
                                Text(
                                    '${post.comments.length} commentaire(s)',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                    ),
                                ),
                            ],
                        ),
                    ),
                );
            },
        );
    }

    
}