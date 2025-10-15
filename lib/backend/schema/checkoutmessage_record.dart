import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckoutmessageRecord extends FirestoreRecord {
  CheckoutmessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "checkoutmessage" field.
  String? _checkoutmessage;
  String get checkoutmessage => _checkoutmessage ?? '';
  bool hasCheckoutmessage() => _checkoutmessage != null;

  void _initializeFields() {
    _checkoutmessage = snapshotData['checkoutmessage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checkoutmessage');

  static Stream<CheckoutmessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckoutmessageRecord.fromSnapshot(s));

  static Future<CheckoutmessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckoutmessageRecord.fromSnapshot(s));

  static CheckoutmessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckoutmessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckoutmessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckoutmessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckoutmessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckoutmessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckoutmessageRecordData({
  String? checkoutmessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'checkoutmessage': checkoutmessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckoutmessageRecordDocumentEquality
    implements Equality<CheckoutmessageRecord> {
  const CheckoutmessageRecordDocumentEquality();

  @override
  bool equals(CheckoutmessageRecord? e1, CheckoutmessageRecord? e2) {
    return e1?.checkoutmessage == e2?.checkoutmessage;
  }

  @override
  int hash(CheckoutmessageRecord? e) =>
      const ListEquality().hash([e?.checkoutmessage]);

  @override
  bool isValidKey(Object? o) => o is CheckoutmessageRecord;
}
