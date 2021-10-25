import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cafense_mobile/widgets/foods.dart';
import 'dart:async';

class databaseServices {
  final String uid;
  databaseServices({required this.uid});

  final CollectionReference breakfastcollection =
      FirebaseFirestore.instance.collection('Breakfast');
  final CollectionReference lunchcollection =
      FirebaseFirestore.instance.collection('Lunch');
  final CollectionReference dessertscollection =
      FirebaseFirestore.instance.collection('Desserts');
  final CollectionReference fastfoodscollection =
      FirebaseFirestore.instance.collection('Fast Foods');
  final CollectionReference feedbackscollection =
      FirebaseFirestore.instance.collection('Feedbacks');
  final CollectionReference billcollection =
      FirebaseFirestore.instance.collection('Bill');
  final CollectionReference availableorderscollection =
      FirebaseFirestore.instance.collection('Available Orders');

//update breakfast
  Future updateBreakfast(
      bool availability, String image, String name, double price) async {
    return await breakfastcollection.doc(uid).set({
      'availability': availability,
      'image': image,
      'name': name,
      'price': price,
    });
  }

//get breakfast data
  Stream<List<breakfast>> get brekfast {
    return breakfastcollection.snapshots().map(_breakfastListFromSnapshot);
  }

  List<breakfast> _breakfastListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) =>
            //print(doc.data);
            breakfast(doc.get('name') ?? '', doc.get('price') ?? 0,
                doc.get('image') ?? '', doc.get('availability') ?? false))
        .toList();
  }

//update lunch data
  Future updateLunch(
      bool availability, String image, String name, double price) async {
    return await lunchcollection.doc(uid).set({
      'availability': availability,
      'image': image,
      'name': name,
      'price': price,
    });
  }

  Stream<QuerySnapshot> get lunch {
    return lunchcollection.snapshots();
  }

  Future updateDesserts(
      bool availability, String image, String name, double price) async {
    return await dessertscollection.doc(uid).set({
      'availability': availability,
      'image': image,
      'name': name,
      'price': price,
    });
  }

  Stream<QuerySnapshot> get desserts {
    return dessertscollection.snapshots();
  }

  Future updateFastfoods(
      bool availability, String image, String name, double price) async {
    return await fastfoodscollection.doc(uid).set({
      'availability': availability,
      'image': image,
      'name': name,
      'price': price,
    });
  }

  Stream<QuerySnapshot> get fastfoods {
    return fastfoodscollection.snapshots();
  }
}
