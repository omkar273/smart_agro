import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter_sa/flutter.dart' as charts;

class PlantMonitoringTab extends StatelessWidget {
  const PlantMonitoringTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text('Soil pH Level'),
                subtitle: Text('7.2'),
                trailing: Icon(Icons.thermostat_outlined),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text('Nitrogen Content'),
                subtitle: Text('Moderate'),
                trailing: Icon(Icons.filter_vintage),
              ),
            ),
          ),
          _buildBarChart(),
          _buildLineChart(),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(show: true),
              barGroups: [
                BarChartGroupData(x: 0, barRods: []),
                BarChartGroupData(x: 1, barRods: []),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    final data = [
      charts.Series(
        id: 'Growth',
        data: [
          PlantGrowthData(1, 5),
          PlantGrowthData(2, 6),
          PlantGrowthData(3, 7),
          PlantGrowthData(4, 10),
        ],
        domainFn: (PlantGrowthData growth, _) => growth.day,
        measureFn: (PlantGrowthData growth, _) => growth.height,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      )
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: charts.LineChart(data, animate: true),
        ),
      ),
    );
  }
}

class PlantGrowthData {
  final int day;
  final double height;

  PlantGrowthData(this.day, this.height);
}
