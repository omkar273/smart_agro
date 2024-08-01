import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/components/spacing.dart';

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
      appBar: _buildAppBar(),
      body: Column(
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
                      color: Colors.white, // Set the background color to white
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
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: InterText(
        'Smart Agro',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 28.sp,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
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

  // Widget _buildPriceRangeFilter(void Function(void Function()) setState) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Budget',
  //         style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  //       ),
  //       Slider(
  //         value: _price,
  //         min: 0,
  //         max: 1000, // Maximum value for the slider
  //         divisions: 100, // Number of discrete divisions
  //         label: '₹${_price.round()}',
  //         onChanged: (double value) {
  //           setState(() {
  //             _price = value;
  //           });
  //         },
  //       ),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
  //         child: Text('₹${_price.round()}'),
  //       ),
  //     ],
  //   );
  // }
}
