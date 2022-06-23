import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:c14190040_01/dataclass.dart';

CollectionReference tblPost = FirebaseFirestore.instance.collection("tbPost");

class Database {
  static Stream<QuerySnapshot> getData() {
    return tblPost.snapshots();
  }

  static Future<void> tambahData({required Post item}) async {
    DocumentReference docRef = tblPost.doc(item.title);

    await docRef
        .set(item.toJson())
        .whenComplete(() => print("berhasil"))
        .catchError((e) => print(e.hashCode));
  }
}
