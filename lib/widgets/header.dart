import 'package:flutter/material.dart';
import 'package:fluttering_flat/utils/colors.dart';
import 'package:fluttering_flat/utils/fonts.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _Header();
}

// Testing Statefulu Widget vs Stateless
class _Header extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(ThemeColors.black),
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          'Header',
          style: TextStyle(
              fontSize: ThemeFonts.md,
              color: Color(ThemeColors.green),
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
