import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/bloc/favourite_bloc.dart';

import '../../../character_screen/presentation/bloc/character_bloc.dart';

class DeleteFavouriteWidget extends StatelessWidget {
  final FavouriteCharacterModel character;

  const DeleteFavouriteWidget({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      child: Image.asset(
        'delete_icon'.png,
        height: 20.h,
        width: 20.w,
      ).onPressed(() {
         context
            .read<FavouriteCharactersCubit>()
            .deleteFromFavourites(character.id);
      }),
    );
  }
}
