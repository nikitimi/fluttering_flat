import 'package:flutter/material.dart';
import 'package:fluttering_flat/utils/fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Footer',
        style:
            TextStyle(fontSize: ThemeFonts.xs, decoration: TextDecoration.none),
      ),
    );
  }
}
