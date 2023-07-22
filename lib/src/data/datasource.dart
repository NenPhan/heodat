import 'package:cloud_firestore/cloud_firestore.dart';

class DBManagement {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // static Future<List<Product>> getProduct() async {
  //   List<Product> res = [];
  //   await firestore.collection('product').get().then((value) {
  //     for (var e in value.docs) {
  //       res.add(Product.fromJson(e.data()));
  //     }
  //   });
  //   return res;
  // }
}
