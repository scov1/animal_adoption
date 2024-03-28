import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/init/core_di.dart';
import '../../../core/theme/app_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/error_retry_button.dart';
import '../data/bloc/bloc.dart';

class GridPets extends StatefulWidget {
  const GridPets({Key? key}) : super(key: key);

  @override
  State<GridPets> createState() => _GridPetsState();
}

class _GridPetsState extends State<GridPets> {
  bool checkFavorite = false;
  @override
  void initState() {
    CoreDi.getIt<HomeBloc>().add(DataHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).adoptPets,
              style: context.text.s20w500,
            ),
            Text(
              S.of(context).showAll,
              style: context.text.s16w400,
            ),
          ],
        ),
        const SizedBox(height: 16),
        BlocBuilder<HomeBloc, HomeState>(
          bloc: CoreDi.getIt<HomeBloc>(),
          builder: (context, state) {
            if (state is ErrorHomeState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ErrorRetryButton(
                  errorText: state.error,
                  onTap: () {
                    CoreDi.getIt<HomeBloc>().add(DataHomeEvent());
                  },
                ),
              );
            }
            if (state is LoadingHomeState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DataHomeState) {
              return GridView.builder(
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
                            state.pets[i].imageUrl ?? '',
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
                                      state.pets[i].name ?? '',
                                      style: context.text.s12w400.copyWith(
                                          color: context.color.background,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      state.pets[i].temperament?.split(',').first ?? 'Playful',
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
                              onTap: () {
                                checkFavorite = !checkFavorite;
                                setState(() {});
                              },
                              child: checkFavorite == false
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
                itemCount: state.pets.length,
              );
            }
            return SizedBox.shrink();
          },
        )
      ],
    );
  }
}
