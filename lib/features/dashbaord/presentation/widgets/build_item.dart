import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/inter_text.dart';

Widget buildItem({
  required IconData icon,
  required String label,
  required String value,
  Color color = Colors.amber,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          size: 24.sp,
          color: Colors.white,
        ),
      ),
      SizedBox(
        width: 8.w,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InterText(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          InterText(
            label,
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    ],
  );
}
