import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});
  static const routeName = 'StorePage';
  static const routePath = '/StorePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // two items per row
                childAspectRatio: 0.8, // aspect ratio of each card
                crossAxisSpacing: 10, // spacing between the cards horizontally
                mainAxisSpacing: 10, // spacing between the cards vertically
              ),
              itemCount: 10, // number of items in the grid
              itemBuilder: (context, index) {
                return _buildProductCard(
                    context, 'Product $index', '\$${(index + 1) * 10}');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, String productName, String price) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              productName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your action for buying the product
              },
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
