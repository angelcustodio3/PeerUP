import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Peer extends StatefulWidget {
  const Peer({super.key});

  @override
  _PeerState createState() => _PeerState();
}

class _PeerState extends State<Peer> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late TextEditingController _textController4;

  late FocusNode _textFieldFocusNode1;
  late FocusNode _textFieldFocusNode2;
  late FocusNode _textFieldFocusNode3;
  late FocusNode _textFieldFocusNode4;

  File? _pickedImage;

  @override
  void initState() {
    super.initState();

    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();

    _textFieldFocusNode1 = FocusNode();
    _textFieldFocusNode2 = FocusNode();
    _textFieldFocusNode3 = FocusNode();
    _textFieldFocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();

    _textFieldFocusNode1.dispose();
    _textFieldFocusNode2.dispose();
    _textFieldFocusNode3.dispose();
    _textFieldFocusNode4.dispose();

    super.dispose();
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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
                const SizedBox(height: 20), // Adjust the height as needed

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _textController1,
                    focusNode: _textFieldFocusNode1,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      // Add other input decoration properties as needed
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Adjust the height as needed

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _textController2,
                    focusNode: _textFieldFocusNode2,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      // Add other input decoration properties as needed
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Adjust the height as needed

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _textController3,
                    focusNode: _textFieldFocusNode3,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      // Add other input decoration properties as needed
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Adjust the height as needed

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _textController4,
                    focusNode: _textFieldFocusNode4,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      // Add other input decoration properties as needed
                    ),
                  ),
                ),

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
                const SizedBox(height: 20), // Adjust the height as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}


