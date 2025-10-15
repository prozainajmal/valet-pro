import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "from_user" field.
  DocumentReference? _fromUser;
  DocumentReference? get fromUser => _fromUser;
  bool hasFromUser() => _fromUser != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "review_id" field.
  String? _reviewId;
  String get reviewId => _reviewId ?? '';
  bool hasReviewId() => _reviewId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "to_agent" field.
  DocumentReference? _toAgent;
  DocumentReference? get toAgent => _toAgent;
  bool hasToAgent() => _toAgent != null;

  // "to_company" field.
  DocumentReference? _toCompany;
  DocumentReference? get toCompany => _toCompany;
  bool hasToCompany() => _toCompany != null;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _fromUser = snapshotData['from_user'] as DocumentReference?;
    _rating = castToType<double>(snapshotData['rating']);
    _reviewId = snapshotData['review_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _toAgent = snapshotData['to_agent'] as DocumentReference?;
    _toCompany = snapshotData['to_company'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  String? comment,
  DocumentReference? fromUser,
  double? rating,
  String? reviewId,
  DateTime? timestamp,
  DocumentReference? toAgent,
  DocumentReference? toCompany,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'from_user': fromUser,
      'rating': rating,
      'review_id': reviewId,
      'timestamp': timestamp,
      'to_agent': toAgent,
      'to_company': toCompany,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.comment == e2?.comment &&
        e1?.fromUser == e2?.fromUser &&
        e1?.rating == e2?.rating &&
        e1?.reviewId == e2?.reviewId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.toAgent == e2?.toAgent &&
        e1?.toCompany == e2?.toCompany;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.comment,
        e?.fromUser,
        e?.rating,
        e?.reviewId,
        e?.timestamp,
        e?.toAgent,
        e?.toCompany
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
