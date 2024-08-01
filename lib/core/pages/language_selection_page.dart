import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/core/theme/colors.dart';
import 'package:smart_agro/features/auth/presentation/pages/login_page.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});
  static const routeName = 'LanguageSelectionPage';
  static const routePath = '/LanguageSelectionPage';
  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  List<String> languages = ['English', "marathi"];
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = languages[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.r),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              Vspacing(10.h),
              const PoppinsText(
                'Select your preferred langauge',
                style: TextStyle(fontSize: 26),
              ),
              Vspacing(25.h),
              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final String lang = languages[index];
                    return CheckboxListTile.adaptive(
                      title: PoppinsText(
                        lang,
                        style: const TextStyle(fontSize: 18),
                      ),
                      tileColor:
                          Colors.white, // Set the background color to white
                      shape: selectedLanguage == lang
                          ? RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors
                                    .green, // Set the border color to green
                                width: 2, // Set the border width
                              ),
                              borderRadius: BorderRadius.circular(
                                5,
                              ), // Optional: Set the border radius if you want rounded corners
                            )
                          : null,
                      value: selectedLanguage == lang,
                      onChanged: (value) => setState(() {
                        selectedLanguage = lang;
                      }),
                    );
                  },
                  separatorBuilder: (context, index) => Vspacing(12),
                ),
              ),
              ElevatedButton(
                onPressed: () => Approuter.router.go(LoginPage.routePath),
                child: const PoppinsText('Accept'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
