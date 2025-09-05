import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/components/image_input.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:provider/provider.dart';

class PlacesForm extends StatefulWidget {
  const PlacesForm({super.key});
  @override
  State<PlacesForm> createState() => _PlacesForm();
}

class _PlacesForm extends State<PlacesForm> {
  final TextEditingController _titleController = TextEditingController();
  File _pickedImage = File('');

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _onSubmit() {
    if (_titleController.text.isEmpty || !_pickedImage.existsSync()) return;
    Provider.of<PlacesProvider>(
      context,
      listen: false,
    ).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Places Form")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Título"),
                      controller: _titleController,
                    ),
                    SizedBox(height: 20),
                    ImageInput(onSelectImage: _selectImage),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              label: Text("Adicionar"),
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: WidgetStateProperty.all(0),
                backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              icon: Icon(Icons.add),
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * ElevatedButton.icon(
    onPressed: () {},
    label: Text("Adicionar"),
    style: ButtonStyle(
    shape: WidgetStateProperty.all(
    const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    elevation: WidgetStateProperty.all(0),
    backgroundColor: WidgetStateProperty.all(
    Theme.of(context).colorScheme.secondary,
    ),
    ),
    icon: Icon(Icons.add),
    ),
 */
