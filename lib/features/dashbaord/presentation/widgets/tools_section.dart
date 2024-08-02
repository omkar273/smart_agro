import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/constants/asset_path.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/core/theme/colors.dart';
import 'package:smart_agro/core/utils/show_text_snackbar.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/crop_selector.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/my_farms_page.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/store_page.dart';

class DashboardToolsSection extends StatefulWidget {
  const DashboardToolsSection({super.key});

  @override
  State<DashboardToolsSection> createState() => _DashboardToolsSectionState();
}

class _DashboardToolsSectionState extends State<DashboardToolsSection> {
  late bool showAll;

  @override
  void initState() {
    super.initState();
    showAll = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Add cultivation tips,pests and diseases , alerts , financial report , profit calculator , IOT sensors , crop health

    List<Widget> toolsItems = [
      ToolsItem(
        text: 'Add Farm',
        svgLink: AssetPath.fertilizerboxPath,
        onTap: () => Approuter.router.go(MyFarmsPage.routePath),
      ),
      ToolsItem(
        text: 'My Farms',
        svgLink: AssetPath.fertilizerboxPath,
        onTap: () => Approuter.router.go(MyFarmsPage.routePath),
      ),
      ToolsItem(
        text: 'Crop Selector',
        svgLink: AssetPath.cropSelectoprIconPath,
        onTap: () => Approuter.router.go(CropSelector.routePath),
      ),
      ToolsItem(
        text: 'Fertilizer Calculator',
        svgLink: AssetPath.fertilizerboxPath,
        onTap: () => showTextSnackbar('coming soon'),
      ),
      ToolsItem(
        text: 'Buy Products',
        svgLink: AssetPath.shoppingCartPath,
        onTap: () => Approuter.router.go(StorePage.routePath),
      ),
      ToolsItem(
        text: 'Weather',
        svgLink: AssetPath.weatherIconPath,
        onTap: () => showTextSnackbar('coming soon'),
      ),
      ToolsItem(
        text: 'Recent News',
        svgLink: AssetPath.newsIconPath,
        onTap: () => showTextSnackbar('coming soon'),
      ),
      ToolsItem(
        text: 'Government Schemes',
        svgLink: AssetPath.articlesIconPath,
        onTap: () => showTextSnackbar('coming soon'),
      ),
    ];

    // Determine the number of items to show based on `showAll`
    List<Widget> visibleItems =
        showAll ? toolsItems : toolsItems.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoppinsText(
          'Tools',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Vspacing(15.h),
        GridView.count(
          shrinkWrap: true,
          childAspectRatio: 4 / 3,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 0.w,
          mainAxisSpacing: 5.h,
          children: visibleItems,
        ),
        Vspacing(15.h),
        GestureDetector(
          onTap: () => setState(() {
            showAll = !showAll;
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PoppinsText(
                showAll ? 'View less' : 'View more',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Hspacing(4.w),
              Icon(
                showAll ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: AppColors.primary,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ToolsItem extends StatelessWidget {
  final Widget? child;
  final String text;
  final String? svgLink;
  final void Function()? onTap;

  const ToolsItem({
    super.key,
    required this.text,
    this.child,
    this.onTap,
    this.svgLink,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          child ??
              SvgPicture.asset(
                svgLink!,
                width: 24.w,
                height: 24.w,
                alignment: Alignment.center,
              ),
          Vspacing(5.h),
          PoppinsText(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
