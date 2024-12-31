import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import '../../../../core/widgets/empty_text_widget.dart';
import 'favourite_character_item_widget.dart';

class FavouriteListWidget extends StatelessWidget {
  final List<FavouriteCharacterModel> characters;

  const FavouriteListWidget({required this.characters, super.key});

  @override
  Widget build(BuildContext context) {
    return characters.isNotEmpty
        ? GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.95,
                mainAxisSpacing: 15,
                crossAxisSpacing: 20),
            itemBuilder: (context, i) =>
                FavouriteCharacterItemWidget(character: characters[i]),
            itemCount: characters.length,
          )
        : const EmptyTextWidget(msg: 'No Favourite Character Found');
  }
}
