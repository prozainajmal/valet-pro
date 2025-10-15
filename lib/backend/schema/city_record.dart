import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityRecord extends FirestoreRecord {
  CityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  void _initializeFields() {
    _isActive = snapshotData['is_active'] as bool?;
    _name = snapshotData['name'] as String?;
    _region = snapshotData['region'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('city');

  static Stream<CityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CityRecord.fromSnapshot(s));

  static Future<CityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CityRecord.fromSnapshot(s));

  static CityRecord fromSnapshot(DocumentSnapshot snapshot) => CityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCityRecordData({
  bool? isActive,
  String? name,
  String? region,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_active': isActive,
      'name': name,
      'region': region,
    }.withoutNulls,
  );

  return firestoreData;
}

class CityRecordDocumentEquality implements Equality<CityRecord> {
  const CityRecordDocumentEquality();

  @override
  bool equals(CityRecord? e1, CityRecord? e2) {
    return e1?.isActive == e2?.isActive &&
        e1?.name == e2?.name &&
        e1?.region == e2?.region;
  }

  @override
  int hash(CityRecord? e) =>
      const ListEquality().hash([e?.isActive, e?.name, e?.region]);

  @override
  bool isValidKey(Object? o) => o is CityRecord;
}
