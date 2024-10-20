import 'dart:io';

import 'package:flutter/material.dart';

class QualityControlDocumentProvider extends ChangeNotifier {
  String? _warehouse;
  String? _date;
  String? _supplier;
  String? _vehicleCondition;
  bool _supplierApproval = false;
  bool _temperatureMeasured = false;
  String _name = "";
  List<dynamic> _data = [];
  File? photo_quality_control;
  File? photo_security_control;

  String? get warehouse => _warehouse;
  String? get date => _date;
  String? get supplier => _supplier;
  String? get vehicleCondition => _vehicleCondition;
  bool get supplierApproval => _supplierApproval;
  bool get temperatureMeasured => _temperatureMeasured;
  String get name => _name;
  List<dynamic> get data => _data;

  set warehouse(String? value) {
    _warehouse = value;
    notifyListeners();
  }

  set date(String? value) {
    _date = value;
    notifyListeners();
  }

  set supplier(String? value) {
    _supplier = value;
    notifyListeners();
  }

  set vehicleCondition(String? value) {
    _vehicleCondition = value;
    notifyListeners();
  }

  set supplierApproval(bool value) {
    _supplierApproval = value;
    notifyListeners();
  }

  set temperatureMeasured(bool value) {
    _temperatureMeasured = value;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set data(List<dynamic> value) {
    _data = value;
    notifyListeners();
  }

  void setPhotoQuality(File image) {
    photo_quality_control = image;
    notifyListeners();
  }

  void setPhotoSecurity(File image) {
    photo_security_control = image;
    notifyListeners();
  }

  void clearAllData() {
    _warehouse = null;
    _date = null;
    _supplier = null;
    _vehicleCondition = null;
    _supplierApproval = false;
    _temperatureMeasured = false;
    _name = "";
    _data = [];
    photo_quality_control = null;
    photo_security_control = null;
    notifyListeners();
  }
}
