import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/widgets/search_widget.dart';
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
          current is CharacterPagingState ||
          current is CharacterErrorState ||
          current is CharacterSuccessState,
      builder: (context, state) {
        return Column(
          children: [
            8.hSpace,
            SearchWidget(currentState: state),
            4.hSpace,
            Expanded(
              child: switch (state) {
                CharacterInitState() => const SizedBox.shrink(),
                CharacterLoadingState() => const AppLoadingWidget(),
                CharacterPagingState() => const SizedBox.shrink(),
                CharacterSuccessState() =>
                  CharacterListWidget(characters: state.characterList),
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
