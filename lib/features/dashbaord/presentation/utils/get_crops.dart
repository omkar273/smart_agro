import 'dart:developer';

import 'package:smart_agro/core/get_it/service_locator.dart';
import 'package:smart_agro/core/models/crop_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<CropModel>> getCrops({
  int limit = 15,
}) async {
  try {
    List<CropModel> cropsList = [];

    final res =
        await locator<SupabaseClient>().from('crops').select().limit(limit);
    for (var element in res) {
      cropsList.add(CropModel.fromMap(element));
    }
    return cropsList;
  } catch (e) {
    log(e.toString());
  }
  return [];
}
