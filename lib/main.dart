import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
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
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: new Text("Sign In"),
                ),

                new Text('or Register as'),
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
                            color: Colors.blue,
                            child: new Text("Doctor"),
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

                          ),
                        ]
                    )
                  ],
                )
              ]
          ),
        ),
      ),

    );
  }
}
