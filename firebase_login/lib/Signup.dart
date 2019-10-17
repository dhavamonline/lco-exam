import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';
import './Login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  bool _autovalidate = false;
  String name, _email, mobile, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(title: Text("Signup")),
        body: Form(
          key: _formkey,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "enter name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Name"),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "enter email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Email"),
                    onSaved: (input) => _email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.android),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "enter Mobile No.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Mobile"),
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.security),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "enter password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "enter password"),
                    onSaved: (input) => _password = input,
                  ),
                ),
                RaisedButton(
                  onPressed: signup,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlue,
                ),
                RaisedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                  child: Text(
                    "Already Have Acc CliCk Here",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlue,
                ),
              ],
            ),
          ),
        ));
  }

  void signup() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        FirebaseAuth auth = await FirebaseAuth.instance;
        FirebaseUser user;
        user = (await auth.createUserWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    user: user,
                  )),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
}
