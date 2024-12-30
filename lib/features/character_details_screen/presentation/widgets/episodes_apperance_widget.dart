import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/entity/character_details_entity.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/widgets/app_main_text.dart';
import 'episode_item.dart';

class EpisodesAppearanceWidget extends StatelessWidget {
  final CharacterDetailsEntity character;

  const EpisodesAppearanceWidget({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppMainText(
          'Episodes Appearance',
          maxLines: 1,
          textAlign: TextAlign.center,
          font: 15.sp,
          weight: FontWeightHelper.bold,
          color: ColorsManager.black,
        ),
        10.hSpace,
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.9,
              mainAxisSpacing: 15,
              crossAxisSpacing: 20),
          itemBuilder: (context, i) =>
              EpisodeItem(episode: character.listOfEpisodes![i]),
          itemCount: character.listOfEpisodes!.length,
        )
      ],
    );
  }
}
