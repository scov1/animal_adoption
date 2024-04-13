import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../core/navigator/navigator1_helper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/dto/pet.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';
import '../../details_pet_screen/details_pet_screen.dart';
import '../../home_screen/data/bloc/bloc.dart';
import '../../home_screen/data/services/pets_service.dart';
import '../data/bloc/bloc.dart';

class GridPets extends StatefulWidget {
  GridPets({required this.pets, Key? key}) : super(key: key);

  final List<Pet> pets;

  @override
  State<GridPets> createState() => _GridPetsState();
}

class _GridPetsState extends State<GridPets> {
  @override
  Widget build(BuildContext context) {
    return widget.pets.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  context.rootRouter.use.push(DetailsPetScreen(pet: widget.pets[i]));
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.pets[i].imageUrl ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                Assets.images.cat1.path,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF000000).withOpacity(0),
                            const Color(0xFF000000),
                          ],
                          stops: const [
                            0.60,
                            0.96,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18, bottom: 8, right: 15),
                                      child: Text(
                                        widget.pets[i].name ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: context.text.s12w400.copyWith(
                                          color: context.color.background,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.pets[i].temperament?.split(',').first ?? 'Playful',
                                      style: context.text.s12w400
                                          .copyWith(color: context.color.greyTextColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 20),
                          child: InkWell(
                            onTap: () async {
                              //       final _box = await Hive.openBox('pet');
                              if (widget.pets[i].favoriteId == null &&
                                  widget.pets[i].referenceImageId != null) {
                                BlocProvider.of<PetsBloc>(context)
                                    .add(AddToFavoritePetsEvent(pet: widget.pets[i]));
                              } else if (widget.pets[i].favoriteId != null &&
                                  widget.pets[i].referenceImageId != null) {
                                BlocProvider.of<PetsBloc>(context)
                                    .add(DeleteFavoritePetsEvent(pet: widget.pets[i]));
                              }

                              BlocProvider.of<HomeBloc>(context).add(DataHomeEvent());
                              //print("Grid Home hive");
                              // print(_box.values.toList().length);
                              // print("SCREEN FavoriteID");
                              // for (var i in _box.values.toList()) {
                              //   print(i.name);
                              // }
                            },
                            child: widget.pets[i].favoriteId == null
                                ? SvgPicture.asset(
                                    Assets.svg.icFavorite,
                                    colorFilter: ColorFilter.mode(
                                      context.color.grey100,
                                      BlendMode.srcIn,
                                    ),
                                    height: 15,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    size: 18,
                                    color: context.color.grey100,
                                  ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: widget.pets.length,
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.svg.icEmpty,
                ),
                const SizedBox(height: 42),
                Text(
                  S.of(context).oops,
                  style: context.text.h20w700,
                ),
                const SizedBox(height: 24),
                Text(
                  S.of(context).sorryWeDidntFind,
                  style: context.text.s14w400.copyWith(color: context.color.grey700),
                ),
              ],
            ),
          );
  }
}
