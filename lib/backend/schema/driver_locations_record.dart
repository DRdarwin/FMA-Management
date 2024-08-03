import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverLocationsRecord extends FirestoreRecord {
  DriverLocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driverId" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  bool hasDriverId() => _driverId != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _driverId = snapshotData['driverId'] as String?;
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://a-i-gen-project-zdn0qt-default-rtdb.europe-west1.firebasedatabase.app/')
      .collection('DriverLocations');

  static Stream<DriverLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriverLocationsRecord.fromSnapshot(s));

  static Future<DriverLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriverLocationsRecord.fromSnapshot(s));

  static DriverLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DriverLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverLocationsRecordData({
  String? driverId,
  double? latitude,
  double? longitude,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driverId': driverId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverLocationsRecordDocumentEquality
    implements Equality<DriverLocationsRecord> {
  const DriverLocationsRecordDocumentEquality();

  @override
  bool equals(DriverLocationsRecord? e1, DriverLocationsRecord? e2) {
    return e1?.driverId == e2?.driverId &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(DriverLocationsRecord? e) => const ListEquality()
      .hash([e?.driverId, e?.latitude, e?.longitude, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is DriverLocationsRecord;
}
