import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "agent_id" field.
  DocumentReference? _agentId;
  DocumentReference? get agentId => _agentId;
  bool hasAgentId() => _agentId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "car_plate_number" field.
  String? _carPlateNumber;
  String get carPlateNumber => _carPlateNumber ?? '';
  bool hasCarPlateNumber() => _carPlateNumber != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "qr_code_used" field.
  bool? _qrCodeUsed;
  bool get qrCodeUsed => _qrCodeUsed ?? false;
  bool hasQrCodeUsed() => _qrCodeUsed != null;

  // "review_given" field.
  bool? _reviewGiven;
  bool get reviewGiven => _reviewGiven ?? false;
  bool hasReviewGiven() => _reviewGiven != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "company_id" field.
  DocumentReference? _companyId;
  DocumentReference? get companyId => _companyId;
  bool hasCompanyId() => _companyId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "tip_amount" field.
  double? _tipAmount;
  double get tipAmount => _tipAmount ?? 0.0;
  bool hasTipAmount() => _tipAmount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "car_photo_url" field.
  String? _carPhotoUrl;
  String get carPhotoUrl => _carPhotoUrl ?? '';
  bool hasCarPhotoUrl() => _carPhotoUrl != null;

  // "payout_status" field.
  String? _payoutStatus;

  /// pending, paid
  String get payoutStatus => _payoutStatus ?? '';
  bool hasPayoutStatus() => _payoutStatus != null;

  // "paid_at" field.
  DateTime? _paidAt;
  DateTime? get paidAt => _paidAt;
  bool hasPaidAt() => _paidAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _agentId = snapshotData['agent_id'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _carPlateNumber = snapshotData['car_plate_number'] as String?;
    _paymentMethod = snapshotData['payment_method'] as String?;
    _qrCodeUsed = snapshotData['qr_code_used'] as bool?;
    _reviewGiven = snapshotData['review_given'] as bool?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _companyId = snapshotData['company_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _tipAmount = castToType<double>(snapshotData['tip_amount']);
    _currency = snapshotData['currency'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _carPhotoUrl = snapshotData['car_photo_url'] as String?;
    _payoutStatus = snapshotData['payout_status'] as String?;
    _paidAt = snapshotData['paid_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference? agentId,
  double? amount,
  String? carPlateNumber,
  String? paymentMethod,
  bool? qrCodeUsed,
  bool? reviewGiven,
  DateTime? timestamp,
  DocumentReference? companyId,
  DocumentReference? userId,
  double? tipAmount,
  String? currency,
  LatLng? location,
  String? carPhotoUrl,
  String? payoutStatus,
  DateTime? paidAt,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'agent_id': agentId,
      'amount': amount,
      'car_plate_number': carPlateNumber,
      'payment_method': paymentMethod,
      'qr_code_used': qrCodeUsed,
      'review_given': reviewGiven,
      'timestamp': timestamp,
      'company_id': companyId,
      'user_id': userId,
      'tip_amount': tipAmount,
      'currency': currency,
      'location': location,
      'car_photo_url': carPhotoUrl,
      'payout_status': payoutStatus,
      'paid_at': paidAt,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.agentId == e2?.agentId &&
        e1?.amount == e2?.amount &&
        e1?.carPlateNumber == e2?.carPlateNumber &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.qrCodeUsed == e2?.qrCodeUsed &&
        e1?.reviewGiven == e2?.reviewGiven &&
        e1?.timestamp == e2?.timestamp &&
        e1?.companyId == e2?.companyId &&
        e1?.userId == e2?.userId &&
        e1?.tipAmount == e2?.tipAmount &&
        e1?.currency == e2?.currency &&
        e1?.location == e2?.location &&
        e1?.carPhotoUrl == e2?.carPhotoUrl &&
        e1?.payoutStatus == e2?.payoutStatus &&
        e1?.paidAt == e2?.paidAt &&
        e1?.status == e2?.status;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.agentId,
        e?.amount,
        e?.carPlateNumber,
        e?.paymentMethod,
        e?.qrCodeUsed,
        e?.reviewGiven,
        e?.timestamp,
        e?.companyId,
        e?.userId,
        e?.tipAmount,
        e?.currency,
        e?.location,
        e?.carPhotoUrl,
        e?.payoutStatus,
        e?.paidAt,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
