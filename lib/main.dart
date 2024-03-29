import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MaterialApp(
      home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Image.asset(
                    'images/remindernoborder.png', width: 80.0, height: 80.0
                ),

                new Text('Chikitsa', style: TextStyle(fontSize: 40)),

                new RaisedButton(
                  padding: const EdgeInsets.all(10.0),
                  textColor: Colors.black,
                  color: Colors.white,

                  child: new Text("Sign In"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),

                    );
                  },
                ),


                new Text('or Register as'),

                new Container (padding: const EdgeInsets.only(top:40)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Column(
                        children: [
                          new Image.asset(
                              'images/doctoricon.png', width: 50.0, height: 50.0
                          ),
                          new RaisedButton(
                            padding: const EdgeInsets.all(10.0),
                            textColor: Colors.white,
                            color: Colors.red,
                            child: new Text("Doctor"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorSignup()),
                              );
                            },
                          )
                        ]

                    ),

                    Column(
                        children: [
                          new Image.asset(
                              'images/patient.png', width: 50.0, height: 50.0
                          ),
                          new RaisedButton(
                            textColor: Colors.white,
                            color: Colors.red,
                            padding: const EdgeInsets.all(10.0),
                            child: new Text(
                              "Patient",
                            ),
//                            onPressed: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => Newuser()),
//                              );
//                            },

                          ),
                        ]
                    )
                  ],
                )
              ]
          ),
        ),

    );
  }
}

class Login extends StatefulWidget {
  final String title;
  Login({Key key, this.title}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Lato', fontSize: 20.0);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      controller: emailController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: passwordController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                  child: Image.asset(
                    "images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 100.0),
                emailField,
                SizedBox(
                  height: 10.0,
                ),
                passwordField,
                SizedBox(
                  height: 10.0,
                ),
                SeparateWidget(emailController, passwordController),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SeparateWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SeparateWidget(this.emailController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            String msg = "Please Enter";
            if (emailController.text == "") {
              msg = msg + " username";
            } else if (passwordController.text == "") {
              msg += " password";
            } else if (emailController.text == "admin" &&
                passwordController.text == "admin")
              msg = "Welcome User";
            else
              msg = "Invalid username/password";
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(msg),
              duration: Duration(seconds: 3),
            ));
          },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0)),
        ));
  }
}
class MyDoctorSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Doctor Registration',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new DoctorSignup(title: 'Doctor Registration'),
    );
  }
}


class DoctorSignup extends StatefulWidget {
  DoctorSignup({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DoctorSignupState createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: new AppBar(
//        title: new Text(widget.title),
//        ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your Mobile number',
                      labelText: 'Mobile',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter the password',
                      labelText: 'Password',
                    ),
//                    keyboardType: TextInputType.datetime,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your Speciality (Optional)',
                      labelText: 'Speciality (Optional)',
                    ),

                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Hospital (Optional)',
                    ),
                  ),

                  new Container(
                      padding: const EdgeInsets.only(left: 5.0, top: 50.0),
                      child: new RaisedButton(
                        child: const Text('Register'),
                        onPressed: null,
                      )),
                ],
              ))),
    );
  }
}
