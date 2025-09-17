import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/components/widgets/image_input.dart';
import 'package:great_places/components/widgets/location_input.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:provider/provider.dart';

class PlaceForm extends StatefulWidget {
  const PlaceForm({super.key});
  @override
  State<PlaceForm> createState() => _PlaceForm();
}

class _PlaceForm extends State<PlaceForm> {
  final TextEditingController _titleController = TextEditingController();
  File _pickedImage = File('');
  LatLng _pickedPosition = LatLng(0, 0);

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  bool _isValidForm() {
    return (_titleController.text.isNotEmpty &&
        _pickedImage.existsSync() &&
        _pickedPosition.latitude != 0.0 &&
        _pickedPosition.longitude != 0.0);
  }

  void _onSubmit() {
    if (!_isValidForm()) return;
    Provider.of<PlacesProvider>(
      context,
      listen: false,
    ).addPlace(_titleController.text, _pickedImage, _pickedPosition);
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
                    SizedBox(height: 20),
                    LocationInput(onSelectPosition: _selectPosition),
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
                backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                  states,
                ) {
                  if (states.contains(WidgetState.disabled)) {
                    return Colors.grey;
                  }
                  return Theme.of(context).colorScheme.secondary;
                }),
              ),
              icon: Icon(Icons.add),
              onPressed: _isValidForm() ? _onSubmit : null,
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
