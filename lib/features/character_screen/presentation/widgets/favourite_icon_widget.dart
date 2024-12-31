import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/bloc/character_details_bloc.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/entity/character_entity.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/bloc/favourite_bloc.dart';

class FavouriteIconWidget extends StatefulWidget {
  final Character character;

  const FavouriteIconWidget({required this.character, super.key});

  @override
  State<FavouriteIconWidget> createState() => _FavouriteIconWidgetState();
}

class _FavouriteIconWidgetState extends State<FavouriteIconWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    widget.character.isFavourite =
        await context.read<CharacterCubit>().isFavourite(widget.character.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      child: Image.asset(
        widget.character.isFavourite ? 'fav_icon'.png : 'unfav_icon'.png,
        height: 20.h,
        width: 20.w,
      ).onPressed(() {
        widget.character.isFavourite
            ? context
                .read<CharacterCubit>()
                .deleteFromFavourites(widget.character.id!)
            : context
                .read<CharacterCubit>()
                .addItemToFavourite(widget.character);
         widget.character.isFavourite = !widget.character.isFavourite;
      }),
    );
  }
}
