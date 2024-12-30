import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/entity/character_details_entity.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/widgets/character_details_info_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/widgets/app_main_text.dart';
import 'character_info_widget.dart';
import 'episodes_apperance_widget.dart';

class CharacterWidget extends StatelessWidget {
  final CharacterDetailsEntity character;

  const CharacterWidget({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: FancyShimmerImage(
                  imageUrl: character.image!,
                  height: 200.h,
                  width: 200.w,
                  errorWidget: Image.asset(
                    'app_icon',
                    height: 200.h,
                    width: 200.w,
                  ),
                ),
              ),
            ],
          ),
          10.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppMainText(
                '${character.name}',
                maxLines: 1,
                textAlign: TextAlign.center,
                font: 20.sp,
                weight: FontWeightHelper.bold,
                color: ColorsManager.black,
              ),
            ],
          ),
          10.hSpace,
          CharacterInfoWidget(character: character),
          20.hSpace,
          EpisodesAppearanceWidget(character: character),
        ],
      ),
    );
  }
}
