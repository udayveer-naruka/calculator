import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operationperform;
  void btnclicked(String btntext){
    if(btntext == 'C'){
      texttodisplay = "";
      firnum = 0;
      secondnum = 0;
      res = "";
    }else if(btntext == "+" || btntext == "-" || btntext == "X" ||btntext == "/"){
      firnum = int.parse(texttodisplay);
      res ="";
      operationperform = btntext;
    }else if(btntext=="="){
      secondnum=int.parse(texttodisplay);
      if(operationperform=="+"){
        res = (firnum+secondnum).toString();
      }
      if(operationperform=="-"){
        res = (firnum-secondnum).toString();
      }
      if(operationperform=="X"){
        res = (firnum*secondnum).toString();
      }
      if(operationperform=="/"){
        res = (firnum/secondnum).toString();
      }
    }else{
      res =int.parse(texttodisplay+btntext).toString();
    }
    setState(() {
      texttodisplay = res;
    });

  }
  Widget customButton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () =>btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
              fontSize: 25.0
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  '$texttodisplay',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("X"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
