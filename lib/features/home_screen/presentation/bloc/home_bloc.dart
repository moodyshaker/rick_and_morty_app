import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/home_screen/presentation/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../character_screen/presentation/screens/character_screen.dart';
import '../../../favourite_screen/presentation/screens/favourite_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  int currentIndex = 0;
  String title = 'Characters';
  Widget currentScreen = const CharacterScreen();

  List<String> iconList = [
    'character_icon',
    'favourite_icon',
  ];

  void changeCurrent(int i) {
    currentIndex = i;
    changeCurrentScreen();
    emit(HomeChangeCurrentState());
  }

  void changeCurrentScreen() {
    switch (currentIndex) {
      case 0:
        title = 'Characters';
        currentScreen = const CharacterScreen();
        break;
      case 1:
        title = 'Favourites';
        currentScreen = const FavouriteScreen();
        break;
    }
  }
}
