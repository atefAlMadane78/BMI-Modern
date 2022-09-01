import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../Widget/image_picker.dart';
import '../contant.dart';

class change_screen extends StatefulWidget {
  static const routeName = 'change_screen';
  const change_screen({Key? key}) : super(key: key);

  @override
  State<change_screen> createState() => _change_screenState();
}

class _change_screenState extends State<change_screen> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";

  late File _userimagefile =
      File(""); // problem is should put initial value here

  void _pickdimage(File pickedImage) {
    _userimagefile = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          
          //color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 75,
                ),
                Center(
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    elevation: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: grad_color,
                      ),
                      margin:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                          padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            image_picker(_pickdimage , 1),
                            TextFormField(
                              autocorrect: true,
                              enableSuggestions: false,
                              textCapitalization: TextCapitalization.words,
                              key:const ValueKey('username'),
                              validator: (val) {
                                if (val!.isEmpty || val.length < 4) {
                                  return "Please enter at least 4 character";
                                }
                                return null;
                              },
                              onSaved: (val) => _name = val!,
                              decoration:
                                  const InputDecoration(labelText: "New Username"),
                            ),
                          const  SizedBox(height: 25,),
                          RaisedButton(
                              child: const Text("Save Change"),
                              onPressed: () async {
                                final user = FirebaseAuth.instance.currentUser;
                                final ref = FirebaseStorage.instance
                                    .ref()
                                    .child("user_image")
                                    .child(user!.uid + '.jpg');
                                await ref.putFile(_userimagefile);
                                final url = await ref.getDownloadURL();
          
                                final isValid = _formKey.currentState!.validate();
                                if (isValid) {
                                  _formKey.currentState!.save();
          
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(user.uid)
                                      .update({
                                    'username': _name,
                                  });
                                }
          
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user.uid)
                                    .update({
                                  'image_url': url,
                                }).whenComplete(() {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
               // SizedBox(height: 500,)
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}
