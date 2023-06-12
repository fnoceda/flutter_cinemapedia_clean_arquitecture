import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SafeArea(
        child: Scaffold(
          body: HomeView(),
          bottomNavigationBar: CustomBottomNavigationBar(),
        ),
      ),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  // const CustomAppbar(),
                  MoviesSlideshow(movies: slideShowMovies),
                  MovieHorizontalListView(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: () {
                      // print('llamado del padre');
                      ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .loadNextPage();
                    },
                  ),

                  MovieHorizontalListView(
                    movies: popularMovies,
                    title: 'Populares',
                    loadNextPage: () {
                      // print('llamado del padre');
                      ref.read(popularMoviesProvider.notifier).loadNextPage();
                    },
                  ),

                  MovieHorizontalListView(
                    movies: upComingMovies,
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () {
                      // print('llamado del padre');
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    },
                  ),

                  MovieHorizontalListView(
                    movies: topRatedMovies,
                    title: 'Mejor Calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage: () {
                      // print('llamado del padre');
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                    },
                  ),

                  const SizedBox(height: 50),

                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: nowPlayingMovies.length,
                  //     itemBuilder: (context, index) {
                  //       final movie = nowPlayingMovies[index];
                  //       return ListTile(
                  //         title: Text(movie.title),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
