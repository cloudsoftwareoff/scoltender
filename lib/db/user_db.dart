import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoltender/model/user_model.dart';


class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  CollectionReference get _users => _firestore.collection('users');

  // Add a new user
  Future<void> addUser(UserModel user) async {
    try {
      await _users.doc(user.uid).set(user.toMap());
    } catch (e) {
      print('Error adding user: $e');
      throw e;
    }
  }

  // Get all users
  Future<List<UserModel>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await _users.get();
      return querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error getting all users: $e');
      throw e;
    }
  }

  // Get user by ID
  Future<UserModel> getUserById(String uid) async {
    try {
      DocumentSnapshot docSnapshot = await _users.doc(uid).get();
      if (docSnapshot.exists) {
        return UserModel.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      print('Error getting user by ID: $e');
      throw e;
    }
  }
}
