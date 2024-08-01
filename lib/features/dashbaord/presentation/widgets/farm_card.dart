import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/farm_details_page.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/build_item.dart';

class FarmCard extends StatelessWidget {
  const FarmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Approuter.router.push(FarmDetailsPage.routePath),
      child: Container(
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
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InterText(
              'Farm near well',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Vspacing(8.h),
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: 16 / 6,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 5.h,
              children: <Widget>[
                buildItem(
                  icon: LucideIcons.sprout,
                  label: 'Crop',
                  value: 'Wheat',
                  color: Colors.green,
                ),
                buildItem(
                  icon: Icons.date_range,
                  label: 'Day',
                  value: '26',
                  color: Colors.purple,
                ),
                buildItem(
                  icon: Icons.water_drop_rounded,
                  label: 'Soil Moisture',
                  value: '22',
                  color: Colors.blue,
                ),
                buildItem(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '22',
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
