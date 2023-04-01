import 'package:favourite_with_them/Favourite/favourite_provider.dart';
import 'package:favourite_with_them/Favourite/favourite_screen.dart';
import 'package:favourite_with_them/Them/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create:(_)=>FavouriteItemProvider()),
      ChangeNotifierProvider(create:(_)=>ThemeChanger()),
    ],
    child: Builder(builder: (BuildContext context){
      final themeChanger=Provider.of<ThemeChanger>(context);
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeChanger.themeMode,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.teal,
          ),
          iconTheme: IconThemeData(
            color: Colors.pink,
          ),
        ),
        home: const Favourite_Screen(),
      );
    }),
    );
  }
}
