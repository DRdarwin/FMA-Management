import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reportId" field.
  String? _reportId;
  String get reportId => _reportId ?? '';
  bool hasReportId() => _reportId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "generatedAt" field.
  DateTime? _generatedAt;
  DateTime? get generatedAt => _generatedAt;
  bool hasGeneratedAt() => _generatedAt != null;

  void _initializeFields() {
    _reportId = snapshotData['reportId'] as String?;
    _type = snapshotData['type'] as String?;
    _generatedAt = snapshotData['generatedAt'] as DateTime?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://a-i-gen-project-zdn0qt-default-rtdb.europe-west1.firebasedatabase.app/')
      .collection('Reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? reportId,
  String? type,
  DateTime? generatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportId': reportId,
      'type': type,
      'generatedAt': generatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.reportId == e2?.reportId &&
        e1?.type == e2?.type &&
        e1?.generatedAt == e2?.generatedAt;
  }

  @override
  int hash(ReportsRecord? e) =>
      const ListEquality().hash([e?.reportId, e?.type, e?.generatedAt]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
