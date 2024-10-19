import 'package:flutter/material.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/screens/movies_screen.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/service/navigation_service.dart';
import 'package:movie_mvvm/widgets/movies/error_widget.dart';
import 'package:movie_mvvm/widgets/movies/movie_card.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  final _movieRepo = getIt<MoviesRepo>();

  

  Future<void>_loadData()async{
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try{
      await _movieRepo.fetchGenres();
      await getIt<NavigationService>().navigateReplace(const MoviesScreen());
    }
    catch (e){
      setState(() {
        _errorMessage = e.toString();
      });
    }
    finally{
      setState(() {
        _isLoading = false;
      });
    }

  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_isLoading ?   
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading',style: TextStyle(fontSize: 25),),
            SizedBox(height: 20,),
            CircularProgressIndicator.adaptive()
          ],
        ),
      )
      : MyErrorWidget(errorText: 'Error Text',onPressed: (){_loadData;},),
    );
  }
}