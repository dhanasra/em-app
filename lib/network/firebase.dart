import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseClient {
  FirebaseClient._internal();
  static final _instance = FirebaseClient._internal();
  factory FirebaseClient() => _instance;

  Future<void> init() async{

    await Firebase.initializeApp(
        options: const FirebaseOptions(
            projectId: 'expense-manager-9e3ae',
            apiKey: 'AIzaSyA3irqqlExmCr_m9jag8ipq8NidXElwGKo',
            messagingSenderId: '586564424102',
            appId: '1:586564424102:android:9a428c1b43e60fc096bf67'
        )
    );
  }

  User? getUser(){
    return FirebaseAuth.instance.currentUser;
  }

  FirebaseFirestore getFirestore(){
    return FirebaseFirestore.instance;
  }
}