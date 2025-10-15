import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Basically this is for the individual services of the user
class ServicecolRecord extends FirestoreRecord {
  ServicecolRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "servicename" field.
  String? _servicename;
  String get servicename => _servicename ?? '';
  bool hasServicename() => _servicename != null;

  // "jd" field.
  int? _jd;
  int get jd => _jd ?? 0;
  bool hasJd() => _jd != null;

  // "service_desc" field.
  String? _serviceDesc;
  String get serviceDesc => _serviceDesc ?? '';
  bool hasServiceDesc() => _serviceDesc != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

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

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _servicename = snapshotData['servicename'] as String?;
    _jd = castToType<int>(snapshotData['jd']);
    _serviceDesc = snapshotData['service_desc'] as String?;
    _active = snapshotData['active'] as bool?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('servicecol');

  static Stream<ServicecolRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicecolRecord.fromSnapshot(s));

  static Future<ServicecolRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicecolRecord.fromSnapshot(s));

  static ServicecolRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicecolRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicecolRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicecolRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicecolRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicecolRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicecolRecordData({
  String? uid,
  String? servicename,
  int? jd,
  String? serviceDesc,
  bool? active,
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'servicename': servicename,
      'jd': jd,
      'service_desc': serviceDesc,
      'active': active,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicecolRecordDocumentEquality implements Equality<ServicecolRecord> {
  const ServicecolRecordDocumentEquality();

  @override
  bool equals(ServicecolRecord? e1, ServicecolRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.servicename == e2?.servicename &&
        e1?.jd == e2?.jd &&
        e1?.serviceDesc == e2?.serviceDesc &&
        e1?.active == e2?.active &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(ServicecolRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.servicename,
        e?.jd,
        e?.serviceDesc,
        e?.active,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicecolRecord;
}
