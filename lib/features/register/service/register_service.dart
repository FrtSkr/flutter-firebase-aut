import 'package:firebase_database/firebase_database.dart';
import '../../users/model/user_model.dart';

class RegisterService {
  final referenceDatabase = FirebaseDatabase.instance;
  Future createUser(UserModel user) async {
    final ref = referenceDatabase.ref();
    final json = user.toJson();
    print(json);

    await ref.child("users").push().set(json).asStream();
  }
}
