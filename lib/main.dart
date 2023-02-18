import 'package:flutter/material.dart';

import 'grid_search.dart';
import 'list_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.deepPurple,
          title: Text('Search in list & Grid '),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const GridSearchScreen()
              ));},
                icon: Icon(Icons.search))
          ],
    ),
        body: Center(
          child: Text(
            'search for jobs',
            style: TextStyle(color: Colors.black,fontSize: 30),
          ),
        )
    );
  }
}
