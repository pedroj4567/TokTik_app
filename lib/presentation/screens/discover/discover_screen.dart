import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // para obtener la referencia al proveedor instanciado en la aplicacion al inicio se usa

    final discoverProvider = context.watch<DiscoverProvider>();
    final videosList = discoverProvider.videos;
    // final discoverProvider =
    //     Provider.of<DiscoverProvider>(context, listen: false);
    return Scaffold(
      body: discoverProvider.initialLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 4,
              ),
            )
          : VideoScrollableView(videos: videosList),
    );
  }
}
