import 'package:flutter/material.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/get_it/service_locator.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/features/auth/presentation/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const routeName = 'SettingsPage';
  static const routePath = '/SettingsPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await locator<SupabaseClient>().auth.signOut();
                Approuter.router.go(LoginPage.routePath);
              },
              child: const PoppinsText('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
