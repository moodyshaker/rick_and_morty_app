import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/widgets/app_text_form_field.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_bloc.dart';
import '../../domain/entity/character_entity.dart';
import 'character_item_widget.dart';

class CharacterListWidget extends StatelessWidget {
  final List<Character> characters;

  const CharacterListWidget({required this.characters, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.95,
          mainAxisSpacing: 15,
          crossAxisSpacing: 20),
      itemBuilder: (context, i) =>
          CharacterItemWidget(character: characters[i]),
      itemCount: characters.length,
    );
  }
}
