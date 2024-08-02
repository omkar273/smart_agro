import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';

class PlantMonitoringTab extends StatefulWidget {
  const PlantMonitoringTab({super.key});

  @override
  State<PlantMonitoringTab> createState() => _PlantMonitoringTabState();
}

class _PlantMonitoringTabState extends State<PlantMonitoringTab> {
  final titleStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  final subtitleStyle = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text('Plant Name'),
                subtitle: Text('Rose'),
                trailing: Icon(Icons.local_florist),
              ),
            ),
            const Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text('Planting Date'),
                subtitle: Text('April 15, 2024'),
              ),
            ),
            const Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text('Possible Diseases'),
                subtitle: Text('Powdery Mildew, Aphids'),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Soil Analysis'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      border: TableBorder.all(),
                      children: const [
                        TableRow(children: [
                          Text('Nutrient Level'),
                          Text('High'),
                        ]),
                        TableRow(children: [
                          Text('pH'),
                          Text('6.5'),
                        ]),
                        TableRow(children: [
                          Text('Soil Type'),
                          Text('Loamy'),
                        ]),
                        TableRow(children: [
                          Text('Location'),
                          Text('North Field'),
                        ]),
                        TableRow(children: [
                          Text('Composition'),
                          Text('Organic Matter: 5%'),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Vspacing(15.h),
            PoppinsText(
              'Soil Moisture ',
              style: titleStyle,
            ),
            Vspacing(5.h),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: AspectRatio(
                aspectRatio: 1.7,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: true),
                    titlesData: const FlTitlesData(show: true),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 20),
                          const FlSpot(1, 30),
                          const FlSpot(2, 25),
                          const FlSpot(3, 35),
                          const FlSpot(4, 40),
                        ],
                        isCurved: true,
                        barWidth: 5,
                        belowBarData: BarAreaData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text('Plant Growth Rate'),
                subtitle: Text('Steady'),
              ),
            ),
            const Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text('Plant Health'),
                subtitle: Text('Good'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
