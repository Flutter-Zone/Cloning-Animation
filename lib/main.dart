import 'package:flutter/material.dart';
import 'cloning.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: SafeArea(
        child: HomeScreen(),
      )
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Animation"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CloningAnimation()));
          },
          color: Theme.of(context).primaryColor,
          child: Text("Cloning Animation",style: TextStyle(color: Colors.white),),
        ),
      )
    );
  }
}

