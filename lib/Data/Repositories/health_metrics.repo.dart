//t2 Core Packages Imports
//t2 Dependencies Imports
//t3 Services
//t3 Models
import 'package:air_medical_station/Data/Model/Health%20Metrics/health_metrics.model.dart';

import '../../core/Providers/FB RTDB/fbrtdb_repo.dart';

//t1 Exports

class HealthMetricsRepo extends RTDBRepo<HealthMetrics> {
  HealthMetricsRepo()
      : super(
    path: 'healthMetrics',
    discardKey: true,
  );

  @override
  HealthMetrics? toModel(Object? data) {
    return HealthMetrics.fromMap((data as Map<Object?, Object?>?)
        ?.map((key, value) => MapEntry(key.toString(), value)) ??
        {});
  }

  @override
  Map<String, dynamic>? fromModel(HealthMetrics? item) =>
      item?.toMap() ?? {};
}
