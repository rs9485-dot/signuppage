import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in',
                style: TextStyle(fontSize: 40, color: Colors.lightBlue),
              ),
              Text(
                'Please log in into your account',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 50),
              Text(
                'Email',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              //email textfield
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email id';
                  }
                  if (!value.contains('@gmail.com')) {
                    return 'Please enter a valid email id ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: '******@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Text(
                'Password',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              //password text field
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: '**********',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'signing in ..',
                          ),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 60),
              // sign in with google button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    //google login page
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    foregroundColor: Colors.blue,
                    side: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  icon: Image.asset(
                    'assets/images/google logo.jpg',
                    height: 20,
                  ),
                  label: Text(
                    'Sign in with Google',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // logic
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    foregroundColor: Colors.blue,
                    side: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  icon: Image.asset(
                    'assets/images/Facebook_icon.jpg',
                    height: 20,
                  ),
                  label: Text(
                    'Sign in with Facebook',
                    style: TextStyle(fontSize: 17),
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
