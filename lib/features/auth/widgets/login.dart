import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_tickets/features/auth/widgets/form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isAuthenticating = false;
  final _formLoginKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ACTION
  Future<User?> signInWithEmailPassword() async {
    /** duyệt qua form và chạy validate */
    var valid = _formLoginKey.currentState!.validate();
    if (!valid) return null;

    /** duyệt qua form và chạy save */
    _formLoginKey.currentState!.save();
    setState(() {
      _isAuthenticating = true;
    });
    if (_isAuthenticating) {
      try {
        UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        setState(() {
          _isAuthenticating = false;
        });
        return credential.user;
      } on FirebaseAuthException catch (e) {
        debugPrint("Lỗi đăng nhập: ${e.message}");
        if(mounted) {
          Fluttertoast.showToast(
          msg: e.message.toString(),
          textColor: Theme.of(context).colorScheme.onError,
          gravity: ToastGravity.TOP,
          fontSize: 16,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Theme.of(context).colorScheme.error,
        );
        }
        setState(() {
          _isAuthenticating = false;
        });
        return null;
      }
    }
    setState(() {
      _isAuthenticating = false;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 200,
        ), // Đẩy form xuống dưới Lottie
        child: Form(
          key: _formLoginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AForm(
                childrent: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.trim().isEmpty) {
                      return 'Username cannot be null';
                    }
                    if (value!.length < 6 && !value.contains('@')) {
                      return 'Wrong username';
                    }
                    return null;
                  },
                ),
              ),
              AForm(
                childrent: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  textInputAction: TextInputAction.send,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'password cannot be null';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              TextButton.icon(
                onPressed: signInWithEmailPassword,
                icon: Icon(Icons.login_rounded),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  disabledIconColor: Colors.blueGrey,
                ),
                label: _isAuthenticating
                    ? CircularProgressIndicator()
                    : Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
