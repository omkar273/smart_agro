import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';

class ResourceManagementTab extends StatelessWidget {
  const ResourceManagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText(
              'Energy Consumption tracking',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            Vspacing(15.h),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(12.r),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PoppinsText(
                        'Electric Usage',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Vspacing(10.h),
                  Row(
                    children: [
                      const PoppinsText(
                        '183W',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Hspacing(5.w),
                      PoppinsText(
                        'MwH',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  const PoppinsText(
                    'High consumption',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  ...[
                    '1. Machinery and equipment usage',
                    '2. greenhouses',
                    '3. Fuel consumption',
                    '4. Livestock Facility'
                  ].map(
                    (e) {
                      return PoppinsText(
                        ' $e',
                      );
                    },
                  ),
                  const PoppinsText(
                    'Fertilizer and nutrient Mangement',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Vspacing(15.h),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(18.r),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 64.r,
                            backgroundImage: const NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Vehn%C3%A4pelto_6.jpg/330px-Vehn%C3%A4pelto_6.jpg',
                            ),
                          ),
                          const PoppinsText(
                            'Crop name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const PoppinsText(
                            'Wheat',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Vspacing(30.h),
                  const PoppinsText(
                    'Fertilizer and nutrient Mangement',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const PoppinsText(
                    'urea, ammonium nitrate',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Vspacing(20.h),
                  const PoppinsText(
                    'Organic Fertilizer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const PoppinsText(
                    'manure, compost',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Vspacing(20.h),
                  const PoppinsText(
                    'Customized Fertilizer Blends',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const PoppinsText(
                    'calcium, magnesium, sulfur',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
