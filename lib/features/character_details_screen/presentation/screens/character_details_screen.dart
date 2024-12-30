import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/widgets/app_error_widget.dart';
import 'package:rick_and_morty_app/core/widgets/app_loading_widget.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/bloc/character_details_bloc.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/bloc/character_details_bloc.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/bloc/character_details_states.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/widgets/app_main_text.dart';
import '../../../home_screen/presentation/bloc/home_bloc.dart';
import '../widgets/character_widget.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final int id;
  final String characterName;

  const CharacterDetailsScreen({
    required this.id,
    required this.characterName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CharacterDetailsCubit>()..getCharacterDetailsData(id),
      child: Scaffold(
        backgroundColor: ColorsManager.moreLighterGray,
        body: SafeArea(
          child: BlocBuilder<CharacterDetailsCubit, CharacterDetailsStates>(
            builder: (context, state) {
              return switch (state) {
                CharacterDetailsInitState() => const SizedBox.shrink(),
                CharacterDetailsLoadingState() => const AppLoadingWidget(),
                CharacterDetailsSuccessState() => CharacterWidget(
                    character: state.characterEntity,
                  ),
                CharacterDetailsErrorState() =>
                  AppErrorWidget(errorModel: state.apiErrorModel),
              };
            },
          ),
        ),
      ),
    );
  }
}
