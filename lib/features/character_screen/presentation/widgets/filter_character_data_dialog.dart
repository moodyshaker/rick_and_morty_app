import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/router_manager/router_manager.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/core/widgets/app_main_text.dart';
import 'package:rick_and_morty_app/core/widgets/app_snack_bar.dart';
import 'package:rick_and_morty_app/core/widgets/app_text_button.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_states.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/widgets/filter_character_data_item.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/error_dialog.dart';

class FilterCharacterDataDialog extends StatefulWidget {
  final void Function(String?, String?) onConfirm;

  const FilterCharacterDataDialog({required this.onConfirm, super.key});

  @override
  State<FilterCharacterDataDialog> createState() =>
      _FilterCharacterDataDialogState();
}

class _FilterCharacterDataDialogState extends State<FilterCharacterDataDialog> {
  int? speciesIndex;
  String? speciesData;
  String? statusData;
  int? statusIndex;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: ColorsManager.white,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppMainText('Species Type'),
              8.hSpace,
              Column(
                  children: List.generate(
                      species.length,
                          (i) =>
                          FilterCharacterDataItem(
                            data: species[i],
                            isChosen: speciesIndex == i,
                          ).onPressed(() {
                            setState(() {
                              speciesIndex = i;
                            });
                            speciesData = species[speciesIndex!];
                          }))),
              8.hSpace,
              const AppMainText('Status Type'),
              8.hSpace,
              Column(
                  children: List.generate(
                      status.length,
                          (i) =>
                          FilterCharacterDataItem(
                            data: status[i],
                            isChosen: statusIndex == i,
                          ).onPressed(() {
                            setState(() {
                              statusIndex = i;
                            });
                            statusData = status[statusIndex!];
                          }))),
              20.hSpace,
              AppTextButton('Confirm', onPressed: () {
                if (speciesData != null || statusData != null) {
                  widget.onConfirm(speciesData, statusData);
                  context.pop;
                } else {
                  showDialog(
                      context: navigatorKey.currentContext!,
                      builder: (_) =>
                      const ErrorDialog(
                          msg:
                          'You need to choose status or species to filter'));
                }
              }),
              8.hSpace,
              AppTextButton('Cancel', onPressed: () {
                widget.onConfirm(speciesData, statusData);
                context.pop;
              }),
            ],
          )),
    );
  }
}

List<String> species = [
  'Humanoid',
  'Human',
  'Alien',
  'Mythological Creature',
];
List<String> status = [
  'Alive',
  'Dead',
  'Unknown',
];
