import 'package:flutter/material.dart';
import '../../models/user.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _username, _password;
  LoginPagePresenter _presenter;

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _LoginPageState() {
    _presenter = LoginPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var loginBtn = RaisedButton(
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
      onPressed: _submit,
    );

    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Doesn\'t Have Account? '),
            RawMaterialButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: Text(
                'Register Here!',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .25),
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            onSaved: (val) => _username = val,
                            decoration: InputDecoration(labelText: "Username"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            obscureText: _obscureText,
                            onSaved: (val) => _password = val,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                onPressed: _toggle,
                                icon: Icon(
                                  _obscureText
                                      ? Icons.lock_outline
                                      : Icons.lock_open,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10.0), child: loginBtn),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _showSnackBar("Login not successful");
    setState(() {});
  }

  @override
  void onLoginSuccess(User user) async {
    if (user.username == "") {
      _showSnackBar("Login not successful");
    } else {
      _showSnackBar(user.toString());
    }
    setState(() {});
    if (user.flaglogged == "logged") {
      print("Logged");
      Navigator.of(context).pushReplacementNamed("/home");
    } else {
      print("Not Logged");
    }
  }
}
