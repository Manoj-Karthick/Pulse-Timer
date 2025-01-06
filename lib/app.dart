import 'package:flutter/material.dart';
import 'package:learn_flutter/homepage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue[200],
          selectionHandleColor: Colors.blue,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          // bg
          onPrimary: Colors.grey[800]!,
          // text
          secondary: Colors.grey[300]!,
          // bg 2
          onSecondary: Colors.redAccent,
          // text 2
          tertiary: Colors.grey[500]!,
          // bg 3
          onTertiary: Colors.grey[400]!,
          // text 3
          surface: Colors.grey[200]!,
          // Light grey for cards/surfaces
          onSurface: Colors.black,
          // Text/icons on surface
          inversePrimary: Colors.redAccent,
          // Highlights
          error: Colors.redAccent,
          // Standard error color
          onError: Colors.white, // Text/icons on error
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            'Pulse Timer',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: _pages[_currentIndex],
        // bottomNavigationBar: NavigationBar(
        //   selectedIndex: _currentIndex,
        //   onDestinationSelected: (int index) {
        //     setState(() {
        //       _currentIndex = index; // Update the selected tab
        //     });
        //   },
        //   backgroundColor: Theme.of(context).colorScheme.onPrimary,
        //   destinations: <Widget>[
        //     NavigationDestination(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
