import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/widgets/app_main_text.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppMainText('Favourties'),);
  }
}
