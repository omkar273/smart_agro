import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/models/farm_model.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/plant_monitoring_tab.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/farm_details_home_tab.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/resource_management_tab.dart';

class FarmDetailsPage extends StatelessWidget {
  const FarmDetailsPage({super.key, required this.farm});
  final FarmModel farm;
  static const routeName = 'FarmDetailsPage';
  static const routePath = '/FarmDetailsPage';

  @override
  Widget build(BuildContext context) {
    log(farm.toString());
    return DefaultTabController(
      initialIndex: 1,
      animationDuration: const Duration(milliseconds: 600),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const InterText('Farm details'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(LucideIcons.hand_coins),
                text: 'Resource',
              ),
              Tab(
                icon: Icon(Icons.water),
                text: 'Water',
              ),
              Tab(
                icon: Icon(LucideIcons.earth),
                text: 'Soil',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FarmDetailsHomeTab(),
            ResourceManagementTab(),
            Icon(Icons.directions_bike),
            PlantMonitoringTab()
          ],
        ),
      ),
    );
  }
}
