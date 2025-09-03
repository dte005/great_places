import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});
  @override
  Widget build(BuildContext context) {
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
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Its gona be here!")],
            ),
          ],
        ),
      ),
    );
  }
}
