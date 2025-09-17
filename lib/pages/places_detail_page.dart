import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Detail"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("Deletar");
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Container(color: Colors.grey),
          ), //Mapa
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Title place",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Card(child: Column(children: <Widget>[]))],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
