import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRecord extends FirestoreRecord {
  AdminRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "payout_day" field.
  String? _payoutDay;
  String get payoutDay => _payoutDay ?? '';
  bool hasPayoutDay() => _payoutDay != null;

  // "qr_expiry_minutes" field.
  int? _qrExpiryMinutes;
  int get qrExpiryMinutes => _qrExpiryMinutes ?? 0;
  bool hasQrExpiryMinutes() => _qrExpiryMinutes != null;

  // "whatsapp_support_number" field.
  String? _whatsappSupportNumber;
  String get whatsappSupportNumber => _whatsappSupportNumber ?? '';
  bool hasWhatsappSupportNumber() => _whatsappSupportNumber != null;

  // "max_loyalty_points" field.
  int? _maxLoyaltyPoints;
  int get maxLoyaltyPoints => _maxLoyaltyPoints ?? 0;
  bool hasMaxLoyaltyPoints() => _maxLoyaltyPoints != null;

  // "app_version" field.
  String? _appVersion;
  String get appVersion => _appVersion ?? '';
  bool hasAppVersion() => _appVersion != null;

  // "maintenance_mode" field.
  bool? _maintenanceMode;
  bool get maintenanceMode => _maintenanceMode ?? false;
  bool hasMaintenanceMode() => _maintenanceMode != null;

  // "transaction_fee_percent" field.
  double? _transactionFeePercent;
  double get transactionFeePercent => _transactionFeePercent ?? 0.0;
  bool hasTransactionFeePercent() => _transactionFeePercent != null;

  // "tipping_enabled" field.
  bool? _tippingEnabled;
  bool get tippingEnabled => _tippingEnabled ?? false;
  bool hasTippingEnabled() => _tippingEnabled != null;

  void _initializeFields() {
    _payoutDay = snapshotData['payout_day'] as String?;
    _qrExpiryMinutes = castToType<int>(snapshotData['qr_expiry_minutes']);
    _whatsappSupportNumber = snapshotData['whatsapp_support_number'] as String?;
    _maxLoyaltyPoints = castToType<int>(snapshotData['max_loyalty_points']);
    _appVersion = snapshotData['app_version'] as String?;
    _maintenanceMode = snapshotData['maintenance_mode'] as bool?;
    _transactionFeePercent =
        castToType<double>(snapshotData['transaction_fee_percent']);
    _tippingEnabled = snapshotData['tipping_enabled'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin');

  static Stream<AdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminRecord.fromSnapshot(s));

  static Future<AdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminRecord.fromSnapshot(s));

  static AdminRecord fromSnapshot(DocumentSnapshot snapshot) => AdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminRecordData({
  String? payoutDay,
  int? qrExpiryMinutes,
  String? whatsappSupportNumber,
  int? maxLoyaltyPoints,
  String? appVersion,
  bool? maintenanceMode,
  double? transactionFeePercent,
  bool? tippingEnabled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'payout_day': payoutDay,
      'qr_expiry_minutes': qrExpiryMinutes,
      'whatsapp_support_number': whatsappSupportNumber,
      'max_loyalty_points': maxLoyaltyPoints,
      'app_version': appVersion,
      'maintenance_mode': maintenanceMode,
      'transaction_fee_percent': transactionFeePercent,
      'tipping_enabled': tippingEnabled,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminRecordDocumentEquality implements Equality<AdminRecord> {
  const AdminRecordDocumentEquality();

  @override
  bool equals(AdminRecord? e1, AdminRecord? e2) {
    return e1?.payoutDay == e2?.payoutDay &&
        e1?.qrExpiryMinutes == e2?.qrExpiryMinutes &&
        e1?.whatsappSupportNumber == e2?.whatsappSupportNumber &&
        e1?.maxLoyaltyPoints == e2?.maxLoyaltyPoints &&
        e1?.appVersion == e2?.appVersion &&
        e1?.maintenanceMode == e2?.maintenanceMode &&
        e1?.transactionFeePercent == e2?.transactionFeePercent &&
        e1?.tippingEnabled == e2?.tippingEnabled;
  }

  @override
  int hash(AdminRecord? e) => const ListEquality().hash([
        e?.payoutDay,
        e?.qrExpiryMinutes,
        e?.whatsappSupportNumber,
        e?.maxLoyaltyPoints,
        e?.appVersion,
        e?.maintenanceMode,
        e?.transactionFeePercent,
        e?.tippingEnabled
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminRecord;
}
