import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/screens/bottom_nav_screen.dart';
import 'package:netflix_clone/themes/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: Lottie.asset(
          'assets/animations/netflixanim.json',
          frameRate: const FrameRate(120),
          controller: _controller,
          repeat: false,
          onLoaded: (p0) async{ 
            await Api().getPopularMovies();
            await Api().getTrendingMovies();
            await Api().getUpcomingMovies();
            await Api().getTVShows();
            _controller
              ..duration = p0.duration
              ..forward().whenComplete(() async {
                
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNav(),
                    ));
              });
          },
        ),
      ),
    );
  }
}
