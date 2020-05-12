import 'package:ambulance/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ambulance/models/amb.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
    
//collection reference
  final CollectionReference userCollection = Firestore.instance.collection('ID');

  Future updateUserData(String name, String cardata, String drivingstatus ) async
  {
    return await userCollection.document(uid).setData({
      'name': name,
      'cardata': cardata,
      'drivingstatus': drivingstatus,
    });
  }
    //amb list from snapshot
  List<Amb> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Amb(
        name:doc.data['name']?? '',
        cardata:doc.data['cardata']?? '',
        drivingstatus:doc.data['drivingstatus']?? '',

      );
    }).toList();
  }

  //userData from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      cardata: snapshot.data['cardata'],
      drivingstatus: snapshot.data['drivingstatus'],
    );
  }

    //get stream
    Stream<List<Amb>> get users
  {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData{
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  }

