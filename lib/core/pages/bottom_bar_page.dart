import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/theme/colors.dart';

class BottomBarPage extends StatelessWidget {
  static const routeName = 'BottomBarPage';
  static const routePath = '/BottomBarPage';
  final StatefulNavigationShell shell;
  const BottomBarPage({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: shell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: shell.currentIndex,
        // showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: false,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,

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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'My Farms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Dukaan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 2,
      shadowColor: Colors.grey,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SA",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
      title: InterText(
        'Welcome to Smart Agro',
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
      actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.search),
        // ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }
}
