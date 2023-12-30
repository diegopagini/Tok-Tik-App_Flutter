import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/infraestructure/datasources/local_video_posts_datasource_impl.dart';
import 'package:tok_tik/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostRepositoryImpl(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        // [..] cascade operator.
        ChangeNotifierProvider(
            lazy: false, // To forze the first load when this code is executed.
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const DiscoverScreen(),
        theme: AppTheme().getTheme(),
        title: 'Tok Tik',
      ),
    );
  }
}
