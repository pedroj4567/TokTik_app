import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // en el main usamos la implementacion del repositorio

  final videoPostRepository = VideoPostsRepositoryImpl(
    videosDataSources: LocalVideoDatasource(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // por defector los providers se entregan como lazy loagin o carga perezosa
        ChangeNotifierProvider(
          // lazy: true, -> carga en la primera instancia de una vez.
          create: (_) =>
              DiscoverProvider(videoPostRepository: videoPostRepository)
                ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'TokTik App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: Scaffold(
          body: DiscoverScreen(),
        ),
      ),
    );
  }
}
