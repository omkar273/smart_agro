import 'package:flutter/material.dart';
import 'package:smart_agro/core/components/poppins_text.dart';

class FinancialReportPage extends StatelessWidget {
  const FinancialReportPage({super.key});
  static const routeName = 'FinancialReport';
  static const routePath = '/FinancialReport';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PoppinsText('Financial Report'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
