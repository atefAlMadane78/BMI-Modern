import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screen/re_enter_screen.dart';

class register extends StatefulWidget {
  static const routeName = 'regist_screen';
  register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

enum AuthMode { SignUp, Login }

class _registerState extends State<register>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  String name = "";
  bool where_regist = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
        getdata();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }



  @override
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'name': '',
    'email': '',
    'password': '',
  };

  final _passwordController = TextEditingController();

    getdata() async{
      SharedPreferences _pref = await SharedPreferences.getInstance();
      where_regist = _pref.getBool('where_regist')!;
      print(where_regist);
    }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  void _submit() {

    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    if (_authMode == AuthMode.Login) {
      final alert = AlertDialog(
        title: const Text(" wwww"),
        content: Container(
          height: 150,
          child: Column(
            children: [
              Divider(
                color: Colors.green[400],
              ),
              Text("Welcome Back Name ..."),
              const SizedBox(
                height: 50,
              ),
              RaisedButton(
                  child: const Text("Okay"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      );
      showDialog(
        context: context,
        builder: (ctx) {
          return alert;
        },
      );
    } else {
      
          if(where_regist){
      // this dialog show depend on parameter dertermin form where user regist
      final alert = AlertDialog(
        title: Text("title "),
        content: Container(
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
                      print("object");
                      Navigator.of(context).pushNamed(re_enter_screen.routeName);
                    },
                  ),
                  InkWell(
                    child: const Text("Okay"),
                    onTap: () {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 8,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: _authMode == AuthMode.SignUp ? 370 : 310,
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Name"),
                      onSaved: (val) {
                        _authData['name'] = val!;
                        print(_authData['name']);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "E-Mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty || !val.contains('@')) {
                          return "Invalid email!";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _authData['password'] = val!;
                        print(_authData['password']);
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Password"),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty || val.length <= 5) {
                          return "Password is too short!";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _authData['email'] = val!;
                        print(_authData['email']);
                      },
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      constraints: BoxConstraints(
                        minHeight: _authMode == AuthMode.SignUp ? 60 : 0,
                        maxHeight: _authMode == AuthMode.SignUp ? 120 : 0,
                      ),
                      child: FadeTransition(
                        opacity: _animation,
                        child: TextFormField(
                          enabled: _authMode == AuthMode.SignUp,
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: _authMode == AuthMode.SignUp
                              ? (value) {
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match!';
                                  }
                                  return null;
                                }
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RaisedButton(
                      child: Text(
                          _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                      onPressed: _submit,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8.0),
                      color: Theme.of(context).primaryColor,
                      textColor:
                          Theme.of(context).primaryTextTheme.button!.color,
                    ),
                    FlatButton(
                      child: Text(
                          '${_authMode == AuthMode.Login ? 'SIGN UP' : 'LOGIN'} INSTEAD'),
                      onPressed: _switchAuthMode,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    /* return Scaffold(
      backgroundColor: Colors.red[400],
      body: Center(
        child: Card(
          elevation: 3,
          child: Container(
            child: ListView(
              children:  [
                TextField(
                  decoration:const InputDecoration(
                    label: Text("name"),
                    hintText: "data", 
                  ),
                  onChanged: (val) =>setState(() {
                    name = val;
                  }),
                )
              ],
            ),
            height: 260.0,
            width: double.infinity,
            margin:const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );*/
  }
}
