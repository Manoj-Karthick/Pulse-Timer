import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/home_page.dart';

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
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          // bg
          onPrimary: Colors.grey[800]!,
          // text
          secondary: Colors.grey[200]!,
          // bg 2
          onSecondary: Colors.grey[600]!,
          // text 2
          tertiary: Colors.grey[300]!,
          // bg 3
          onTertiary: Colors.grey[500]!,
          // text 3
          surface: Colors.grey[100]!,
          // Light grey for cards/surfaces
          onSurface: Colors.black,
          // Text/icons on surface
          inversePrimary: Colors.redAccent,
          // Hightlights
          error: Colors.redAccent,
          // Standard error color
          onError: Colors.white, // Text/icons on error
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Chick Timer'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.settings),
              ),
            ),
          ],
        ),
        body: HomePage(),
        bottomNavigationBar: NavigationBar(
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart),
              label: 'Reports',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}
