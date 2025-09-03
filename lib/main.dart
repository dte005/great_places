import 'package:flutter/material.dart';
import 'package:great_places/pages/auth_pages/check_auth_page.dart';
import 'package:great_places/providers/auth_provider.dart';
import 'package:great_places/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontFamily: 'Optima'),
          ),
          fontFamily: 'Arial',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            elevation: 4,
          ),
          colorScheme: ColorScheme.fromSeed(
            primary: Colors.indigo,
            seedColor: Colors.amber,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {Routes.checkAuth: (ctx) => CheckAuth()},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
