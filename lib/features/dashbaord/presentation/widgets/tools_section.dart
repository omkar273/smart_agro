import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/constants/asset_path.dart';
import 'package:smart_agro/core/theme/colors.dart';

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
      const ToolsItem(
        text: 'Add Farm',
        svgLink: AssetPath.fertilizerboxPath,
      ),
      const ToolsItem(
        text: 'My Farms',
        svgLink: AssetPath.fertilizerboxPath,
      ),
      const ToolsItem(
        text: 'Crop Selector',
        svgLink: AssetPath.cropSelectoprIconPath,
      ),
      const ToolsItem(
        text: 'Fertilizer Calculator',
        svgLink: AssetPath.fertilizerboxPath,
      ),
      const ToolsItem(
        text: 'Buy Products',
        svgLink: AssetPath.shoppingCartPath,
      ),
      const ToolsItem(
        text: 'Weather',
        svgLink: AssetPath.weatherIconPath,
      ),
      const ToolsItem(
        text: 'Recent News',
        svgLink: AssetPath.newsIconPath,
      ),
      const ToolsItem(
        text: 'Government Schemes',
        svgLink: AssetPath.articlesIconPath,
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
