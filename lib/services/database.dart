import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future addUsersDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future orderDetails(Map<String, dynamic> userInfoMap) async {
    // used to store the details
    return await FirebaseFirestore.instance
        .collection("orders")
        .add(userInfoMap);
  }

  Future addProduct(
    Map<String, dynamic> userInfoMap,
    String categoryname,
  ) async {
    return await FirebaseFirestore.instance
        .collection(categoryname)
        .add(userInfoMap);
  }

  Future updateStatus(String id) async {
    return await FirebaseFirestore.instance.collection('orders').doc(id)
    .update({"Status": "Delivered"});
  }

  Future<Stream<QuerySnapshot>> getProducts(String category) async {
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }

  Future<Stream<QuerySnapshot>> allOrders() async {
    return await FirebaseFirestore.instance
        .collection("orders")
        .where('Status', isEqualTo: 'On the way')
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getOrders(String email) async {
    return await FirebaseFirestore.instance
        .collection('orders')
        .where('Email', isEqualTo: email)
        .snapshots();
  }
}
