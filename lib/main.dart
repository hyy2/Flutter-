import 'package:flutter/material.dart';
import './widget/Align.dart';

void main() => runApp(new MyApp());

const List<String> singleLayoutWidgets = [
    "Container",
    "Padding",
    "Center",
    "Align",
    "FittedBox",
    "AspectBox",
    "ConstrainedBox",
    "Baseline",
    "FractionallySizedBox",
    "IntrinsicWidth",
    "LimitedBox",
    "Offstage",
    "OverflowBox",
    "SizeBox",
    "SizedOverflowBox",
    "Transform",
    "CustomSingleChildLayout",
];

const List<String> multiLayoutWidgets = [
];


class MyApp extends StatelessWidget {

    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Flutter Layout demo',
            theme: new ThemeData(
                primaryColor: Colors.blue,
            ),
            home: new MyHomePage(title: 'Flutter demo home page',),
            routes: <String, WidgetBuilder>{
                '/Align': (_) => new LYAlign(),
            },
        );
    }
}

class MyHomePage extends StatefulWidget {

    MyHomePage({Key key, this.title}) : super(key: key);

    final String title;

    _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

    Widget build(BuildContext context) {
        List<String> layoutWidgets = [];
        layoutWidgets.add("--Single-child layout widgets --");
        layoutWidgets.addAll(singleLayoutWidgets);
        layoutWidgets.add("--Multi-child layout widgets---暂未完工");
        return new Scaffold(
            appBar: new AppBar(
                title: new Text(widget.title),
            ),
            body: new ListView.builder(
                itemBuilder: (BuildContext buildContext, int index) {
                    return new ListTile(
                        title: new LayoutListItem(
                            index,
                            layoutWidgets[index],
                            () {
                                String item =layoutWidgets[index];
                                if (item.startsWith("--")) {
                                  return;
                                }
                                _navigateToPage(context, layoutWidgets[index]);
                            },
                        ),
                    );

                },
                itemCount: (singleLayoutWidgets.length + multiLayoutWidgets.length),
            ),
        );

    }
}

class LayoutListItem extends StatelessWidget {

    LayoutListItem(this.index, this.title, this.onPress);
    final int index;
    final String title;
    final VoidCallback onPress;

    Widget build(BuildContext context) {
        return new GestureDetector(
            onTap: onPress,
            child: new Center(
                child: new Text("$title", style: new TextStyle(fontSize: 16.0, color: Colors.black)),
            ),
        );

    }


}

void _navigateToPage (BuildContext context, String page) {
    print("page: $page");
    Navigator.of(context).pushNamed('/$page');

}