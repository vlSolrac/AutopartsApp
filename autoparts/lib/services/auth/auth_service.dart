import 'package:autoparts/models/models.dart';
import 'package:flutter/material.dart';

import 'package:autoparts/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  bool hasIdUSer = false;

  late UserCar currentUser;

  Future<Message> createUser({
    required String email,
    required String password,
    required String name,
    required String middlename,
    required String nickname,
    String? celphone,
    String? image,
  }) async {
    try {
      UserCredential res = await FirebaseIntance.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (res.user?.uid == null) {
        return Message(
            message:
                "No se pudo crear correctamente el usuario, vulve a intentar",
            flag: true);
      }

      final id = res.user!.uid;

      final userCar = UserCar(
        id: id,
        img: image,
        email: email,
        password: password,
        nickname: nickname,
        celphone: celphone,
        middlename: middlename,
        name: name,
        creationDate: Timestamp.now(),
      );

      await FirebaseIntance.fireBase
          .collection("Autoparts")
          .doc("Auth")
          .collection("Users")
          .doc(userCar.id)
          .set(userCar.toMap());

      return Message(flag: true, message: 'Usuario creado correctamente');
    } catch (e) {
      return Message(
          message:
              "No se pudo crear correctamente el usuario, vulve a intentar",
          flag: true);
      print(e);
    }
  }

  Future<Message> loginUser(String email, String password) async {
    try {
      UserCredential res = await FirebaseIntance.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      await getCurrentUse();

      return Message(flag: true, message: 'Bienvendio de nuevo');
    } catch (e) {
      return Message(flag: false, message: 'Algo salio mal');
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<String> getCurrentUse() async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null) return "";

    final userCar = await FirebaseIntance.fireBase
        .collection("Autoparts")
        .doc("Auth")
        .collection("Users")
        .doc(id)
        .get();

    currentUser = UserCar.fromMap(userCar.data()!);
    currentUser.id = userCar.id;

    await Future.delayed(const Duration(milliseconds: 1000));

    return id;
  }
}
