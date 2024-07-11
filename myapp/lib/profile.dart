import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);
  if (pickedFile != null) {
    // Handle the picked image
  }
}

@override
Widget build(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Profile'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Select from Gallery'),
          onTap: () => pickImage(ImageSource.gallery),
        ),
        ListTile(
          title: Text('Take a Picture'),
          onTap: () => pickImage(ImageSource.camera),
        ),
      ],
    ),
  );
}
