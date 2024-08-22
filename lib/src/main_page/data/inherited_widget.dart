import 'package:flutter/material.dart';
import 'package:check_point/src/main_page/data/info_model.dart';

class MyInheritedWidget extends InheritedWidget {
  final String name;
  final List<InfoModel> data;
  final String? selectedWarehouse;
  final String? selectedDate;
  final String? selectedSupplier;
  final bool isSupplierApprovedSelected;
  final bool isTemperatureMeasuredSelected;
  final String? selectedVehicleCondition;
  final Function({
    String? selectedWarehouse,
    String? selectedDate,
    String? selectedSupplier,
    bool? isSupplierApprovedSelected,
    bool? isTemperatureMeasuredSelected,
    String? selectedVehicleCondition,
  }) updateState;

  const MyInheritedWidget({
    Key? key,
    required this.name,
    required this.data,
    this.selectedWarehouse,
    this.selectedDate,
    this.selectedSupplier,
    this.isSupplierApprovedSelected = false,
    this.isTemperatureMeasuredSelected = false,
    this.selectedVehicleCondition,
    required this.updateState,
    required Widget child,
  }) : super(key: key, child: child);

  static MyInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return selectedWarehouse != oldWidget.selectedWarehouse ||
        selectedDate != oldWidget.selectedDate ||
        selectedSupplier != oldWidget.selectedSupplier ||
        isSupplierApprovedSelected != oldWidget.isSupplierApprovedSelected ||
        isTemperatureMeasuredSelected !=
            oldWidget.isTemperatureMeasuredSelected ||
        selectedVehicleCondition != oldWidget.selectedVehicleCondition;
  }
}
