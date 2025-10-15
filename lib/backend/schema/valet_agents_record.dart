import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ValetAgentsRecord extends FirestoreRecord {
  ValetAgentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "agent_id" field.
  String? _agentId;
  String get agentId => _agentId ?? '';
  bool hasAgentId() => _agentId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "location_city" field.
  String? _locationCity;
  String get locationCity => _locationCity ?? '';
  bool hasLocationCity() => _locationCity != null;

  // "qr_code_url" field.
  String? _qrCodeUrl;
  String get qrCodeUrl => _qrCodeUrl ?? '';
  bool hasQrCodeUrl() => _qrCodeUrl != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "total_tips" field.
  double? _totalTips;
  double get totalTips => _totalTips ?? 0.0;
  bool hasTotalTips() => _totalTips != null;

  // "earnings_total" field.
  double? _earningsTotal;
  double get earningsTotal => _earningsTotal ?? 0.0;
  bool hasEarningsTotal() => _earningsTotal != null;

  // "completed_jobs" field.
  int? _completedJobs;
  int get completedJobs => _completedJobs ?? 0;
  bool hasCompletedJobs() => _completedJobs != null;

  // "profile_photo" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  // "verification_license_url" field.
  String? _verificationLicenseUrl;
  String get verificationLicenseUrl => _verificationLicenseUrl ?? '';
  bool hasVerificationLicenseUrl() => _verificationLicenseUrl != null;

  // "verification_passport_url" field.
  String? _verificationPassportUrl;
  String get verificationPassportUrl => _verificationPassportUrl ?? '';
  bool hasVerificationPassportUrl() => _verificationPassportUrl != null;

  // "verification_work_permit_url" field.
  String? _verificationWorkPermitUrl;
  String get verificationWorkPermitUrl => _verificationWorkPermitUrl ?? '';
  bool hasVerificationWorkPermitUrl() => _verificationWorkPermitUrl != null;

  // "verification_status" field.
  bool? _verificationStatus;
  bool get verificationStatus => _verificationStatus ?? false;
  bool hasVerificationStatus() => _verificationStatus != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "shift_day_1" field.
  String? _shiftDay1;
  String get shiftDay1 => _shiftDay1 ?? '';
  bool hasShiftDay1() => _shiftDay1 != null;

  // "shift_start_time_1" field.
  DateTime? _shiftStartTime1;
  DateTime? get shiftStartTime1 => _shiftStartTime1;
  bool hasShiftStartTime1() => _shiftStartTime1 != null;

  // "shift_end_time_1" field.
  DateTime? _shiftEndTime1;
  DateTime? get shiftEndTime1 => _shiftEndTime1;
  bool hasShiftEndTime1() => _shiftEndTime1 != null;

  // "shift_location_1" field.
  String? _shiftLocation1;
  String get shiftLocation1 => _shiftLocation1 ?? '';
  bool hasShiftLocation1() => _shiftLocation1 != null;

  // "shift_day_2" field.
  String? _shiftDay2;
  String get shiftDay2 => _shiftDay2 ?? '';
  bool hasShiftDay2() => _shiftDay2 != null;

  // "shift_start_time_2" field.
  DateTime? _shiftStartTime2;
  DateTime? get shiftStartTime2 => _shiftStartTime2;
  bool hasShiftStartTime2() => _shiftStartTime2 != null;

  // "shift_end_time_2" field.
  DateTime? _shiftEndTime2;
  DateTime? get shiftEndTime2 => _shiftEndTime2;
  bool hasShiftEndTime2() => _shiftEndTime2 != null;

  // "shift_location_2" field.
  String? _shiftLocation2;
  String get shiftLocation2 => _shiftLocation2 ?? '';
  bool hasShiftLocation2() => _shiftLocation2 != null;

  // "shift_day_3" field.
  String? _shiftDay3;
  String get shiftDay3 => _shiftDay3 ?? '';
  bool hasShiftDay3() => _shiftDay3 != null;

  // "shift_start_time_3" field.
  DateTime? _shiftStartTime3;
  DateTime? get shiftStartTime3 => _shiftStartTime3;
  bool hasShiftStartTime3() => _shiftStartTime3 != null;

  // "shift_end_time_3" field.
  DateTime? _shiftEndTime3;
  DateTime? get shiftEndTime3 => _shiftEndTime3;
  bool hasShiftEndTime3() => _shiftEndTime3 != null;

  // "shift_location_3" field.
  String? _shiftLocation3;
  String get shiftLocation3 => _shiftLocation3 ?? '';
  bool hasShiftLocation3() => _shiftLocation3 != null;

  // "shift_day_4" field.
  String? _shiftDay4;
  String get shiftDay4 => _shiftDay4 ?? '';
  bool hasShiftDay4() => _shiftDay4 != null;

  // "shift_start_time_4" field.
  DateTime? _shiftStartTime4;
  DateTime? get shiftStartTime4 => _shiftStartTime4;
  bool hasShiftStartTime4() => _shiftStartTime4 != null;

  // "shift_end_time_4" field.
  DateTime? _shiftEndTime4;
  DateTime? get shiftEndTime4 => _shiftEndTime4;
  bool hasShiftEndTime4() => _shiftEndTime4 != null;

  // "shift_location_4" field.
  String? _shiftLocation4;
  String get shiftLocation4 => _shiftLocation4 ?? '';
  bool hasShiftLocation4() => _shiftLocation4 != null;

  // "shift_day_5" field.
  String? _shiftDay5;
  String get shiftDay5 => _shiftDay5 ?? '';
  bool hasShiftDay5() => _shiftDay5 != null;

  // "shift_start_time_5" field.
  DateTime? _shiftStartTime5;
  DateTime? get shiftStartTime5 => _shiftStartTime5;
  bool hasShiftStartTime5() => _shiftStartTime5 != null;

  // "shift_end_time_5" field.
  DateTime? _shiftEndTime5;
  DateTime? get shiftEndTime5 => _shiftEndTime5;
  bool hasShiftEndTime5() => _shiftEndTime5 != null;

  // "shift_location_5" field.
  String? _shiftLocation5;
  String get shiftLocation5 => _shiftLocation5 ?? '';
  bool hasShiftLocation5() => _shiftLocation5 != null;

  // "shift_day_6" field.
  String? _shiftDay6;
  String get shiftDay6 => _shiftDay6 ?? '';
  bool hasShiftDay6() => _shiftDay6 != null;

  // "shift_start_time_6" field.
  DateTime? _shiftStartTime6;
  DateTime? get shiftStartTime6 => _shiftStartTime6;
  bool hasShiftStartTime6() => _shiftStartTime6 != null;

  // "shift_end_time_6" field.
  DateTime? _shiftEndTime6;
  DateTime? get shiftEndTime6 => _shiftEndTime6;
  bool hasShiftEndTime6() => _shiftEndTime6 != null;

  // "shift_location_6" field.
  String? _shiftLocation6;
  String get shiftLocation6 => _shiftLocation6 ?? '';
  bool hasShiftLocation6() => _shiftLocation6 != null;

  // "shift_day_7" field.
  String? _shiftDay7;
  String get shiftDay7 => _shiftDay7 ?? '';
  bool hasShiftDay7() => _shiftDay7 != null;

  // "shift_start_time_7" field.
  DateTime? _shiftStartTime7;
  DateTime? get shiftStartTime7 => _shiftStartTime7;
  bool hasShiftStartTime7() => _shiftStartTime7 != null;

  // "shift_end_time_7" field.
  DateTime? _shiftEndTime7;
  DateTime? get shiftEndTime7 => _shiftEndTime7;
  bool hasShiftEndTime7() => _shiftEndTime7 != null;

  // "shift_location_7" field.
  String? _shiftLocation7;
  String get shiftLocation7 => _shiftLocation7 ?? '';
  bool hasShiftLocation7() => _shiftLocation7 != null;

  // "assigned_company" field.
  DocumentReference? _assignedCompany;
  DocumentReference? get assignedCompany => _assignedCompany;
  bool hasAssignedCompany() => _assignedCompany != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _agentId = snapshotData['agent_id'] as String?;
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _locationCity = snapshotData['location_city'] as String?;
    _qrCodeUrl = snapshotData['qr_code_url'] as String?;
    _status = snapshotData['status'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _totalTips = castToType<double>(snapshotData['total_tips']);
    _earningsTotal = castToType<double>(snapshotData['earnings_total']);
    _completedJobs = castToType<int>(snapshotData['completed_jobs']);
    _profilePhoto = snapshotData['profile_photo'] as String?;
    _verificationLicenseUrl =
        snapshotData['verification_license_url'] as String?;
    _verificationPassportUrl =
        snapshotData['verification_passport_url'] as String?;
    _verificationWorkPermitUrl =
        snapshotData['verification_work_permit_url'] as String?;
    _verificationStatus = snapshotData['verification_status'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _shiftDay1 = snapshotData['shift_day_1'] as String?;
    _shiftStartTime1 = snapshotData['shift_start_time_1'] as DateTime?;
    _shiftEndTime1 = snapshotData['shift_end_time_1'] as DateTime?;
    _shiftLocation1 = snapshotData['shift_location_1'] as String?;
    _shiftDay2 = snapshotData['shift_day_2'] as String?;
    _shiftStartTime2 = snapshotData['shift_start_time_2'] as DateTime?;
    _shiftEndTime2 = snapshotData['shift_end_time_2'] as DateTime?;
    _shiftLocation2 = snapshotData['shift_location_2'] as String?;
    _shiftDay3 = snapshotData['shift_day_3'] as String?;
    _shiftStartTime3 = snapshotData['shift_start_time_3'] as DateTime?;
    _shiftEndTime3 = snapshotData['shift_end_time_3'] as DateTime?;
    _shiftLocation3 = snapshotData['shift_location_3'] as String?;
    _shiftDay4 = snapshotData['shift_day_4'] as String?;
    _shiftStartTime4 = snapshotData['shift_start_time_4'] as DateTime?;
    _shiftEndTime4 = snapshotData['shift_end_time_4'] as DateTime?;
    _shiftLocation4 = snapshotData['shift_location_4'] as String?;
    _shiftDay5 = snapshotData['shift_day_5'] as String?;
    _shiftStartTime5 = snapshotData['shift_start_time_5'] as DateTime?;
    _shiftEndTime5 = snapshotData['shift_end_time_5'] as DateTime?;
    _shiftLocation5 = snapshotData['shift_location_5'] as String?;
    _shiftDay6 = snapshotData['shift_day_6'] as String?;
    _shiftStartTime6 = snapshotData['shift_start_time_6'] as DateTime?;
    _shiftEndTime6 = snapshotData['shift_end_time_6'] as DateTime?;
    _shiftLocation6 = snapshotData['shift_location_6'] as String?;
    _shiftDay7 = snapshotData['shift_day_7'] as String?;
    _shiftStartTime7 = snapshotData['shift_start_time_7'] as DateTime?;
    _shiftEndTime7 = snapshotData['shift_end_time_7'] as DateTime?;
    _shiftLocation7 = snapshotData['shift_location_7'] as String?;
    _assignedCompany = snapshotData['assigned_company'] as DocumentReference?;
    _isActive = snapshotData['is_active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('valet_agents');

  static Stream<ValetAgentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ValetAgentsRecord.fromSnapshot(s));

  static Future<ValetAgentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ValetAgentsRecord.fromSnapshot(s));

  static ValetAgentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ValetAgentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ValetAgentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ValetAgentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ValetAgentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ValetAgentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createValetAgentsRecordData({
  String? agentId,
  String? name,
  String? email,
  String? phoneNumber,
  String? locationCity,
  String? qrCodeUrl,
  String? status,
  double? rating,
  double? totalTips,
  double? earningsTotal,
  int? completedJobs,
  String? profilePhoto,
  String? verificationLicenseUrl,
  String? verificationPassportUrl,
  String? verificationWorkPermitUrl,
  bool? verificationStatus,
  DateTime? createdTime,
  String? shiftDay1,
  DateTime? shiftStartTime1,
  DateTime? shiftEndTime1,
  String? shiftLocation1,
  String? shiftDay2,
  DateTime? shiftStartTime2,
  DateTime? shiftEndTime2,
  String? shiftLocation2,
  String? shiftDay3,
  DateTime? shiftStartTime3,
  DateTime? shiftEndTime3,
  String? shiftLocation3,
  String? shiftDay4,
  DateTime? shiftStartTime4,
  DateTime? shiftEndTime4,
  String? shiftLocation4,
  String? shiftDay5,
  DateTime? shiftStartTime5,
  DateTime? shiftEndTime5,
  String? shiftLocation5,
  String? shiftDay6,
  DateTime? shiftStartTime6,
  DateTime? shiftEndTime6,
  String? shiftLocation6,
  String? shiftDay7,
  DateTime? shiftStartTime7,
  DateTime? shiftEndTime7,
  String? shiftLocation7,
  DocumentReference? assignedCompany,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'agent_id': agentId,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'location_city': locationCity,
      'qr_code_url': qrCodeUrl,
      'status': status,
      'rating': rating,
      'total_tips': totalTips,
      'earnings_total': earningsTotal,
      'completed_jobs': completedJobs,
      'profile_photo': profilePhoto,
      'verification_license_url': verificationLicenseUrl,
      'verification_passport_url': verificationPassportUrl,
      'verification_work_permit_url': verificationWorkPermitUrl,
      'verification_status': verificationStatus,
      'created_time': createdTime,
      'shift_day_1': shiftDay1,
      'shift_start_time_1': shiftStartTime1,
      'shift_end_time_1': shiftEndTime1,
      'shift_location_1': shiftLocation1,
      'shift_day_2': shiftDay2,
      'shift_start_time_2': shiftStartTime2,
      'shift_end_time_2': shiftEndTime2,
      'shift_location_2': shiftLocation2,
      'shift_day_3': shiftDay3,
      'shift_start_time_3': shiftStartTime3,
      'shift_end_time_3': shiftEndTime3,
      'shift_location_3': shiftLocation3,
      'shift_day_4': shiftDay4,
      'shift_start_time_4': shiftStartTime4,
      'shift_end_time_4': shiftEndTime4,
      'shift_location_4': shiftLocation4,
      'shift_day_5': shiftDay5,
      'shift_start_time_5': shiftStartTime5,
      'shift_end_time_5': shiftEndTime5,
      'shift_location_5': shiftLocation5,
      'shift_day_6': shiftDay6,
      'shift_start_time_6': shiftStartTime6,
      'shift_end_time_6': shiftEndTime6,
      'shift_location_6': shiftLocation6,
      'shift_day_7': shiftDay7,
      'shift_start_time_7': shiftStartTime7,
      'shift_end_time_7': shiftEndTime7,
      'shift_location_7': shiftLocation7,
      'assigned_company': assignedCompany,
      'is_active': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class ValetAgentsRecordDocumentEquality implements Equality<ValetAgentsRecord> {
  const ValetAgentsRecordDocumentEquality();

  @override
  bool equals(ValetAgentsRecord? e1, ValetAgentsRecord? e2) {
    return e1?.agentId == e2?.agentId &&
        e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.locationCity == e2?.locationCity &&
        e1?.qrCodeUrl == e2?.qrCodeUrl &&
        e1?.status == e2?.status &&
        e1?.rating == e2?.rating &&
        e1?.totalTips == e2?.totalTips &&
        e1?.earningsTotal == e2?.earningsTotal &&
        e1?.completedJobs == e2?.completedJobs &&
        e1?.profilePhoto == e2?.profilePhoto &&
        e1?.verificationLicenseUrl == e2?.verificationLicenseUrl &&
        e1?.verificationPassportUrl == e2?.verificationPassportUrl &&
        e1?.verificationWorkPermitUrl == e2?.verificationWorkPermitUrl &&
        e1?.verificationStatus == e2?.verificationStatus &&
        e1?.createdTime == e2?.createdTime &&
        e1?.shiftDay1 == e2?.shiftDay1 &&
        e1?.shiftStartTime1 == e2?.shiftStartTime1 &&
        e1?.shiftEndTime1 == e2?.shiftEndTime1 &&
        e1?.shiftLocation1 == e2?.shiftLocation1 &&
        e1?.shiftDay2 == e2?.shiftDay2 &&
        e1?.shiftStartTime2 == e2?.shiftStartTime2 &&
        e1?.shiftEndTime2 == e2?.shiftEndTime2 &&
        e1?.shiftLocation2 == e2?.shiftLocation2 &&
        e1?.shiftDay3 == e2?.shiftDay3 &&
        e1?.shiftStartTime3 == e2?.shiftStartTime3 &&
        e1?.shiftEndTime3 == e2?.shiftEndTime3 &&
        e1?.shiftLocation3 == e2?.shiftLocation3 &&
        e1?.shiftDay4 == e2?.shiftDay4 &&
        e1?.shiftStartTime4 == e2?.shiftStartTime4 &&
        e1?.shiftEndTime4 == e2?.shiftEndTime4 &&
        e1?.shiftLocation4 == e2?.shiftLocation4 &&
        e1?.shiftDay5 == e2?.shiftDay5 &&
        e1?.shiftStartTime5 == e2?.shiftStartTime5 &&
        e1?.shiftEndTime5 == e2?.shiftEndTime5 &&
        e1?.shiftLocation5 == e2?.shiftLocation5 &&
        e1?.shiftDay6 == e2?.shiftDay6 &&
        e1?.shiftStartTime6 == e2?.shiftStartTime6 &&
        e1?.shiftEndTime6 == e2?.shiftEndTime6 &&
        e1?.shiftLocation6 == e2?.shiftLocation6 &&
        e1?.shiftDay7 == e2?.shiftDay7 &&
        e1?.shiftStartTime7 == e2?.shiftStartTime7 &&
        e1?.shiftEndTime7 == e2?.shiftEndTime7 &&
        e1?.shiftLocation7 == e2?.shiftLocation7 &&
        e1?.assignedCompany == e2?.assignedCompany &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(ValetAgentsRecord? e) => const ListEquality().hash([
        e?.agentId,
        e?.name,
        e?.email,
        e?.phoneNumber,
        e?.locationCity,
        e?.qrCodeUrl,
        e?.status,
        e?.rating,
        e?.totalTips,
        e?.earningsTotal,
        e?.completedJobs,
        e?.profilePhoto,
        e?.verificationLicenseUrl,
        e?.verificationPassportUrl,
        e?.verificationWorkPermitUrl,
        e?.verificationStatus,
        e?.createdTime,
        e?.shiftDay1,
        e?.shiftStartTime1,
        e?.shiftEndTime1,
        e?.shiftLocation1,
        e?.shiftDay2,
        e?.shiftStartTime2,
        e?.shiftEndTime2,
        e?.shiftLocation2,
        e?.shiftDay3,
        e?.shiftStartTime3,
        e?.shiftEndTime3,
        e?.shiftLocation3,
        e?.shiftDay4,
        e?.shiftStartTime4,
        e?.shiftEndTime4,
        e?.shiftLocation4,
        e?.shiftDay5,
        e?.shiftStartTime5,
        e?.shiftEndTime5,
        e?.shiftLocation5,
        e?.shiftDay6,
        e?.shiftStartTime6,
        e?.shiftEndTime6,
        e?.shiftLocation6,
        e?.shiftDay7,
        e?.shiftStartTime7,
        e?.shiftEndTime7,
        e?.shiftLocation7,
        e?.assignedCompany,
        e?.isActive
      ]);

  @override
  bool isValidKey(Object? o) => o is ValetAgentsRecord;
}
