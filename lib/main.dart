import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Startup Name Generator',   
			theme: new ThemeData(
				fontFamily: 'Roboto',
				primaryColor: Colors.teal,
			),         
			home: new RandomWords(),
		);
	}
}

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);
	@override
	RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
	final List<WordPair> _suggestions = <WordPair>[];
	final Set<WordPair> _saved = new Set <WordPair>();
	final _biggerFont = const TextStyle(fontSize: 18.0);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text('Startup Name Generator'),
				actions: <Widget>[
				//	new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
				],
			),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Draw Header'),
              decoration:  BoxDecoration(
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Saved Sugestions'),
              onTap: () {
                _pushSaved();
              }
            ),
            ListTile(
              title: Text('SnackBar Pop Up'),
              onTap: () {
                // Not working
                Scaffold.of(context).showSnackBar(SnackBar(content: new Text('This is a snack bar')));
              },
            )
          ]
        ),
      ),
			body: _buildSuggestions(),
		);
	}
	Widget _buildSuggestions() {
		return ListView.builder(
		padding: const EdgeInsets.all(16.0),
		itemBuilder: /*1*/ (context, i) {
			if (i.isOdd) return Divider(); /*2*/
			final index = i ~/ 2; /*3*/
				if (index >= _suggestions.length) {
					_suggestions.addAll(generateWordPairs().take(10)); /*4*/
				}
			return _buildRow(_suggestions[index]);
		});
	}
	Widget _buildRow(WordPair pair) {
		final bool alreadySaved = _saved.contains(pair);
		return new ListTile(
			title: Text(
				pair.asPascalCase,
				style: _biggerFont,
			),
			trailing: new Icon(
				alreadySaved ? Icons.favorite : Icons.favorite_border,
				color: alreadySaved ? Colors.red : null,
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

	void _pushSaved () {
		Navigator.of(context).push(
			new MaterialPageRoute<void>(
				builder: (BuildContext constext) {
					final Iterable<ListTile> tiles = _saved.map(
						(WordPair pair) {
							return new ListTile (
								title: new Text (
									pair.asPascalCase,
									style: _biggerFont,
								),
							);
						},
					);
					final List<Widget> divided = ListTile
						.divideTiles(
							context: context,
							tiles:  tiles,
						)
						.toList();

					return new Scaffold(
						appBar: new AppBar(
							title: const Text('Saved Suggestions'),
						),
						body: new ListView(children: divided),
					);
				},
			),
		);
	}
}

