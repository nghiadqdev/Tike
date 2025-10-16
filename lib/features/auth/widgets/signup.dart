import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_tickets/features/auth/widgets/check_label.dart';
import 'package:movie_tickets/features/auth/widgets/form.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final _formSignupKey = GlobalKey<FormFieldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _gender = false;
  final DateTime today = DateTime.now();
  final DateTime _dateOfBirth = DateTime.now();
  final bool _isAuthenticating = false;
  final secureStoreKey = UniqueKey();

  // ACTION
  // IOSOptions _getIOSOptions() => IOSOptions(
  //       accountName: _getAccountName(),
  //     );

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );

  void selectGender(check) {
    setState(() {
      _gender = check;
    });
  }

  void signup() async {
    final valid = _formSignupKey.currentState!.validate();
    if (!valid) {
      return;
    }

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final user = credential.user;
      debugPrint('-----user --$user');
    } on FirebaseAuthException catch (e) {
      debugPrint("Lỗi đăng ký: ${e.message}");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 200,
        ), // Đẩy form xuống dưới Lottie
        child: Form(
          key: _formSignupKey,
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
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'password cannot be null';
                    }
                    return null;
                  },
                ),
              ),
              AForm(
                childrent: TextFormField(
                  controller: _usernameController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  textInputAction: TextInputAction.send,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'username cannot less than 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Text('data'),
                  CheckLabel(
                    check: _gender,
                    onCheck: selectGender,
                    label: 'Male',
                  ),
                  CheckLabel(
                    check: !_gender,
                    onCheck: selectGender,
                    label: 'Female',
                  ),
                  DatePickerDialog(
                    firstDate: DateTime(
                      today.year - 100,
                      today.month,
                      today.day,
                    ),
                    lastDate: DateTime(today.year - 10, today.month, today.day),
                    // onDatePickerModeChange: (value) {
                    //   setState(() {
                    //     _dateOfBirth = DateTime(value);
                    //   });
                    // },
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextButton.icon(
                onPressed: (){},
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
