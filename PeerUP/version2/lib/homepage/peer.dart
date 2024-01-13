import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peerup/functions/logout.dart';

class Peer extends StatefulWidget {
  const Peer({super.key});

  @override
  _PeerState createState() => _PeerState();
}

class _PeerState extends State<Peer> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;

  late FocusNode _textFieldFocusNode1;
  late FocusNode _textFieldFocusNode2;

  File? _pickedImage;

  @override
  void initState() {
    super.initState();

    _textController1 = TextEditingController();
    _textController2 = TextEditingController();

    _textFieldFocusNode1 = FocusNode();
    _textFieldFocusNode2 = FocusNode();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();

    _textFieldFocusNode1.dispose();
    _textFieldFocusNode2.dispose();

    super.dispose();
  }

    Future<void> updateEmailAndPassword() async {
    try {
      final String newEmail = _textController1.text.trim();
      final String newPassword = _textController2.text.trim();

      if (newEmail.isNotEmpty && newPassword.isNotEmpty) {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          await user.updateEmail(newEmail);
          await user.updatePassword(newPassword);
          print('Email and password updated successfully!');
        } else {
          print('User is not authenticated.');
        }
      } else {
        print('Email or password cannot be empty.');
      }
    } catch (e) {
      print('Error updating email and password: $e');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_textFieldFocusNode1.canRequestFocus) {
          FocusScope.of(context).requestFocus(_textFieldFocusNode1);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF6493A5),
          automaticallyImplyLeading: false,
          actions: const [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Adjust the height as needed

                GestureDetector(
                  onTap: () async {
                    await _pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: _pickedImage != null
                          ? DecorationImage(
                              image: FileImage(_pickedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _pickedImage == null
                        ? const Icon(Icons.add_a_photo)
                        : null,
                  ),
                ),
                const SizedBox(height: 20), // Adjust the height as needed

                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30), // Adjust the height as needed
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _textController1,
                    focusNode: _textFieldFocusNode1,
                    decoration: const InputDecoration(
                      labelText: 'Change Email',
                      // Add other input decoration properties as needed
                    ),
                  ),
                ),

                const SizedBox(height: 50), // Adjust the height as needed

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _textController2,
                    focusNode: _textFieldFocusNode2,
                    decoration: const InputDecoration(
                      labelText: 'Change Password',
                      // Add other input decoration properties as needed
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: const Text('Save Changes'),
                                    style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    logOut(context);
                  },
                  child: const Text('LOGOUT'),
                                    style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 40, 95, 139),
                    onPrimary: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ), // Adjust the height as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}


