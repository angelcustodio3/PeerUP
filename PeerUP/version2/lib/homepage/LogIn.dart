import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peerup/functions/signup.dart';
import 'package:peerup/homepage/signUpPage.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginPage();
}

class LoginPage extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2925F),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Color(0xFF0D1238),
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 0),
            Center(
              child: Image.asset(
                'assets/graphics/wws.png',
                width: 290,
                height: 200,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: SizedBox(
                width: 270,
                height: 50,
                child: TextFormWidget(
                  hintText: 'Email',
                  obscureText: false,
                  marginBottom: 10,
                  borderColor: Colors.white,
                  focusColor: Colors.red,
                  removeBorder: true,
                  controller: emailController,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 270,
                height: 50,
                child: PasswordTextFormWidget(
                  hintText: 'Password',
                  obscureText: true,
                  marginBottom: 10,
                  borderColor: Colors.white,
                  focusColor: Colors.red,
                  removeBorder: true,
                  controller: passwordController,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 134,
                height: 33,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF146C94)),
                  ),
                  child: const Text(
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
            const SizedBox(height: 15),
            Center(
              child: TextButton(
                onPressed: () {
                  // add login functionality
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
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
  final TextEditingController controller; // Add this line

  TextFormWidget({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.marginBottom = 0,
    this.borderColor,
    this.focusColor,
    this.removeBorder = false,
    required this.controller, // Initialize the controller
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
        controller: widget.controller, // Assign the controller to TextFormField

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
  final TextEditingController controller; // Add this line

  PasswordTextFormWidget({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.marginBottom = 0,
    this.borderColor,
    this.focusColor,
    this.removeBorder = false,
    required this.controller, // Initialize the controller
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
        controller: widget.controller,
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
