import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/widgets/search_filter_widget.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/app_loading_widget.dart';
import '../bloc/character_bloc.dart';
import '../bloc/character_states.dart';
import 'character_list_widget.dart';

class CharacterBlocBuilderWidget extends StatelessWidget {
  const CharacterBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterStates>(
      buildWhen: (previous, current) =>
          current is CharacterLoadingState ||
          current is CharacterErrorState ||
          current is CharacterSuccessState,
      builder: (context, state) {
        return Column(
          children: [
            if (state is CharacterSuccessState ||
                (state is CharacterErrorState &&
                    (context
                        .read<CharacterCubit>()
                        .characterNameController
                        .text
                        .isNotEmpty || context
                        .read<CharacterCubit>()
                        .characterStatusController
                        .text
                        .isNotEmpty || context
                        .read<CharacterCubit>()
                        .characterSpeciesController
                        .text
                        .isNotEmpty)))
              8.hSpace,
            if (state is CharacterSuccessState ||
                (state is CharacterErrorState &&
                    (context
                        .read<CharacterCubit>()
                        .characterNameController
                        .text
                        .isNotEmpty || context
                        .read<CharacterCubit>()
                        .characterStatusController
                        .text
                        .isNotEmpty || context
                        .read<CharacterCubit>()
                        .characterSpeciesController
                        .text
                        .isNotEmpty)))
              const SearchFilterWidget(),
            if (state is CharacterSuccessState ||
                (state is CharacterErrorState &&
                    (context
                        .read<CharacterCubit>()
                        .characterNameController
                        .text
                        .isNotEmpty || context
                        .read<CharacterCubit>()
                        .characterStatusController
                        .text
                        .isNotEmpty || context
                        .read<CharacterCubit>()
                        .characterSpeciesController
                        .text
                        .isNotEmpty)))
              4.hSpace,
            Expanded(
              child: switch (state) {
                CharacterInitState() => const SizedBox.shrink(),
                CharacterLoadingState() => const AppLoadingWidget(),
                CharacterSuccessState() => CharacterListWidget(
                    characters: state.characterList, isPaging: state.isPaging),
                CharacterErrorState() =>
                  AppErrorWidget(errorModel: state.apiErrorModel),
              },
            ),
          ],
        );
      },
    );
  }
}
