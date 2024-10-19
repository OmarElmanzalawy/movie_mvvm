import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_mvvm/constants/app_theme_data.dart';
import 'package:movie_mvvm/enums/theme_enums.dart';
import 'package:movie_mvvm/screens/favorite_screen.dart';
import 'package:movie_mvvm/screens/movie_details_screen.dart';
import 'package:movie_mvvm/screens/movies_screen.dart';
import 'package:movie_mvvm/screens/splash_screen.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/service/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/view_model/theme_provider.dart';

void main() async{
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp
    ]).then((_) async{
      await dotenv.load(fileName: 'assets/.env');
      runApp(const ProviderScope(child: MainApp()));
    });
  
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ThemeEnums themeMode = ref.watch(themeProvider);
    return  MaterialApp(
      navigatorKey: getIt<NavigationService>().navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: themeMode == ThemeEnums.dark ? AppThemeData.darkTheme : AppThemeData.lightTheme,
      home: const MoviesScreen(),
    );
  }
}
