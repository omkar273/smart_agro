import 'package:flutter/material.dart';
import 'package:smart_agro/core/models/crop_model.dart';

class CropDetailsPage extends StatelessWidget {
  static const routeName = 'CropDetailsPage';
  static const routePath = '/CropDetailsPage';

  const CropDetailsPage({
    super.key,
    required this.crop,
  });

  final CropModel crop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crop.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (crop.imgUrl != null)
              Center(
                child: Image.network(
                  crop.imgUrl!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Description"),
                      subtitle:
                          Text(crop.description ?? "No description provided"),
                    ),
                    ListTile(
                      title: const Text("Price"),
                      subtitle: Text(
                          "\$${crop.price?.toStringAsFixed(2) ?? 'Not available'}"),
                    ),
                    ListTile(
                      title: const Text("Tenure"),
                      subtitle: Text("${crop.tenureInMonths ?? 'N/A'} months"),
                    ),
                    ListTile(
                      title: const Text("Weather"),
                      subtitle: Text(crop.weather ?? "Not specified"),
                    ),
                    ListTile(
                      title: const Text("Season"),
                      subtitle: Text(crop.season ?? "Not specified"),
                    ),
                    ListTile(
                      title: const Text("Harvest Time"),
                      subtitle:
                          Text("${crop.harvestTimeInMonths ?? 'N/A'} months"),
                    ),
                    ListTile(
                      title: const Text("Care for Good Harvest"),
                      subtitle: Text(crop.careForGoodHarvest ??
                          "No specific care instructions"),
                    ),
                    ListTile(
                      title: const Text("Preferred Pesticides"),
                      subtitle: Text(crop.preferredPesticides ??
                          "No pesticides specified"),
                    ),
                    ListTile(
                      title: const Text("Crop Family"),
                      subtitle: Text(crop.cropFamily ?? "Not specified"),
                    ),
                    ListTile(
                      title: const Text("Type of Crop"),
                      subtitle: Text(crop.typeOfCrop ?? "Not specified"),
                    ),
                    ListTile(
                      title: const Text("Temperature Range"),
                      subtitle: Text(
                          "${crop.minTemp?.toStringAsFixed(1) ?? 'N/A'} - ${crop.maxTemp?.toStringAsFixed(1) ?? 'N/A'} °C"),
                    ),
                    ListTile(
                      title: const Text("Humidity Range"),
                      subtitle: Text(
                          "${crop.minHumidity?.toStringAsFixed(1) ?? 'N/A'} - ${crop.maxHumidity?.toStringAsFixed(1) ?? 'N/A'}%"),
                    ),
                    ListTile(
                      title: const Text("pH Value Range"),
                      subtitle: Text(
                          "${crop.minPhValue?.toStringAsFixed(1) ?? 'N/A'} - ${crop.maxPhValue?.toStringAsFixed(1) ?? 'N/A'}"),
                    ),
                    ListTile(
                      title: const Text("Nutrients"),
                      subtitle: Text(crop.nutrients),
                    ),
                    ListTile(
                      title: const Text("Fertilizers"),
                      subtitle: Text(crop.fertilizers),
                    ),
                    ListTile(
                      title: const Text("Soil Type"),
                      subtitle: Text(crop.soil),
                    ),
                    ListTile(
                      title: const Text("Sowing Months"),
                      subtitle: Text("${crop.sowingMonths} month(s)"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
