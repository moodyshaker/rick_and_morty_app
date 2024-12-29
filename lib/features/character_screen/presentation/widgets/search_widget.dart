import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_states.dart';

import '../../../../core/widgets/app_text_form_field.dart';
import '../bloc/character_bloc.dart';

class SearchWidget extends StatelessWidget {
  final CharacterStates currentState;

  const SearchWidget({required this.currentState, super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: context.read<CharacterCubit>().characterNameController,
      hintText: 'Character Name',
      textInputAction: TextInputAction.search,
      onSubmit: (value) {
        context.read<CharacterCubit>().getCharacterData();
      },
      suffixIcon: const Icon(
        Icons.search,
        size: 25,
      ).onPressed(() {
        context.read<CharacterCubit>().getCharacterData();
      }),
    ).horSpace(12.w);
  }
}
