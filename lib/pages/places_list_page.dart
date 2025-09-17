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
              Navigator.of(context).pushNamed(Routes.placeForm);
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
                itemBuilder: (ctx, i) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(places.itemByIndex(i).image),
                      ),
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          if (value == "delete") {
                            print("clicou em deletar");
                          } else if (value == "detail") {
                            Navigator.of(context).pushNamed(Routes.placeDetail);
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem(
                            value: "delete",
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text("Delete"),
                                Icon(Icons.delete, color: Colors.redAccent),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: "detail",
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text("Detail"),
                                Icon(
                                  Icons.library_books_sharp,
                                  color: Colors.indigo,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      title: Text(places.itemByIndex(i).title),
                    ),
                    const Divider(height: 0),
                  ],
                ),
              ),
      ),
    );
  }
}
