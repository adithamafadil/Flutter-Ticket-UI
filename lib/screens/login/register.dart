import 'package:flutter/material.dart';
import '../../data/database-helper.dart';
import '../../models/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _name, _username, _password;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: InputDecoration(labelText: "Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: InputDecoration(labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: _toggle,
                      icon: Icon(
                        _obscureText ? Icons.lock_outline : Icons.lock_open,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Builder(
          builder: (context) => RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              "Register",
              style: TextStyle(
                color: Color(0xFFF6F6F6),
              ),
            ),
            color: Color(0xFF205DC3),
            onPressed: _submit,
          ),
        ),
      ],
    );

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Have Account? '),
            RawMaterialButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
              child: Text(
                'Log In Here!',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
      key: scaffoldKey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
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
              loginForm,
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        form.save();
        var user = User(_name, _username, _password, null);
        var db = DatabaseHelper();
        db.saveUser(user);
        Navigator.of(context).pushNamed("/login");
      });
    }
  }
}
