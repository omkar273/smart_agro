import 'dart:developer';

import 'package:smart_agro/core/get_it/service_locator.dart';
import 'package:smart_agro/core/models/farm_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<FarmModel>> getfarms({
  int limit = 15,
}) async {
  try {
    List<FarmModel> farmList = [];

    log('inside get farms');
    final String? userId = locator<SupabaseClient>().auth.currentUser?.id;
    if (userId == null) {
      return [];
    }
    log(userId);
    final res = await locator<SupabaseClient>()
        .from('farms')
        .select('*')
        .eq('ownerId', userId)
        .limit(limit);

    for (var element in res) {
      farmList.add(FarmModel.fromMap(element));
    }
    return farmList;
  } catch (e) {
    log(e.toString());
  }
  return [];
}
