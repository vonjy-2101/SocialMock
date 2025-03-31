import 'package:flutter/material.dart';
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
                    child: SingleChildScrollView(
                        child: Column(
                            children: [
                                postProvider.isLoading
                                ? Center(child: CircularProgressIndicator())
                                : Container(
                                    height: 45,
                                    child: Text(postProvider.posts.length.toString()),
                                )
                            ],
                        ),
                    ),
                )
            ),
        );
    }

}