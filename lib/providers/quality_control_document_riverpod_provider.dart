import 'package:flutter_riverpod/flutter_riverpod.dart';

final warehouseProvider = StateProvider<String?>((ref) => null);
final dateProvider = StateProvider<String?>((ref) => null);
final supplierProvider = StateProvider<String?>((ref) => null);
final vehicleConditionProvider = StateProvider<String?>((ref) => null);
final supplierApprovalProvider = StateProvider<bool>((ref) => false);
final temperatureMeasuredProvider = StateProvider<bool>((ref) => false);
final nameProvider = StateProvider<String>((ref) => "");
final dataProvider = StateProvider<List<dynamic>>((ref) => []);
