import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/identity/decentralized_identity.dart';

class FirebaseService {
  Future<void> initFirebase() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
  }

  Future<void> findOrCreateUser(DecentralizedIdentity identity) async {
    try {
      final FirebaseChatCore firbaseChatCore = FirebaseChatCore.instance;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: identity.profileInfo.email ?? '',
        password: identity.profileInfo.phone ?? '',
      );
    } catch (e) {
      await _createUser(identity);
    }
  }

  Future<void> _createUser(DecentralizedIdentity identity) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: identity.profileInfo.email ?? '',
        password: identity.profileInfo.phone ?? '',
      );
      await FirebaseChatCore.instance.createUserInFirestore(
        types.User(
          firstName: identity.profileInfo.name,
          id: credential.user!.uid,
          imageUrl: '',
        ),
      );
    } catch (e) {
      print('register error');
    }
  }

  String getUserName(types.User user) => (user.firstName ?? '').trim();
}
