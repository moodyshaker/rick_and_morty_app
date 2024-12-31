import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_bloc.dart';
import '../../../../core/widgets/empty_text_widget.dart';
import '../../domain/entity/character_entity.dart';
import 'character_item_widget.dart';

class CharacterListWidget extends StatefulWidget {
  final List<Character> characters;
  final bool isPaging;

  const CharacterListWidget(
      {required this.characters, this.isPaging = false, super.key});

  @override
  State<CharacterListWidget> createState() => _CharacterListWidgetState();
}

class _CharacterListWidgetState extends State<CharacterListWidget> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!widget.isPaging) {
          context.read<CharacterCubit>().pagingCharacterData();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.characters.isNotEmpty
        ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GridView.builder(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 20),
                itemBuilder: (context, i) =>
                    CharacterItemWidget(character: widget.characters[i]),
                itemCount: widget.characters.length,
              ),
              if (widget.isPaging)
                Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      )),
                  child: const Center(
                    child: SpinKitDoubleBounce(
                      color: ColorsManager.mainColor,
                    ),
                  ),
                )
            ],
          )
        : const EmptyTextWidget(msg: 'No Characters Found');
  }
}
