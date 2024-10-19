import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/enums/theme_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeProvider,ThemeEnums>((ref) => ThemeProvider(),);

class ThemeProvider extends StateNotifier<ThemeEnums>{

  final prefsKey = 'isDarkMode';
  ThemeProvider():super(ThemeEnums.light){
    loadTheme();
  }

  Future<void> loadTheme()async{
    final prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = await prefs.getBool(prefsKey) ?? false;
    state = isDarkMode ? ThemeEnums.dark : ThemeEnums.light;
  }

  Future<void> toggleTheme()async{
    final prefs = await SharedPreferences.getInstance();
    if(state ==ThemeEnums.light){
      state = ThemeEnums.dark;
      await prefs.setBool(prefsKey, true);
    }
    else{
      state = ThemeEnums.light;
      await prefs.setBool(prefsKey, false);
      }
  }
  ThemeEnums readState(){ return state;}
}