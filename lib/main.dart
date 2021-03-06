// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(CobaApp());

class CobaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Coba",
        home: Scaffold(
          appBar: AppBar(title: Text("coba")),
          body: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.yellow,
                  child: Text("Ini nanti diisi gambar"),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(children: [
                        Expanded(
                            flex: 5, child: Container(color: Colors.green)),
                        Expanded(
                          flex: 5, child: Container(color: Colors.red))
                      ])),
                      Expanded(child: Column(children: [
                        Expanded(
                          flex: 5, child: Container(color: Colors.red[200])),
                        Expanded(
                          flex: 5, child: Container(color: Colors.blue[200])
                        )
                      ])),
                    ],
                  ))
            ],
          ),
        ));
  }
  
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
     title: 'Startup Name Generator',
     home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Startup Name Generator'),
    ),
    body: _buildSuggestions(),
  );
  }
  Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
}
}