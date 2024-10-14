import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';

class MyErrorWidget extends StatelessWidget {
  final String? errorText;
  final VoidCallback? onPressed;

  const MyErrorWidget({super.key, this.errorText,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(AppIcons.error,size: 50,color: Colors.red,),
          SizedBox(height: 20,),
          Text('Error: ${errorText ?? 'Unkown'}',
          style: const TextStyle(color: Colors.red,fontSize: 16),
          
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: onPressed ?? (){}, child: Text('Retry',style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}