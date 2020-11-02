

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  FirebaseAuth get auth => FirebaseAuth.instance;
  

  FirebaseService() {
    print('firebase initilizing');
    FirebaseService.initialize();
    print('firebase initialized');
  }

  static Future<FirebaseApp> initialize() async {
    
    return await Firebase.initializeApp();
  }


  
}
