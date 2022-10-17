import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_miner_2/modals/todos_modal.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Todos');

class FirebaseCRUDOperation {
  FirebaseCRUDOperation._();
  static final FirebaseCRUDOperation firebaseCRUDOperation =
      FirebaseCRUDOperation._();

  //TODO: addData
  Future<Response> addData({
    required String title,
    required String content,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "content": content,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //TODO: readData
  Stream<QuerySnapshot> readData() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  //TODO: searchData
  Stream<QuerySnapshot> searchData({required String searchKey}) {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection
        .where('title', isGreaterThanOrEqualTo: searchKey)
        .where('title', isLessThan: searchKey + 'z')
        .snapshots();
  }

  //TODO:updateData
  Future<Response> updateData({
    required String title,
    required String content,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "content": content,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //TODO: addData
  Future<Response> deleteData({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
