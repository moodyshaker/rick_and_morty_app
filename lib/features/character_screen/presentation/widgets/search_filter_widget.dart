import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/di/dependency_injection.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_states.dart';

import '../../../../core/router_manager/router_manager.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../bloc/character_bloc.dart';
import 'filter_character_data_dialog.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            controller: context.read<CharacterCubit>().characterNameController,
            hintText: 'Character Name',
            textInputAction: TextInputAction.search,
            onSubmit: (value) {
              context.read<CharacterCubit>().getCharacterData();
            },
            suffixIcon: const Icon(
              Icons.search,
              size: 25,
            ).onPressed(() {
              context.read<CharacterCubit>().getCharacterData();
            }),
          ),
        ),
        8.wSpace,
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: ColorsManager.lighterGray,
              boxShadow: [
                BoxShadow(
                    color: ColorsManager.black.withOpacity(0.05),
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(3, 0))
              ]),
          child: Center(
            child: Image.asset(
              'filter_icon'.png,
              height: 20.h,
              width: 20.w,
            ),
          ),
        ).onPressed(() {
          showDialog(
            context: navigatorKey.currentContext!,
            builder: (_) => FilterCharacterDataDialog(
              onConfirm: (String? speciesData, String? statusData) {
                context.read<CharacterCubit>().characterSpeciesController.text =
                    speciesData ?? '';
                context.read<CharacterCubit>().characterStatusController.text =
                    statusData ?? '';
                context.read<CharacterCubit>().getCharacterData();
              },
            ),
          );
        }),
      ],
    ).horSpace(12.w);
  }
}
