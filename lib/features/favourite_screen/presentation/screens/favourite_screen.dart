import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/bloc/favourite_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../widgets/favourite_bloc_builder_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<FavouriteCharactersCubit>()..allFavouriteCharacters(),
        child: const FavouriteBlocBuilderWidget());
  }
}
