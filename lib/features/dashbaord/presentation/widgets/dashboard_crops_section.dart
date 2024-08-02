import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/models/crop_model.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/crop_selector.dart';
import 'package:smart_agro/features/dashbaord/presentation/utils/get_crops.dart';

class DashboardCropsSection extends StatefulWidget {
  const DashboardCropsSection({super.key});

  @override
  State<DashboardCropsSection> createState() => _DashboardCropsSectionState();
}

class _DashboardCropsSectionState extends State<DashboardCropsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinsText(
              'Suggested crops',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () => Approuter.router.go(CropSelector.routePath),
              child: PoppinsText(
                'View all',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        Vspacing(15.h),
        FutureBuilder<List<CropModel>>(
          future: getCrops(limit: 3),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  CropModel crop = snapshot.data![index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.landscape,
                        color: Colors.green,
                      ),
                      title: PoppinsText(
                        crop.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text('Crop: ${crop.cropFamily}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No farms available'));
            }
          },
        ),
      ],
    );
  }
}
