import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Peer extends StatefulWidget {
  const Peer({Key? key}) : super(key: key);

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
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -0.73),
                child: GestureDetector(
                  onTap: () async {
                    await _pickImage(ImageSource.gallery); // Change source as needed
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
              ),
              const Align(
                alignment: AlignmentDirectional(0, -0.9),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // Other Align widgets for TextFormField fields
              Align(
                alignment: const AlignmentDirectional(0, 0.85),
                child: ElevatedButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
