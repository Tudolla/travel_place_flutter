import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _imageFile;
  void _takePicture() async{
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: double.infinity);
    if(pickImage == null){
      return;
    }

    setState((){
    _imageFile = File(pickImage.path);


    });

    

  }
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        label: Text("Choose Image"),
        icon: Icon(Icons.camera_alt_outlined),
        onPressed: _takePicture,
        
        );
        if(_imageFile != null){
          content = GestureDetector(
            onDoubleTap: _takePicture,
            
            child: Image.file(_imageFile!, fit: BoxFit.cover,));
        }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        ),
      ),
      height: 250,
      width: double.infinity,

      child: content,
    );
  }
}