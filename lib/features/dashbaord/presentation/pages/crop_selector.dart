import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/poppins_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/models/crop_model.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/crop_details_page.dart';
import 'package:smart_agro/features/dashbaord/presentation/utils/get_crops.dart';

class CropSelector extends StatefulWidget {
  static const routeName = 'CropSelector';
  static const routePath = '/CropSelector';
  const CropSelector({super.key});

  @override
  State<CropSelector> createState() => _CropSelectorState();
}

class _CropSelectorState extends State<CropSelector> {
  final TextEditingController _searchController = TextEditingController();
  int? _selectedTimePeriod;
  double _price = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 48.sp, // Adjust the height as needed
                      ),
                      child: _buildSearchBar(),
                    ),
                  ),
                  Hspacing(5.w),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 48.sp,
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Set the background color to white
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      child: IconButton(
                        onPressed: _showFilterDialog,
                        icon: const Icon(Icons.filter_list),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // show crops list
            Vspacing(15.h),
            FutureBuilder<List<CropModel>>(
              future: getCrops(limit: 15),
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
                            onPressed: () => Approuter.router.pushNamed(
                              CropDetailsPage.routeName,
                              extra: crop,
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

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search crops',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (value) {
        // Update your list based on the search query
      },
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Filter Options'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildTimePeriodFilter(setState),
                    SizedBox(height: 20.sp),
                    _buildPriceRangeFilter(setState),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Optionally, update the parent state as well if needed
                    this.setState(() {
                      // Update any state in the parent widget if necessary
                    });
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildPriceRangeFilter(StateSetter setState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Budget',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: _price,
          min: 0,
          max: 1000,
          divisions: 100,
          label: '₹${_price.round()}',
          onChanged: (double value) {
            setState(() {
              // Make sure this is the setState from StatefulBuilder
              _price = value;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
          child: Text('₹${_price.round()}'),
        ),
      ],
    );
  }

  Widget _buildTimePeriodFilter(StateSetter setState) {
    return DropdownButton<int>(
      value: _selectedTimePeriod,
      hint: const Text('Select time period'),
      isExpanded: true,
      items: <int>[1, 4, 6, 12].map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text('${value.toString()} Months'),
        );
      }).toList(),
      onChanged: (int? newValue) {
        setState(() {
          _selectedTimePeriod = newValue;
        });
      },
    );
  }
}
