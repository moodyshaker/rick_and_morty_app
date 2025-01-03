import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/core/theming/font_weight_helper.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/screens/character_details_screen.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/widgets/character_item_info_widget.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/widgets/favourite_character_item_info_widget.dart';
import '../../../../core/widgets/app_main_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'delete_favourite_widget.dart';

class FavouriteCharacterItemWidget extends StatelessWidget {
  final FavouriteCharacterModel character;

  const FavouriteCharacterItemWidget({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: ColorsManager.moreLighterGray,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                    color: ColorsManager.black.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: const Offset(3, 0))
              ]),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: FancyShimmerImage(
                  imageUrl: character.image,
                  height: 80.h,
                  width: 80.w,
                  errorWidget: Image.asset(
                    'app_icon',
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
              ),
              4.hSpace,
              AppMainText(
                character.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                font: 14.sp,
                weight: FontWeightHelper.bold,
                color: ColorsManager.black,
              ),
              8.hSpace,
              FavouriteCharacterItemInfoWidget(
                  infoTitle: 'Species:', infoData: character.species),
              4.hSpace,
              FavouriteCharacterItemInfoWidget(
                  infoTitle: 'Status:', infoData: character.status),
              4.hSpace,
              FavouriteCharacterItemInfoWidget(
                  infoTitle: 'Gender:', infoData: character.gender),
            ],
          ),
        ).onPressed(() {
          context.push(CharacterDetailsScreen(
              id: character.id, characterName: character.name));
        }),
        DeleteFavouriteWidget(character: character),
      ],
    );
  }
}
