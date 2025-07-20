import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  void _signUp() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage("All fields are required.");
      return;
    }

    if (password.length < 6) {
      _showMessage("Password must be at least 6 characters.");
      return;
    }

    setState(() => isLoading = true);

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      // Save name and email in Realtime Database
      await _database.child("Users").child(uid).set({
        "name": name,
        "email": email,
      });

      _showMessage("Account created successfully!");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showMessage("This email is already in use.");
      } else if (e.code == 'invalid-email') {
        _showMessage("Invalid email address.");
      } else {
        _showMessage("Signup failed: ${e.message}");
      }
    } catch (e) {
      _showMessage("An error occurred. Please try again.");
    }

    setState(() => isLoading = false);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBFDFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hello", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xff36455A))),
            const SizedBox(height: 8),
            const Text("Let's learn more about plants.", style: TextStyle(fontSize: 18, color: Color(0xff495566))),
            const SizedBox(height: 32),

            TextField(
              controller: nameController,
              decoration: _inputDecoration("Full Name"),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: _inputDecoration("Email"),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: _inputDecoration("Password"),
            ),
            const SizedBox(height: 40),

            GestureDetector(
              onTap: isLoading ? null : _signUp,
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF81C784), // Light Green
                      Color(0xFF4FC3F7), // Light Blue
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ", style: TextStyle(color: Color(0xff6A6F7D))),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Login())),
                  child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4FC3F7))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color(0xffF1F3F6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
