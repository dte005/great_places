import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as spath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput({super.key, required this.onSelectImage});
  @override
  State<ImageInput> createState() => _ImageInput();
}

class _ImageInput extends State<ImageInput> {
  late File _storageImage = File('vazio');

  void _takePicture() async {
    final ImagePicker picker = ImagePicker();
    XFile imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600)
            as XFile;
    setState(() {
      _storageImage = File(imageFile.path);
    });
    final appDir = await spath
        .getApplicationDocumentsDirectory(); //Getting the directory
    String fileName = p.basename(_storageImage.path);
    final savedImage = await _storageImage.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storageImage.existsSync()
              ? Image.file(
                  _storageImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text("Nenhuma imagem"),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            label: Text("Tirar Foto"),
            icon: Icon(Icons.camera),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
