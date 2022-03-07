import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/message_user.dart';

class FirebaseService {
  get uid => null;

  Future<void> initFirebase() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
  }

  Future<void> findOrCreateUser(MessageUser userData) async {
    try {
      final FirebaseChatCore firbaseChatCore = FirebaseChatCore.instance;
      final String collectionName = firbaseChatCore.config.usersCollectionName;
      final User? _user = firbaseChatCore.firebaseUser;
      final doc = await firbaseChatCore
          .getFirebaseFirestore()
          .collection(collectionName)
          .doc(userData.did.toString())
          .get();
      final data = doc.data();
      if (data == null) {
        await firbaseChatCore.createUserInFirestore(
          types.User(
            firstName: userData.name,
            id: userData.did.toString(),
            imageUrl: userData.imageURL,
            lastName: userData.name,
          ),
        );
      } else {
        final userCredential = await FirebaseAuth.instance.signInAnonymously();
      }
    } catch (e) {
      // print(e);
    }
  }

  String getUserName(types.User user) => (user.firstName ?? '').trim();
}
