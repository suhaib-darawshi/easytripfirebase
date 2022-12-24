import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_trip/models/companyModel.dart';
import 'package:easy_trip/models/user.dart';

import 'package:firebase_core/firebase_core.dart';

import '../models/trip.dart';

class FireStoreHelper {
  FireStoreHelper._();
  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addCompany(Company company) async {
    try {
      return await firestore
          .collection('companies')
          .doc(company.id)
          .set(company.toMap());
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  addNewUser(User appUser) async {
    log("message");
    try {
      return await firestore
          .collection('users')
          .doc(appUser.id)
          .set(appUser.toMap());
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  addTrip(Trip trip) async {
    try {
      await firestore.collection('trips').add(trip.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Trip>> getTrips() async {
    QuerySnapshot<Map<String, dynamic>> catsSnapshot =
        await firestore.collection('trips').get();
    List<Trip> trips = catsSnapshot.docs.map((e) {
      Trip c = Trip.fromMap(e.data());
      c.id = e.id;
      return c;
    }).toList();
    return trips;
  }

  Future<User> getUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = documentSnapshot.data();
    User appUser = User.fromMap(data!);
    return appUser;
  }

  Future<Company> getCompanyFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection('companies').doc(id).get();
    Map<String, dynamic>? map = documentSnapshot.data();
    log(map.toString());
    Company company = Company.fromMap(map!);
    return company;
  }
}
