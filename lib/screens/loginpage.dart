import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanship_ui/screens/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username, _password = "";
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      child: Image.asset(
                        "assets/images/Logo_and_Text.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "E.g. Admin",
                        ),
                        onChanged: (String username) {
                          setState(() {
                            _username = username;
                          });
                        },
                      ),
                      SizedBox(height: 24.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "E.g. admin123",
                          suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(
                              _obscureText
                                  ? Icons.lock_outline
                                  : Icons.lock_open,
                            ),
                          ),
                        ),
                        onChanged: (String password) {
                          setState(() {
                            _password = password;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.0),
                Builder(
                  builder: (context) => RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Color(0xFFF6F6F6),
                      ),
                    ),
                    color: Color(0xFF205DC3),
                    onPressed: () {
                      setState(() {
                        if (_username == "Admin" && _password == "admin123") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Maaf, Username Atau Password Anda Salah",
                              ),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
