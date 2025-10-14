import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  double _size = 100;
  Alignment _lottieAlignment = Alignment.center;
  double _formOpacity = 0.0; // Ban đầu form sẽ trong suốt

  @override
  void initState() {
    super.initState();
    // 2. Kích hoạt animation sau một khoảng thời gian
    // Thời gian này nên tương đương với thời gian chạy của Lottie animation
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _size = 150.0;
        _lottieAlignment = Alignment.topCenter;
        _formOpacity = 1.0; // Cho form hiện ra
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: _formOpacity,
                duration: const Duration(milliseconds: 500), // Thời gian mờ dần
                child: Padding(
                  padding: EdgeInsets.only(top: 200), // Đẩy form xuống dưới Lottie
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 8,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 8,
                          ),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // 
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
              // 3. Lottie Animation (nằm bên trên)
              AnimatedContainer(
                duration: const Duration(
                  seconds: 1,
                ), // Thời gian thu nhỏ và di chuyển
                curve: Curves.easeInOut, // Hiệu ứng mượt mà
                width: double.infinity, // Chiếm toàn bộ chiều rộng để căn chỉnh
                alignment: _lottieAlignment,
                child: Lottie.asset(
                  'assets/lottie/Movie_Lauch.json', // <-- THAY THẾ BẰNG FILE CỦA BẠN
                  width: _size,
                  height: _size,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
