import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(Icons.home_max),
        ),
        BottomNavigationBarItem(
          label: 'Categorias',
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }
}
