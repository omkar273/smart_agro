import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:intl/intl.dart';

String getCurrentDate() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('d MMM');
  return formatter.format(now).toLowerCase();
}

class ClimateTile extends StatefulWidget {
  const ClimateTile({super.key});

  @override
  State<ClimateTile> createState() => _ClimateTileState();
}

class _ClimateTileState extends State<ClimateTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      title: PoppinsText(
        'Today, Pathardi Phata',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: const PoppinsText(
        'showers 1mm rain',
      ),
      trailing: Row(
        mainAxisSize:
            MainAxisSize.min, // This ensures the Row only takes needed space
        children: [
          PoppinsText(
            '23 °',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.cloudy_snowing),
        ],
      ),
    );
  }
}
