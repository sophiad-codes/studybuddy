import 'package:flutter/material.dart';
import 'package:studdybuddy/home.dart';
import 'package:studdybuddy/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studdy Buddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE97868)),
      ),
      routes: {
        '/': (context) => const MainScaffold(title: 'Study Buddy', child: Text('Home coming soon')),
        '/friends': (context) => const MainScaffold(
              title: 'Friends',
              child: Center(child: Text('Friends coming soon')),
            ),
        '/settings': (context) =>
            const MainScaffold(title: 'Settings', child: 
            Text('Setting coming soon')),
      },
    );
  }
}

class MainScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const MainScaffold({super.key, required this.title, required this.child});

  static const List<String> _routes = ['/', '/friends', '/settings'];

  @override
  Widget build(BuildContext context) {
    final current = ModalRoute.of(context)?.settings.name;
    final index = _routes.indexOf(current ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
            icon: const Icon(Icons.house),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: const Color(0xFFE97868),
        type: BottomNavigationBarType.fixed,
        currentIndex: index < 0 ? 0 : index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: 'Friends'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (i) => Navigator.of(context).pushReplacementNamed(_routes[i]),
      ),
    );
  }
}