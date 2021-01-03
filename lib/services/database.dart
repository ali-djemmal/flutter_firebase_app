import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_coffee/models/brew.dart';



class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, int strength, String name) async {
    return await brewCollection.
    document(uid).
    setData({ 'sugars': sugars, 'strength': strength, 'name': name });
  }
  // brew list from snapshots
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.documents.map((doc){
      return Brew(
          sugars: doc.data['sugars'] ?? '0',
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0
      );
    }).toList();

  }
  // get brews stream
Stream<List<Brew>> get brews{ return brewCollection.snapshots().map(_brewListFromSnapshot);}
}