import 'package:flutter/material.dart';
import 'package:great_places/providers/auth_provider.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/routes.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Great places',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.placesForm);
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              authProvider.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer<PlacesProvider>(
        child: Center(child: Text("Nenhum local cadastrado!")),
        builder: (ctx, places, ch) => places.itemsCount == 0
            ? ch!
            : ListView.builder(
                itemCount: places.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.itemByIndex(i).image),
                  ),
                  title: Text(places.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
