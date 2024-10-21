import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/screens/movies_screen.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/service/navigation_service.dart';
import 'package:movie_mvvm/view_model/favorites_provider.dart';
import 'package:movie_mvvm/view_model/movies_provider.dart';
import 'package:movie_mvvm/widgets/movies/error_widget.dart';
import 'package:flutter/material.dart';

final initializationProvider = FutureProvider.autoDispose((ref) async {
  ref.keepAlive();
  await Future.microtask(() async {
    await ref.read(moviesProvider.notifier).getMovies();
    await ref.read(favoritesProvider.notifier).loadFavorites();
    //await Future.delayed(Duration(seconds: 3), (){});
  });
});

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //If you add these lines you will have infinite loop because future builder will keep rebuilding
    //final moviesStateProvider = ref.watch(moviesProvider);
    // print('Provider Genre length: ${ref.read(moviesProvider.notifier)}');
    final initWatch = ref.watch(initializationProvider);

    return Scaffold(
      body: initWatch.when(data: (data) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getIt<NavigationService>().navigateReplace(MoviesScreen());
        });

        return SizedBox.shrink();
      }, error: (error, _) {
        return MyErrorWidget(
          errorText: 'Error ${error.toString()}',
          onPressed: () {
            ref.refresh(initializationProvider);
          },
        );
      }, loading: () {
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }),
    );
  }
}
