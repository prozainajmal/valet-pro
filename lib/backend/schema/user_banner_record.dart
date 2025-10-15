import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBannerRecord extends FirestoreRecord {
  UserBannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userBanner');

  static Stream<UserBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBannerRecord.fromSnapshot(s));

  static Future<UserBannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserBannerRecord.fromSnapshot(s));

  static UserBannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBannerRecordData({
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserBannerRecordDocumentEquality implements Equality<UserBannerRecord> {
  const UserBannerRecordDocumentEquality();

  @override
  bool equals(UserBannerRecord? e1, UserBannerRecord? e2) {
    return e1?.image == e2?.image;
  }

  @override
  int hash(UserBannerRecord? e) => const ListEquality().hash([e?.image]);

  @override
  bool isValidKey(Object? o) => o is UserBannerRecord;
}
