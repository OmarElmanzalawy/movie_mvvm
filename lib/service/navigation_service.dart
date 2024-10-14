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


}