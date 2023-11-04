import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2925F),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Text(
                'Welcome \nBack',
                style: TextStyle(
                  color: Color(0xFF0D1238),
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 0),
            Center(
              child: Image.asset(
                'assets/graphics/wws.png',
                width: 290,
                height: 200,
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: 270,
                height: 50,
                child: TextFormWidget(
                  hintText: 'Username',
                  obscureText: false,
                  marginBottom: 10,
                  borderColor: Colors.white,
                  focusColor: Colors.red,
                  removeBorder: true,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                width: 270,
                height: 50,
                child: PasswordTextFormWidget(
                  hintText: 'Password',
                  obscureText: true,
                  marginBottom: 10,
                  borderColor: Colors.white,
                  focusColor: Colors.red,
                  removeBorder: true,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                width: 134,
                height: 33,
                child: ElevatedButton(
                  onPressed: () {
                    // Add login functionality here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF146C94)),
                    
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 190,
                height: 33,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add Google login functionality here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  label: Text(
                    'Connect with Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.black, // Change the check icon color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormWidget extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final double marginBottom;
  final Color? borderColor;
  final Color? focusColor;
  final bool removeBorder;

  TextFormWidget({
    required this.hintText,
    required this.obscureText,
    this.marginBottom = 0,
    this.borderColor,
    this.focusColor,
    this.removeBorder = false,
  });

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.marginBottom),
      child: TextFormField(
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          border: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.white,
                  ),
                ),
          focusedBorder: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.focusColor ?? Colors.blue,
                  ),
                ),
        ),
      ),
    );
  }
}

class PasswordTextFormWidget extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final double marginBottom;
  final Color? borderColor;
  final Color? focusColor;
  final bool removeBorder;

  PasswordTextFormWidget({
    required this.hintText,
    required this.obscureText,
    this.marginBottom = 0,
    this.borderColor,
    this.focusColor,
    this.removeBorder = false,
  });

  @override
  _PasswordTextFormWidgetState createState() => _PasswordTextFormWidgetState();
}

class _PasswordTextFormWidgetState extends State<PasswordTextFormWidget> {
  bool isObscured = true;

  void toggleObscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.marginBottom),
      child: TextFormField(
        obscureText: isObscured,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          border: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.black,
                  ),
                ),
          focusedBorder: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.focusColor ?? Colors.blue,
                  ),
                ),
          suffixIcon: IconButton(
            onPressed: toggleObscureText,
            icon: Icon(
              isObscured ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}
