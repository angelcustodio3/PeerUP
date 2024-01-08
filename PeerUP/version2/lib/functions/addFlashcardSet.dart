import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUserDataToFirestore() async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid != null) {
      // Reference to the 'user_data' collection
      CollectionReference userDataCollection =
          FirebaseFirestore.instance.collection('user_data');

      // Data to be added to the collection
      Map<String, dynamic> userData = {
        'uid': uid,
        'username': 'example_username',
        'email': FirebaseAuth.instance.currentUser?.email,
        // Add other user data here
      };

      // Add the data to the collection
      await userDataCollection.add(userData);

      print('User data added to Firestore collection successfully!');
    } else {
      print('User is not authenticated.');
    }
  } catch (e) {
    print('Error adding user data to Firestore collection: $e');
  }
}
