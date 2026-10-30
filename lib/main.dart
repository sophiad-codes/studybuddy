import 'package:flutter/material.dart';
import 'package:studybuddy/home.dart';
import 'package:studybuddy/settings.dart';
import 'package:studybuddy/friends.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Buddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE97868)),
        scaffoldBackgroundColor: const Color(0xFFDED3C5),
      ),
      home: const MainScaffold()
    );
  }
}

class MainScaffold extends StatefulWidget {  

  const MainScaffold({super.key});

  @override
  State<StatefulWidget> createState() => _MainScaffoldState(); 
}

class _MainScaffoldState extends State<MainScaffold> {
    int _currentIndex = 0;
    
    @override
    Widget build(BuildContext context) {
      final (title, page) = switch (_currentIndex) {
        0 => ('Home', Home()),
        1 => ('Friends', Friends()),
        2 => ('Settings', Settings()),
        // TODO: Handle this case.
        _ => throw UnimplementedError(),
      }; 

      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: const Color(0xFFDED3C5),
        ),
        body: page,
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xFFE97868),
          selectedIndex: _currentIndex,
          onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.group_outlined), label: 'Friends'),
            NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ],
        ),
      );
    }
  }