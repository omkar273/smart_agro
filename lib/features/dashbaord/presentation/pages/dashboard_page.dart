import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/utils/add_new_farm.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/build_grid.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/build_item.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/climate_tile.dart';
import 'package:smart_agro/features/dashbaord/presentation/widgets/farm_card.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = 'DashboardPage';
  static const routePath = '/DashboardPage';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Column(
            children: [
              const ClimateTile(),
              Vspacing(10.h),
              const DashboardGrid(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterText(
                          'Farms',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          onPressed: () => addNewFarm(),
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Vspacing(15.h),
              const FarmCard()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Text(
        "SA",
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
      ),
      title: InterText(
        'Smart Agro',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 28.sp,
        ),
      ),
      actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.search),
        // ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }

  Widget _buildDashboardGrid() {
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
            value: '27 °C',
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
            label: 'Water',
            value: 'NA',
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
