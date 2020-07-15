import 'package:betheheromobile/src/pages/incidents/incidents_page.dart';
import 'package:betheheromobile/src/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: backgroundColor,
      bubbleBackgroundColor: redColor,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Bem vindo ao Be The Hero',
            style: TextStyle(
              color: redColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Um jeito fácil de ajudar alguém',
            style: TextStyle(color: redColor, fontSize: 20.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/logo.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: backgroundColor,
      bubbleBackgroundColor: redColor,
      iconColor: null,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Diversos casos',
            style: TextStyle(
              color: redColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Todos precisam de ajuda faça sua parte nessa causa',
            style: TextStyle(color: redColor, fontSize: 20),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/logo.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: backgroundColor,
      bubbleBackgroundColor: redColor,
      iconColor: null,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Tudo no seu celular',
            style: TextStyle(
              color: redColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Escolha um caso e seja um herói',
            style: TextStyle(color: redColor, fontSize: 20),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/logo.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SeenFirtPage()));
              },
              showSkipButton: false,
              doneText: Text(
                "Começar",
              ),
              pageButtonsColor: redColor,
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,

                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeenFirtPage extends StatefulWidget {
  @override
  _SeenFirtPageState createState() => _SeenFirtPageState();
}

class _SeenFirtPageState extends State<SeenFirtPage> {
  Future _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => IncidentsPage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => OnBoardScreen()));
    }
  }

  @override
  void initState() {
    _checkFirstSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: redColor);
  }
}
