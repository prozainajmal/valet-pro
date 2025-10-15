import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _totaljd = prefs.getDouble('ff_totaljd') ?? _totaljd;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _activeNavIndex = 0;
  int get activeNavIndex => _activeNavIndex;
  set activeNavIndex(int value) {
    _activeNavIndex = value;
  }

  DocumentReference? _currentCompanyRef =
      FirebaseFirestore.instance.doc('/companies/vXK39fwG86ec36vV1sAc');
  DocumentReference? get currentCompanyRef => _currentCompanyRef;
  set currentCompanyRef(DocumentReference? value) {
    _currentCompanyRef = value;
  }

  double _baseServicePrice = 0.0;
  double get baseServicePrice => _baseServicePrice;
  set baseServicePrice(double value) {
    _baseServicePrice = value;
  }

  List<String> _selectedExtraIds = [];
  List<String> get selectedExtraIds => _selectedExtraIds;
  set selectedExtraIds(List<String> value) {
    _selectedExtraIds = value;
  }

  void addToSelectedExtraIds(String value) {
    selectedExtraIds.add(value);
  }

  void removeFromSelectedExtraIds(String value) {
    selectedExtraIds.remove(value);
  }

  void removeAtIndexFromSelectedExtraIds(int index) {
    selectedExtraIds.removeAt(index);
  }

  void updateSelectedExtraIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedExtraIds[index] = updateFn(_selectedExtraIds[index]);
  }

  void insertAtIndexInSelectedExtraIds(int index, String value) {
    selectedExtraIds.insert(index, value);
  }

  List<String> _selectedUpsellIds = [];
  List<String> get selectedUpsellIds => _selectedUpsellIds;
  set selectedUpsellIds(List<String> value) {
    _selectedUpsellIds = value;
  }

  void addToSelectedUpsellIds(String value) {
    selectedUpsellIds.add(value);
  }

  void removeFromSelectedUpsellIds(String value) {
    selectedUpsellIds.remove(value);
  }

  void removeAtIndexFromSelectedUpsellIds(int index) {
    selectedUpsellIds.removeAt(index);
  }

  void updateSelectedUpsellIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedUpsellIds[index] = updateFn(_selectedUpsellIds[index]);
  }

  void insertAtIndexInSelectedUpsellIds(int index, String value) {
    selectedUpsellIds.insert(index, value);
  }

  double _extrasTotal = 0.0;
  double get extrasTotal => _extrasTotal;
  set extrasTotal(double value) {
    _extrasTotal = value;
  }

  double _upsellsTotal = 0.0;
  double get upsellsTotal => _upsellsTotal;
  set upsellsTotal(double value) {
    _upsellsTotal = value;
  }

  bool _tipAllowCustom = false;
  bool get tipAllowCustom => _tipAllowCustom;
  set tipAllowCustom(bool value) {
    _tipAllowCustom = value;
  }

  double _tipFixedJD = 2.0;
  double get tipFixedJD => _tipFixedJD;
  set tipFixedJD(double value) {
    _tipFixedJD = value;
  }

  bool _tipModeCustom = false;
  bool get tipModeCustom => _tipModeCustom;
  set tipModeCustom(bool value) {
    _tipModeCustom = value;
  }

  double _tipCustomJD = 0.0;
  double get tipCustomJD => _tipCustomJD;
  set tipCustomJD(double value) {
    _tipCustomJD = value;
  }

  String _svcName = '';
  String get svcName => _svcName;
  set svcName(String value) {
    _svcName = value;
  }

  double _svcPrice = 0.0;
  double get svcPrice => _svcPrice;
  set svcPrice(double value) {
    _svcPrice = value;
  }

  String _svcDesc = '';
  String get svcDesc => _svcDesc;
  set svcDesc(String value) {
    _svcDesc = value;
  }

  bool _svcActive = true;
  bool get svcActive => _svcActive;
  set svcActive(bool value) {
    _svcActive = value;
  }

  List<String> _svcType = ['Extra', 'Upsell'];
  List<String> get svcType => _svcType;
  set svcType(List<String> value) {
    _svcType = value;
  }

  void addToSvcType(String value) {
    svcType.add(value);
  }

  void removeFromSvcType(String value) {
    svcType.remove(value);
  }

  void removeAtIndexFromSvcType(int index) {
    svcType.removeAt(index);
  }

  void updateSvcTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    svcType[index] = updateFn(_svcType[index]);
  }

  void insertAtIndexInSvcType(int index, String value) {
    svcType.insert(index, value);
  }

  double _totaljd = 0.0;
  double get totaljd => _totaljd;
  set totaljd(double value) {
    _totaljd = value;
    prefs.setDouble('ff_totaljd', value);
  }

  double _totaljdamount = 0.0;
  double get totaljdamount => _totaljdamount;
  set totaljdamount(double value) {
    _totaljdamount = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
