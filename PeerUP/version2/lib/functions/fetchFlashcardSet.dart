import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> fetchDataFromFirestore() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the 'users' collection with the user's UID as the document ID
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('flashcardSets')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // Access data from each document
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        print('Document ID: ${documentSnapshot.id}, Data: $data');
      }
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
