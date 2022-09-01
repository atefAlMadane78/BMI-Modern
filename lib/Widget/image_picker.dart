import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class image_picker extends StatefulWidget {

  final void Function(File pickedImage) imagePickFn;
  final int n;


   image_picker( this.imagePickFn, this.n) ;

  @override
  State<image_picker> createState() => _image_pickerState();
}

class _image_pickerState extends State<image_picker> {




  late File _pickedImage = File(""); // should put initial value here 
  final ImagePicker _picker = ImagePicker();

  Future _pickeimage(ImageSource src) async {
    final pickedimageFile = await _picker.pickImage(source: src , imageQuality: 50,maxWidth: 150,) ;

    if (pickedimageFile != null) {
      setState(() {
        _pickedImage = File(pickedimageFile.path);
      });
      widget.imagePickFn(_pickedImage);
    } else {
      print("NO image Selected ");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage.isAbsolute ? FileImage(_pickedImage) : null,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: () => _pickeimage(ImageSource.camera),
              icon: const Icon(Icons.camera_outlined),
              label:widget.n == 2 ? const Text(
                "Add Image \n from camera ",
                textAlign: TextAlign.center,
              ) :const Text(
                "Add New Image \n from camera ",
                textAlign: TextAlign.center,
              ) 
              ,
            ),
            TextButton.icon(
              onPressed: () => _pickeimage(ImageSource.gallery),
              icon: const Icon(Icons.image_outlined),
              label:widget.n == 2 ? const Text(
                "Add Image \n from gallery ",
                textAlign: TextAlign.center,
              ) : const Text(
                "Add New Image \n from gallery ",
                textAlign: TextAlign.center,
              ) 
              ,
            ),
          ],
        )
      ],
    );
  }
}
