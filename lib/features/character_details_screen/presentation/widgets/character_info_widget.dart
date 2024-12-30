import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/entity/character_details_entity.dart';

import 'character_details_info_widget.dart';

class CharacterInfoWidget extends StatelessWidget {
  final CharacterDetailsEntity character;

  const CharacterInfoWidget({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CharacterDetailsInfoWidget(title: 'Status', data: character.status!),
        10.hSpace,
        CharacterDetailsInfoWidget(title: 'Species', data: character.species!),
        if (character.type!.isNotEmpty) 10.hSpace,
        if (character.type!.isNotEmpty)
          CharacterDetailsInfoWidget(title: 'Type', data: character.type!),
        10.hSpace,
        CharacterDetailsInfoWidget(title: 'Gender', data: character.gender!),
        10.hSpace,
        CharacterDetailsInfoWidget(
            title: 'Origin', data: character.origin!.name!),
        10.hSpace,
        CharacterDetailsInfoWidget(
            title: 'Location', data: character.location!.name!),
      ],
    );
  }
}
