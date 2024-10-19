import 'package:flutter/material.dart';
import 'package:movie_mvvm/widgets/movies/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body:true ?
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
      : MyErrorWidget(errorText: 'Error Text',onPressed: (){},),
    );
  }
}