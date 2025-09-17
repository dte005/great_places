import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_places/data/db/daos/location_dao.dart';
import 'package:great_places/data/db/daos/place_dao.dart';
import 'package:great_places/data/db/database.dart';
import 'package:great_places/providers/auth_provider.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppDb(), dispose: (_, db) => db.close()),
        ProxyProvider<AppDb, PlaceDao>(update: (_, db, __) => PlaceDao(db)),
        ProxyProvider<AppDb, LocationDao>(
          update: (_, db, __) => LocationDao(db),
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProxyProvider2<PlaceDao, LocationDao, PlacesProvider>(
          create: (ctx) => PlacesProvider(
            placesDao: ctx.read<PlaceDao>(),
            locationDao: ctx.read<LocationDao>(),
          ),
          update: (ctx, pDao, lDao, provider) {
            if (provider == null) {
              return PlacesProvider(placesDao: pDao, locationDao: lDao);
            }
            provider.rebind(pDao, lDao);
            return provider;
          },
        ),
      ],
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
            secondary: Colors.amber,
            seedColor: Colors.amber,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
