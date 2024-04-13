import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/dto/pet.dart';
import '../../../gen/assets.gen.dart';
import '../../pets_screen/data/bloc/bloc.dart';
import '../data/bloc/bloc.dart';
import '../data/services/pets_service.dart';

class HomeGridPets extends StatefulWidget {
  HomeGridPets({required this.pets, Key? key}) : super(key: key);

  final List<Pet> pets;

  @override
  State<HomeGridPets> createState() => _HomeGridPetsState();
}

class _HomeGridPetsState extends State<HomeGridPets> {
  @override
  Widget build(BuildContext context) {
    //  final model = context.read<PetsService>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, i) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.pets[i].imageUrl ?? '',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18, bottom: 8),
                              child: Text(
                                widget.pets[i].name ?? '',
                                style: context.text.s12w400.copyWith(
                                    color: context.color.background, fontWeight: FontWeight.w500),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 18, bottom: 20),
                      child: InkWell(
                        onTap: () async {
                          final _box = await Hive.openBox('pet');

                          //    _box.clear();

                          if (widget.pets[i].favoriteId == null &&
                              widget.pets[i].referenceImageId != null) {
                            //   model.addToFavorites(widget.pets[i]);
                            BlocProvider.of<HomeBloc>(context)
                                .add(AddToFavoriteHomeEvent(pet: widget.pets[i]));
                          } else if (widget.pets[i].favoriteId != null &&
                              widget.pets[i].referenceImageId != null) {
                            //    model.removeFromFavorites(widget.pets[i]);
                            BlocProvider.of<HomeBloc>(context)
                                .add(DeleteFavoriteHomeEvent(pet: widget.pets[i]));
                          }

                          BlocProvider.of<PetsBloc>(context).add(InitialPetsEvent());

                          // print("Grid Home hive");
                          // print(_box.keys.toList().length);
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
            );
          },
          itemCount: widget.pets.length,
        )
      ],
    );
  }
}
