import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

    Widget build(BuildContext context) {
        return new Container(
            constraints: new BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            decoration: new BoxDecoration(
                border: new Border.all(width: 2.0, color: Colors.red),
                color: Colors.grey,
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                image: new DecorationImage(
                  image: new NetworkImage("http://i0.hdslb.com/bfs/article/d1817699d2fdf65d70bd537b77bd0b9485559cc7.jpg"),
                  ),
            ),
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: new Text('Hello world', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
            transform: new Matrix4.rotationZ(0.3),
        );
    }

}