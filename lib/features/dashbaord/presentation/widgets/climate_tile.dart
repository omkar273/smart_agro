import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
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
  late Size _size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: Colors.grey.shade100.withOpacity(0.50),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: Colors.green,
              ),
            ),
            width: _size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hspacing(0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nashik, ${getCurrentDate()}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rain 22 c/24 c",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    PoppinsText(
                      '23 ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.cloud),
                  ],
                )
              ],
            ),
          ),
          Hspacing(15.w),
          Container(
            width: _size.width * 0.75,
            color: Colors.green, // Added for visibility
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "More Climate Info",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          // Add more containers if needed
        ],
      ),
    );
  }
}
