import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileRemoteDataSource{
  
  Future<void> updateProfileData(String uid, Map<String, dynamic> data);
  Future<void> updatePassword(String uid,String newPassword);
  
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ProfileRemoteDataSourceImpl({required FirebaseFirestore firestore, required FirebaseAuth auth}) : _firestore = firestore, _auth = auth;

  @override
  Future<void> updateProfileData(String uid, Map<String, dynamic> data)async {
    print('Firestore update: userId=$uid, data=$data');
    await _firestore.collection('users').doc(uid).update(data);
  }

  @override
  Future<void> updatePassword(String uid, String newPassword) async{
    await _auth.currentUser!.updatePassword(newPassword);
  }
}