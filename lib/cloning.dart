import 'package:flutter/material.dart';

class CloningAnimation extends StatefulWidget{
  @override
  _CloningAnimationState createState() => _CloningAnimationState();
}

class _CloningAnimationState extends State<CloningAnimation> with TickerProviderStateMixin{

  Animation _animation;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: -1.0).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: _animationController
      ),
    )..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  Widget buildContainer(){
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloning Animation"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget child){
                return Transform(
                  transform: Matrix4.translationValues(_animation.value * 30, 0.0, 0.0),
                  child: buildContainer(),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget child){
                return Transform(
                  transform: Matrix4.translationValues(_animation.value * -30, 0.0, 0.0),
                  child: buildContainer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}