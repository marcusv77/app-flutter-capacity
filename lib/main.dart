import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  runApp(MaterialApp(
      title: "Contador de Pessoas",
      debugShowCheckedModeBanner: false,
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Há vagas";

  void _changepeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Ops";
        _people = 0;
      } else if (_people > 19) {
        _infoText = "Lotado";
        _people = 20;
      } else
        _infoText = "Há vagas";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Controle de fluxo",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Image.asset(
              "images/food.jpg",
              fit: BoxFit.cover,
              height: 1000.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Clientes: $_people",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    _infoText,
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 30.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 400, 0, 0),
                      child: FlatButton(
                        child: Text(
                          "+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _changepeople(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 400, 30, 0),
                      child: FlatButton(
                        child: Text(
                          "-1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _changepeople(-1);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
