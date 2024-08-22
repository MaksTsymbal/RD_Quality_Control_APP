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

  const MyInheritedWidget({
    super.key,
    required this.name,
    required this.data,
    this.selectedWarehouse,
    this.selectedDate,
    this.selectedSupplier,
    this.isSupplierApprovedSelected = false,
    this.isTemperatureMeasuredSelected = false,
    this.selectedVehicleCondition,
    required super.child,
  });

  static MyInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }

  static void update(BuildContext context, {
    String? selectedWarehouse,
    String? selectedDate,
    String? selectedSupplier,
    bool? isSupplierApprovedSelected,
    bool? isTemperatureMeasuredSelected,
    String? selectedVehicleCondition,
  }) {
    final widget = MyInheritedWidget.of(context);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MyInheritedWidget(
          name: widget.name,
          data: widget.data,
          selectedWarehouse: selectedWarehouse ?? widget.selectedWarehouse,
          selectedDate: selectedDate ?? widget.selectedDate,
          selectedSupplier: selectedSupplier ?? widget.selectedSupplier,
          isSupplierApprovedSelected: isSupplierApprovedSelected ?? widget.isSupplierApprovedSelected,
          isTemperatureMeasuredSelected: isTemperatureMeasuredSelected ?? widget.isTemperatureMeasuredSelected,
          selectedVehicleCondition: selectedVehicleCondition ?? widget.selectedVehicleCondition,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return selectedWarehouse != oldWidget.selectedWarehouse ||
           selectedDate != oldWidget.selectedDate ||
           selectedSupplier != oldWidget.selectedSupplier ||
           isSupplierApprovedSelected != oldWidget.isSupplierApprovedSelected ||
           isTemperatureMeasuredSelected != oldWidget.isTemperatureMeasuredSelected ||
           selectedVehicleCondition != oldWidget.selectedVehicleCondition;
  }
}
