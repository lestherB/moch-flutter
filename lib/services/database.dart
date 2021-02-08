import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {

  final String uid;
  DatabaseServices({this.uid});

  final CollectionReference collections = Firestore.instance.collection('collections');

  Future sampleSaveData(String name, String location, String item, String price) async{
    return await collections.document(uid).setData({
      'name': name,
      'location': location,
      'item': item,
      'price': price
    });
  }

}
