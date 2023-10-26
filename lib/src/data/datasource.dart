import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heodat/src/domain/models/base_mapper.dart';

class DBManagement {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<Room> getRoom() async {
    var res = [];
    await firestore.collection('room').get().then((value) {
      for (var e in value.docs) {
        res.add((Room.fromJson(e.data())));
      }
    });
    return res[0];
  }

  static Future getFunds(String roomId) async {
    var res = [];
    await firestore
        .collection('room')
        .doc(roomId)
        .collection('funds')
        .get()
        .then((value) {
      for (var e in value.docs) {
        res.add((e.data()));
      }
    });
    return res;
  }

  static Future createFund(String roomId) async {
    var res = [];
    await firestore
        .collection('room')
        .doc(roomId)
        .collection('funds')
        .get()
        .then((value) {
      for (var e in value.docs) {
        res.add((e.data()));
      }
    });
    return res;
  }
}
