import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_tickets/features/auth/widgets/login.dart';
import 'package:movie_tickets/features/auth/widgets/signup.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> with TickerProviderStateMixin {
  double _size = 300;
  Alignment _lottieAlignment = Alignment.bottomCenter;
  double _formOpacity = 0.0; // Ban đầu form sẽ trong suốt
  late final AnimationController _controller;
  bool _isLogin = true;

  @override
  void initState() {
    super.initState();
    // 2. Kích hoạt animation sau một khoảng thời gian
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _size = 150.0;
        _lottieAlignment = Alignment.topCenter;
        _formOpacity = 1.0; // Cho form hiện ra
      });
    });
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      animateColor: true,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: .7),
              Theme.of(context).colorScheme.secondary.withValues(alpha: .7),
            ],
            end: AlignmentGeometry.topRight,
            begin: AlignmentGeometry.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentGeometry.topCenter,
                children: [
                  AnimatedOpacity(
                    opacity: _formOpacity,
                    duration: const Duration(
                      milliseconds: 300,
                    ), // Thời gian mờ dần
                    child: _isLogin ? Login() : Signup(),
                  ),
                  // 3. Lottie Animation (nằm bên trên)
                  AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 1500,
                    ), // Thời gian thu nhỏ và di chuyển
                    curve: Curves.easeInOut, // Hiệu ứng mượt mà
                    width: double.infinity,
                    height: _size,
                    alignment: _lottieAlignment,
                    child: Lottie.asset(
                      'assets/lottie/Movie_Lauch.json',
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller
                          ..duration = composition.duration
                          ..forward();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: AnimatedScale(
                  duration: Duration(milliseconds: 1000),
                  scale: _formOpacity,
                  child: Column(
                    children: [
                      InkWell(
                        child: Text(
                          _isLogin
                              ? 'No have account, signup'
                              : 'Already have account, Login',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimary,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.login)),
                        ],
                      )
                    ],
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
