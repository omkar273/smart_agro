import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:smart_agro/core/utils/get_location.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/build_item.dart';

class DashboardGrid extends StatefulWidget {
  const DashboardGrid({super.key});

  @override
  State<DashboardGrid> createState() => _DashboardGridState();
}

class _DashboardGridState extends State<DashboardGrid> {
  double temperature = 27.6;
  double soilMoisture = 22.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    initLocation();
    startTimer();
  }

  void initLocation() async {
    await getCurrentLocation();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        temperature = getNextValue(temperature, 0, 40);
        soilMoisture = getNextValue(soilMoisture, 0, 100);
      });
    });
  }

  double getNextValue(double currentValue, double min, double max) {
    double change = (0.5 - 0.25); // Change value as needed for the range
    double newValue = currentValue + change;
    if (newValue < min) newValue = min;
    if (newValue > max) newValue = max;
    return newValue;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -4,
            blurRadius: 8,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 16 / 6,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        children: [
          buildItem(
            icon: Icons.device_thermostat,
            label: 'Temperature',
            value: '${temperature.toStringAsFixed(1)} °C',
            color: Colors.red,
          ),
          buildItem(
            icon: Icons.cloudy_snowing,
            label: 'Rainfall',
            value: 'NA',
            color: Colors.purple,
          ),
          buildItem(
            icon: Icons.water_drop_rounded,
            label: 'Soil Moisture',
            value: '${soilMoisture.toStringAsFixed(1)}',
            color: Colors.blue,
          ),
          buildItem(
            icon: Icons.air,
            label: 'Wind Speed',
            value: '22 m/s',
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
