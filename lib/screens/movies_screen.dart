import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_constants.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/screens/favorite_screen.dart';
import 'package:movie_mvvm/service/api_service.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/service/navigation_service.dart';
import 'package:movie_mvvm/widgets/cached_image.dart';
import 'package:movie_mvvm/widgets/movies/movie_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MovieModel> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll(){
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isFetching){
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async{
    if(!_isFetching){
        _isFetching = true;
        try{
          final List<MovieModel> movies = await getIt<MoviesRepo>().fetchMovies(page: _currentPage);
          setState(() {
            _movies.addAll(movies);
            print(_movies);
            _currentPage++;
          });
        }
        catch (error){
          getIt<NavigationService>().showSnackbar(text: 'Error Fetching Movies');
          }
        finally{
          setState(() {
            _isFetching = false;
          });
        }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_isFetching);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
          actions: [
            IconButton(
              onPressed: () {
                getIt<NavigationService>().navigate(const FavoriteScreen());
              },
              icon: const Icon(AppIcons.favoriteRounded),
              color: Colors.red,
            ),
            IconButton(onPressed: () async{
              await getIt<MoviesRepo>().fetchMovies();
            },
             icon: const Icon(AppIcons.darkMode)),
          ],
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: _movies.length + (_isFetching ? 1:0),
          itemBuilder: (context,index){
            if(index < _movies.length){
            return Padding(padding: 
            const EdgeInsets.all(8.0),
            child: MovieCard(movieModel: _movies[index]),
            );
            }
            else{ return const CircularProgressIndicator.adaptive();}
          }
          )
        ),
    );
  }
}
