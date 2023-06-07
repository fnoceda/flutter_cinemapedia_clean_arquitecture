import 'package:cinemapedia/config/constants/enviromment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Center(child: Text(Enviroment.theMovieDbKey)),
        ),
      ),
    );
  }
}
