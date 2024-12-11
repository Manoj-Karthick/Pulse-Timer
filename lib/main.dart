import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'QueEazy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Column(
          children: [
            Text(widget.title),
            const Text(
              'Chennai',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        actions: [
          GestureDetector(
              onTap: null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: const Icon(Icons.search),
              )),
          GestureDetector(
              onTap: null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.settings),
              )),
        ],
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search by Saloon'),
              )),
              Container(
                margin: EdgeInsets.all(8),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        Row(
          children: [],
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
