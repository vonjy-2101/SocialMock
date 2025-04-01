import 'package:flutter/material.dart';
import 'package:flutter_api_clean_architecture/core/di/app_modules.dart';
import 'package:flutter_api_clean_architecture/presentation/providers/post_provider.dart';
import 'package:flutter_api_clean_architecture/presentation/screens/post_screen.dart';
import 'package:provider/provider.dart';

void main() {

    AppModules.setup();
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => PostProvider(
                    AppModules.postRepository,
                    AppModules.commentRepositoryImpl,
                    AppModules.userRepositoryImpl),
                ),
            ],
            child: MyApp(),
        ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SocialMock',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: PostScreen(),
    );
  }
}
