import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExtraServicesRecord extends FirestoreRecord {
  ExtraServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "company_id" field.
  DocumentReference? _companyId;
  DocumentReference? get companyId => _companyId;
  bool hasCompanyId() => _companyId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "extra_service_name" field.
  String? _extraServiceName;
  String get extraServiceName => _extraServiceName ?? '';
  bool hasExtraServiceName() => _extraServiceName != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _active = snapshotData['active'] as bool?;
    _companyId = snapshotData['company_id'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _extraServiceName = snapshotData['extra_service_name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('extra_services');

  static Stream<ExtraServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExtraServicesRecord.fromSnapshot(s));

  static Future<ExtraServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExtraServicesRecord.fromSnapshot(s));

  static ExtraServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExtraServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExtraServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExtraServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExtraServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExtraServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExtraServicesRecordData({
  bool? active,
  DocumentReference? companyId,
  String? description,
  String? extraServiceName,
  double? price,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'active': active,
      'company_id': companyId,
      'description': description,
      'extra_service_name': extraServiceName,
      'price': price,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExtraServicesRecordDocumentEquality
    implements Equality<ExtraServicesRecord> {
  const ExtraServicesRecordDocumentEquality();

  @override
  bool equals(ExtraServicesRecord? e1, ExtraServicesRecord? e2) {
    return e1?.active == e2?.active &&
        e1?.companyId == e2?.companyId &&
        e1?.description == e2?.description &&
        e1?.extraServiceName == e2?.extraServiceName &&
        e1?.price == e2?.price &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(ExtraServicesRecord? e) => const ListEquality().hash([
        e?.active,
        e?.companyId,
        e?.description,
        e?.extraServiceName,
        e?.price,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is ExtraServicesRecord;
}
