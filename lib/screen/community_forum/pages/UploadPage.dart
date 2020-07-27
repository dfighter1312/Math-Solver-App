//import 'dart:js';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File file;
  captureImageWithCamera() async {
    Navigator.pop(context);
//    final pickedFile = await _picker.getImage(...);
//    final File file = File(pickedFile.path);
//    image: DecorationImage(image: FileImage(file),)
//    File imageFile = await ImagePicker().getImage(
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 680,
      maxWidth: 970,
    );
    setState(() {
      this.file = imageFile;
    });
  }

  pickImageFromGallery() async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.file = imageFile;
    });
  }

  takeImage(mContext){
    return showDialog(
      context: mContext,
      builder: (context){
        return SimpleDialog(
          title: Text("New post", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Capture image with camera", style: TextStyle(color: Colors.white),),
              onPressed: captureImageWithCamera,
            ),
            SimpleDialogOption(
              child: Text("Capture image with Gallery", style: TextStyle(color: Colors.white),),
              onPressed: pickImageFromGallery,
            ),
            SimpleDialogOption(
              child: Text("Cancel", style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );
  }

  displayUploadScreen(){
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.add_photo_alternate, color: Colors.grey, size: 200.0,),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
              child: Text("Upload image", style: TextStyle(color: Colors.white, fontSize: 20.0),),
              color: Colors.green,
              onPressed: ()=> takeImage(context),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return displayUploadScreen();
  }
}