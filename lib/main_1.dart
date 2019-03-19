import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp2());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new RandomWords(),
        )
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
   @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        //在每一行之前，添加一个1像素高的分割线widget
        if (i.isOdd) return new Divider();
        //语法 ”i ~/ 2” 表示i除以2， 但返回值是整形（向下取整），比如i为: 1,2,3,4,5
        //时， 结果为0，1，1，2，2， 这可以计算出ListView中减去分割线后实际单词对数量
        final index = i ~/ 2;
        if (index >=_suggestions.length) {
          //接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style:_biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite:Icons.favorite_border,
        color:alreadySaved? Colors.red :null
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body:_buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles =_saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style:_biggerFont,
                ),
              );
            }
          );

          final divided =ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}


class MyApp2 extends StatelessWidget {

    Widget build(BuildContext context) {
        return new Container(
            width: 100,
            height: 200,
            constraints: new BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 2.0,
            ),
            decoration: new BoxDecoration(
                border: new Border.all(width: 2.0, color: Colors.red),
                color: Colors.white,
                borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
                image: new DecorationImage(
                  image: new NetworkImage("http://i0.hdslb.com/bfs/article/d1817699d2fdf65d70bd537b77bd0b9485559cc7.jpg"),
                  ),
            ),
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topCenter, 
            child: new Text('Hello world',
               style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black),
               textDirection: TextDirection.ltr),
            transform: new Matrix4.rotationY(1),
        );
    }

}

