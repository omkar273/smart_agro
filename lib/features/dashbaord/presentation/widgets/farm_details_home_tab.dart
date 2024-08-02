import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/theme/colors.dart';
import 'package:smart_agro/core/utils/show_text_snackbar.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/build_grid.dart';

class FarmDetailsHomeTab extends StatelessWidget {
  const FarmDetailsHomeTab({super.key});
  static const tasks = [
    'Sowing the seeds',
    'Watering the farm 160 ltr/acre',
    'Plant soil testing',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardGrid(),
          Vspacing(15.h),
          SwitchListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            contentPadding: EdgeInsets.all(12.r),
            tileColor: AppColors.primary,
            title: PoppinsText(
              'Water pump ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            value: false,
            onChanged: (value) {
              showTextSnackbar('Water pump is offline');
            },
          ),
          Vspacing(15.h),
          PoppinsText(
            'Current Tasks',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Vspacing(12.h),
          ...tasks.map(
            (e) => Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                  ),
                  tileColor: AppColors.primary,
                  title: PoppinsText(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Vspacing(4.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
