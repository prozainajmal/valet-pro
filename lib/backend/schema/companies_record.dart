import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "assigned_agents" field.
  DocumentReference? _assignedAgents;
  DocumentReference? get assignedAgents => _assignedAgents;
  bool hasAssignedAgents() => _assignedAgents != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "contact_person" field.
  String? _contactPerson;
  String get contactPerson => _contactPerson ?? '';
  bool hasContactPerson() => _contactPerson != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "payment_plan" field.
  String? _paymentPlan;
  String get paymentPlan => _paymentPlan ?? '';
  bool hasPaymentPlan() => _paymentPlan != null;

  // "registered_date" field.
  DateTime? _registeredDate;
  DateTime? get registeredDate => _registeredDate;
  bool hasRegisteredDate() => _registeredDate != null;

  // "subscription_status" field.
  String? _subscriptionStatus;
  String get subscriptionStatus => _subscriptionStatus ?? '';
  bool hasSubscriptionStatus() => _subscriptionStatus != null;

  // "wallet_balance" field.
  double? _walletBalance;
  double get walletBalance => _walletBalance ?? 0.0;
  bool hasWalletBalance() => _walletBalance != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "address_line" field.
  String? _addressLine;
  String get addressLine => _addressLine ?? '';
  bool hasAddressLine() => _addressLine != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "tip_distribution_agent_pct" field.
  double? _tipDistributionAgentPct;
  double get tipDistributionAgentPct => _tipDistributionAgentPct ?? 0.0;
  bool hasTipDistributionAgentPct() => _tipDistributionAgentPct != null;

  // "tip_distribution_company_pct" field.
  double? _tipDistributionCompanyPct;
  double get tipDistributionCompanyPct => _tipDistributionCompanyPct ?? 0.0;
  bool hasTipDistributionCompanyPct() => _tipDistributionCompanyPct != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "company_type" field.
  String? _companyType;
  String get companyType => _companyType ?? '';
  bool hasCompanyType() => _companyType != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _assignedAgents = snapshotData['assigned_agents'] as DocumentReference?;
    _companyId = snapshotData['company_id'] as String?;
    _contactPerson = snapshotData['contact_person'] as String?;
    _email = snapshotData['email'] as String?;
    _paymentPlan = snapshotData['payment_plan'] as String?;
    _registeredDate = snapshotData['registered_date'] as DateTime?;
    _subscriptionStatus = snapshotData['subscription_status'] as String?;
    _walletBalance = castToType<double>(snapshotData['wallet_balance']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _addressLine = snapshotData['address_line'] as String?;
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
    _tipDistributionAgentPct =
        castToType<double>(snapshotData['tip_distribution_agent_pct']);
    _tipDistributionCompanyPct =
        castToType<double>(snapshotData['tip_distribution_company_pct']);
    _status = snapshotData['status'] as String?;
    _companyType = snapshotData['company_type'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  DocumentReference? assignedAgents,
  String? companyId,
  String? contactPerson,
  String? email,
  String? paymentPlan,
  DateTime? registeredDate,
  String? subscriptionStatus,
  double? walletBalance,
  String? phoneNumber,
  String? addressLine,
  String? city,
  String? country,
  double? tipDistributionAgentPct,
  double? tipDistributionCompanyPct,
  String? status,
  String? companyType,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'assigned_agents': assignedAgents,
      'company_id': companyId,
      'contact_person': contactPerson,
      'email': email,
      'payment_plan': paymentPlan,
      'registered_date': registeredDate,
      'subscription_status': subscriptionStatus,
      'wallet_balance': walletBalance,
      'phone_number': phoneNumber,
      'address_line': addressLine,
      'city': city,
      'country': country,
      'tip_distribution_agent_pct': tipDistributionAgentPct,
      'tip_distribution_company_pct': tipDistributionCompanyPct,
      'status': status,
      'company_type': companyType,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesRecordDocumentEquality implements Equality<CompaniesRecord> {
  const CompaniesRecordDocumentEquality();

  @override
  bool equals(CompaniesRecord? e1, CompaniesRecord? e2) {
    return e1?.assignedAgents == e2?.assignedAgents &&
        e1?.companyId == e2?.companyId &&
        e1?.contactPerson == e2?.contactPerson &&
        e1?.email == e2?.email &&
        e1?.paymentPlan == e2?.paymentPlan &&
        e1?.registeredDate == e2?.registeredDate &&
        e1?.subscriptionStatus == e2?.subscriptionStatus &&
        e1?.walletBalance == e2?.walletBalance &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.addressLine == e2?.addressLine &&
        e1?.city == e2?.city &&
        e1?.country == e2?.country &&
        e1?.tipDistributionAgentPct == e2?.tipDistributionAgentPct &&
        e1?.tipDistributionCompanyPct == e2?.tipDistributionCompanyPct &&
        e1?.status == e2?.status &&
        e1?.companyType == e2?.companyType &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(CompaniesRecord? e) => const ListEquality().hash([
        e?.assignedAgents,
        e?.companyId,
        e?.contactPerson,
        e?.email,
        e?.paymentPlan,
        e?.registeredDate,
        e?.subscriptionStatus,
        e?.walletBalance,
        e?.phoneNumber,
        e?.addressLine,
        e?.city,
        e?.country,
        e?.tipDistributionAgentPct,
        e?.tipDistributionCompanyPct,
        e?.status,
        e?.companyType,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesRecord;
}
