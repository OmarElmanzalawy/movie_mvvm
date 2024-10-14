import 'package:flutter/material.dart';

class NavigationService{

  late GlobalKey<NavigatorState> navigationKey;

  NavigationService(){
    navigationKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget){
    return navigationKey.currentState?.push(MaterialPageRoute(builder: (context)=> widget ));
  }

  navigateReplace(Widget widget){
  return navigationKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context)=> widget ));
  }

  Future<void> showDialog(Widget widget)async {

    await showAdaptiveDialog(
      barrierDismissible: true,
      context: navigationKey.currentContext!,
      builder: (context) => widget
    );
  }

  void showSnackbar({SnackBar? customSnackBar, String? text}){

    
    final context = navigationKey.currentContext!;
    //Checks if there is already a snackbar shown and closes it
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    final SnackBar snackbar = SnackBar(content: Text(text ?? 'Movies App SnackBar',style: TextStyle(color: Colors.white),));
    ScaffoldMessenger.of(context).showSnackBar(customSnackBar ?? snackbar);

  }


}