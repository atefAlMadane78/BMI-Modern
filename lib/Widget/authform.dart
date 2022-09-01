import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x2/Screen/re2.dart';
import 'package:x2/Widget/image_picker.dart';
import '../contant.dart';
import '../Screen/re_enter_screen.dart';

class authform extends StatefulWidget {
  final void Function(String email, String password, String uesrname,
      File image, bool isLogin, BuildContext ctx) submitFn;
  final bool _isLoading;
  authform(this.submitFn, this._isLoading);

  @override
  State<authform> createState() => _authformState();
}

class _authformState extends State<authform> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = false; //
  bool _rember = false;
  bool _rember1 = false;
  late String _userId;
  late SharedPreferences _pref;
  late String thereuser = "";
  String _email = "";
  String _password = "";
  String _username = "";
  late File _userimagefile =
      File(""); // problem is should put initial value here

final _auth = FirebaseAuth.instance;

  void _pickdimage(File pickedImage) {
    _userimagefile = pickedImage;
  }

  void submit() async {
    if(!_isLogin){
       _pref = await SharedPreferences.getInstance();
      /* if( _pref.getBool('remember_me') == true && _rember1 == false){
         
       }*/
    _pref.setBool('remember_me', _rember1);
    }
   

    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (!_userimagefile.isAbsolute && !_isLogin) {
      Scaffold.of(context).showSnackBar( const SnackBar(
        content:  Text("Please Pick an image" ),
        backgroundColor:  Color.fromARGB(255, 194, 86, 204),
      ));
      return;
    }

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_email.trim(), _password.trim(), _username.trim(),
          _userimagefile, _isLogin, context);
    }
  }

  void call() async {
    _pref = await SharedPreferences.getInstance();

    bool where_regist = _pref.getBool('where_regist') ?? false;
        print(where_regist);
        print("222222222222");

    _rember = _pref.getBool('remember_me') ?? false;
    _userId = _pref.getString("userID") ?? "";
    print(_pref.getBool('remember_me'));
    print(_pref.getString("userID"));
    print(_isLogin);
    
    if(where_regist){
      _pref.setBool('where_regist', false);
       final alert = AlertDialog(
            title:const Text("BMI Modern Warning "),
            content: Container(
              //color: Colors.black26,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Text(
                      "Will take the info you entered \n if you want change it press on Re_Enter ..."),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Text("RE_Enter"),
                        onTap: () {
                        //  wg = true;
                          print("object");
                          Navigator.of(context)
                              .pushNamed(re2.routeName);
                        },
                      ),
                      InkWell(
                        child: const Text("Okay"),
                        onTap: () {
                       //   wg = true;
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
          showDialog(
              context: context,
              builder: (_) {
                return alert;
              });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    call();
    //  _rember = _pref.getBool('remember_me')!;
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        elevation: 8,
        child: Container(
          decoration: const BoxDecoration(
            gradient: grad_color,
          ),
          child: SingleChildScrollView(
            padding:const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin) image_picker(_pickdimage ,2),
                  TextFormField(
                    autocorrect: false,
                    enableSuggestions: false,
                    textCapitalization: TextCapitalization.none,
                    key:const ValueKey('email'),
                    validator: (val) {
                      if (val!.isEmpty || !val.contains('@gmail.com')) {
                        return "Please enter a vaild email";
                      }
                      return null;
                    },
                    onSaved: (val) => _email = val!,
                    keyboardType: TextInputType.emailAddress,
                    decoration:const InputDecoration(labelText: "Email Addres"),
                  ),
                  if (!_isLogin)
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
                      onSaved: (val) => _username = val!,
                      decoration:const InputDecoration(labelText: "Username"),
                    ),
                  TextFormField(
                    key:const ValueKey('password'),
                    validator: (val) {
                      if (val!.isEmpty || val.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    onSaved: (val) => _password = val!,
                    decoration:const InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget._isLoading)const CircularProgressIndicator(),
                  if (!widget._isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? 'Login' : 'Sign up'),
                      onPressed: submit,
                    ),
                  if (!widget._isLoading)
                    FlatButton(
                      child: Text(_isLogin
                          ? 'Create new account '
                          : 'I already have an account'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    ),
                  if (!_isLogin)
                    CheckboxListTile(
                      title:const Text("Remember Me "),
                      value: _rember1,
                      onChanged: (val) async {
                        setState(() {
                          _rember1 = val!;
                        });

                        print(_pref.getBool('remember_me'));
                        print(_pref.getString("userID"));
                      },
                    ),
                  if (_isLogin && _rember && _pref.getString("userID") != null)
                   // CircleAvatar(),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
                      builder: (ctx, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        final docs = snapshot.data!.docs;
                        final user = FirebaseAuth.instance.currentUser;
                        final res = docs.where(
                          (element) {
                            return element['userID'] == _userId;
                          },
                        ).toList();
                        return InkWell(
                          child:CircleAvatar(backgroundImage: _userId.isEmpty ?null :NetworkImage(res[0]['image_url']),),
                          onTap: ()async{
                           await _auth.signInWithEmailAndPassword(
                        email: res[0]['email'], password:res[0]['password'] );
                        Navigator.of(context).pop();
                          },
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
