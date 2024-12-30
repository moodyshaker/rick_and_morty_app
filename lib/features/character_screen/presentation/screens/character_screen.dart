import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/widgets/character_bloc_builder_widget.dart';
import '../../../../core/di/dependency_injection.dart';
import '../bloc/character_bloc.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CharacterBlocBuilderWidget();
  }
}
