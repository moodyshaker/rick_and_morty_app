import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/bloc/favourite_bloc.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/bloc/favourite_states.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/app_loading_widget.dart';
import 'favourite_list_widget.dart';

class FavouriteBlocBuilderWidget extends StatelessWidget {
  const FavouriteBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCharactersCubit, FavouriteCharactersStates>(
      buildWhen: (previous, current) =>
          current is FavouriteCharactersLoadingState ||
          current is FavouriteCharactersSuccessState ||
          current is FavouriteCharactersErrorState,
      builder: (context, state) {
        return switch (state) {
          FavouriteCharactersInitState() => const SizedBox.shrink(),
          FavouriteCharactersLoadingState() => const AppLoadingWidget(),
          FavouriteCharactersSuccessState() => FavouriteListWidget(
              characters: state.favouriteList),
          FavouriteCharactersErrorState() =>
            AppErrorWidget(errorModel: state.apiErrorModel),
        };
      },
    );
  }
}
