import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/models/farm_model.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/farm_details_page.dart';
import 'package:smart_agro/features/dashbaord/presentation/utils/get_farms.dart';

class MyFarmsPage extends StatelessWidget {
  const MyFarmsPage({super.key});
  static const routeName = 'MyFarmsPage';
  static const routePath = '/MyFarmsPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Vspacing(15.h),
            FutureBuilder<List<FarmModel>>(
              future: getfarms(limit: 3),
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
                      FarmModel farm = snapshot.data![index];
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
                            farm.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text('Crop: ${farm.crop}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            onPressed: () => Approuter.router.push(
                              FarmDetailsPage.routePath,
                              extra: farm,
                            ),
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
        ),
      ),
    );
  }
}
