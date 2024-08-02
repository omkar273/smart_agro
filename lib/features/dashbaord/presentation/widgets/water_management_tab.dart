import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';

class WaterManagementTab extends StatefulWidget {
  const WaterManagementTab({super.key});

  @override
  State<WaterManagementTab> createState() => _WaterManagementTabState();
}

class _WaterManagementTabState extends State<WaterManagementTab> {
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
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: SwitchListTile(
                title: const PoppinsText('Motor Status'),
                subtitle: const PoppinsText('Turn on/off the water motor'),
                value: true,
                onChanged: (bool value) {},
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: PoppinsText(
                  'Water Pressure',
                  style: titleStyle,
                ),
                subtitle: PoppinsText(
                  'Current Pressure: 120 psi',
                  style: subtitleStyle,
                ),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: const PoppinsText('Water Supply Speed'),
                subtitle: Slider(
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: '50L', // This should be dynamically updated
                  value: 50, // This should be a stateful value in a real app
                  onChanged: (double value) {
                    // Handle change
                  },
                ),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PoppinsText(
                      'Field Watering Time Estimation',
                      style: titleStyle,
                    ),
                    const PoppinsText('Field Area: 1000 sqm'),
                    const PoppinsText('Estimated Time: 3 hours'),
                  ],
                ),
              ),
            ),
            Vspacing(10.h),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: const PoppinsText('Water Filling Progress'),
                subtitle: LinearProgressIndicator(
                  value: 0.5, // This should be a stateful value in a real app
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
              ),
            ),
            Vspacing(15.h),
            Vspacing(10.h),
            PoppinsText(
              'Water Pressure',
              style: titleStyle,
            ),
            Vspacing(5.h),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
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
                          const FlSpot(0, 3),
                          const FlSpot(1, 2),
                          const FlSpot(2, 5),
                          const FlSpot(3, 3.5),
                          const FlSpot(4, 4),
                          const FlSpot(5, 3),
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
            Vspacing(15.h),
            Vspacing(10.h),
            PoppinsText(
              'Water filling in this week',
              style: titleStyle,
            ),
            Vspacing(5.h),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1.7,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 10,
                    barTouchData: BarTouchData(
                      enabled: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            switch (value.toInt()) {
                              case 0:
                                return const PoppinsText('Jan');
                              case 1:
                                return const PoppinsText('Feb');
                              case 2:
                                return const PoppinsText('Mar');
                              case 3:
                                return const PoppinsText('Apr');
                              case 4:
                                return const PoppinsText('May');
                              case 5:
                                return const PoppinsText('Jun');
                              default:
                                return const PoppinsText('');
                            }
                          },
                        ),
                      ),
                    ),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(toY: 8, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(toY: 6, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(toY: 7, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(toY: 5, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(toY: 9, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 5, barRods: [
                        BarChartRodData(toY: 4, color: Colors.blue)
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
