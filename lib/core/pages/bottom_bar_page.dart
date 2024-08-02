import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class BottomBarPage extends StatelessWidget {
  static const routeName = 'BottomBarPage';
  static const routePath = '/BottomBarPage';
  final StatefulNavigationShell shell;
  const BottomBarPage({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: shell.currentIndex,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        onTap: (value) => shell.goBranch(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.sprout),
            label: 'Crop Selector',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Management',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Setting',
          // ),
        ],
      ),
    );
  }
}
