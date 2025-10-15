import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "last_active" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "wallet_balance" field.
  double? _walletBalance;
  double get walletBalance => _walletBalance ?? 0.0;
  bool hasWalletBalance() => _walletBalance != null;

  // "loyalty_points" field.
  int? _loyaltyPoints;
  int get loyaltyPoints => _loyaltyPoints ?? 0;
  bool hasLoyaltyPoints() => _loyaltyPoints != null;

  // "preferred_payment" field.
  String? _preferredPayment;
  String get preferredPayment => _preferredPayment ?? '';
  bool hasPreferredPayment() => _preferredPayment != null;

  // "referred_by" field.
  String? _referredBy;
  String get referredBy => _referredBy ?? '';
  bool hasReferredBy() => _referredBy != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "company_id" field.
  DocumentReference? _companyId;
  DocumentReference? get companyId => _companyId;
  bool hasCompanyId() => _companyId != null;

  // "agent_id" field.
  DocumentReference? _agentId;
  DocumentReference? get agentId => _agentId;
  bool hasAgentId() => _agentId != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _fullName = snapshotData['full_name'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _lastActive = snapshotData['last_active'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _walletBalance = castToType<double>(snapshotData['wallet_balance']);
    _loyaltyPoints = castToType<int>(snapshotData['loyalty_points']);
    _preferredPayment = snapshotData['preferred_payment'] as String?;
    _referredBy = snapshotData['referred_by'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _companyId = snapshotData['company_id'] as DocumentReference?;
    _agentId = snapshotData['agent_id'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? uid,
  String? fullName,
  String? email,
  String? phoneNumber,
  DateTime? createdTime,
  DateTime? lastActive,
  String? status,
  double? walletBalance,
  int? loyaltyPoints,
  String? preferredPayment,
  String? referredBy,
  String? photoUrl,
  DocumentReference? companyId,
  DocumentReference? agentId,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'last_active': lastActive,
      'status': status,
      'wallet_balance': walletBalance,
      'loyalty_points': loyaltyPoints,
      'preferred_payment': preferredPayment,
      'referred_by': referredBy,
      'photo_url': photoUrl,
      'company_id': companyId,
      'agent_id': agentId,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.fullName == e2?.fullName &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.lastActive == e2?.lastActive &&
        e1?.status == e2?.status &&
        e1?.walletBalance == e2?.walletBalance &&
        e1?.loyaltyPoints == e2?.loyaltyPoints &&
        e1?.preferredPayment == e2?.preferredPayment &&
        e1?.referredBy == e2?.referredBy &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.companyId == e2?.companyId &&
        e1?.agentId == e2?.agentId &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.fullName,
        e?.email,
        e?.phoneNumber,
        e?.createdTime,
        e?.lastActive,
        e?.status,
        e?.walletBalance,
        e?.loyaltyPoints,
        e?.preferredPayment,
        e?.referredBy,
        e?.photoUrl,
        e?.companyId,
        e?.agentId,
        e?.displayName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
