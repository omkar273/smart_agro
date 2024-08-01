import 'package:flutter/material.dart';
import 'package:smart_agro/core/components/poppins_text.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const PoppinsText('Accept'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
