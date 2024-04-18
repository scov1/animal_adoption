import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/init/core_di.dart';
import '../../core/navigator/navigator1_helper.dart';
import '../../core/theme/app_theme.dart';
import '../../data/dto/pet.dart';
import '../../gen/assets.gen.dart';
import '../../l10n/generated/l10n.dart';
import '../../widgets/snackbar/snackbar.dart';
import 'data/bloc/bloc.dart';

class DetailsPetScreen extends StatefulWidget {
  DetailsPetScreen({required this.pet, Key? key}) : super(key: key);

  final Pet pet;

  @override
  _DetailsPetScreenState createState() => _DetailsPetScreenState();
}

class _DetailsPetScreenState extends State<DetailsPetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: BlocListener<DetailsPetBloc, DetailsPetState>(
            bloc: CoreDi.getIt<DetailsPetBloc>(),
            listener: (context, state) {
              if (state is ErrorDetailsPetState) {
                context.router.pop();
                showCustomSnackbar(context, S.of(context).sorryYouCantShare, context.color.error);
              }
            },
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: constraints.maxHeight * .5,
                            left: 0,
                            right: 0,
                            child: Container(
                              child: Image.network(
                                widget.pet.imageUrl ?? '',
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
                          Positioned(
                            top: 60,
                            left: 15,
                            child: GestureDetector(
                              onTap: () {
                                context.router.pop();
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: context.color.background.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(Icons.close),
                              ),
                            ),
                          ),
                          Positioned(
                            top: constraints.maxHeight * .4,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: SingleChildScrollView(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                                child: Container(
                                  color: context.color.background,
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.pet.name ?? '',
                                            style: context.text.s20w500,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              if (widget.pet.name != null)
                                                CoreDi.getIt<DetailsPetBloc>().add(
                                                    ShareDetailsPetEvent(petId: widget.pet.name!));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 12.0),
                                              child: Icon(Icons.share),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 8, bottom: 12),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: context.color.accent,
                                            ),
                                            child: Text(
                                              widget.pet.natural == 0
                                                  ? S.of(context).male
                                                  : S.of(context).female,
                                              style: context.text.s14w400,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            margin: const EdgeInsets.only(right: 8, bottom: 12),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: context.color.accent,
                                            ),
                                            child: Text(
                                              widget.pet.origin ?? 'USA',
                                              style: context.text.s14w400,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            margin: const EdgeInsets.only(right: 8, bottom: 12),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: context.color.accent,
                                            ),
                                            child: Text(
                                              '> ${widget.pet.weight?.metric?.split(' - ')[1]} kg',
                                              style: context.text.s14w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      Text(
                                        S.of(context).personality,
                                        style: context.text.s16w400,
                                      ),
                                      const SizedBox(height: 16),
                                      Wrap(
                                        children: widget.pet.temperament
                                                ?.split(', ')
                                                .map(
                                                  (e) => Container(
                                                      margin: const EdgeInsets.only(
                                                          right: 8, bottom: 12),
                                                      padding: const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                        color: context.color.accent,
                                                      ),
                                                      child: Text('$e')),
                                                )
                                                .toList() ??
                                            [],
                                      ),
                                      const SizedBox(height: 24),
                                      Text(
                                        S.of(context).breedCharacteristics,
                                        style: context.text.s16w400,
                                      ),
                                      const SizedBox(height: 24),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _buildCharacteristics(
                                              S.of(context).adaptability, widget.pet.adaptability),
                                          const SizedBox(height: 12),
                                          _buildCharacteristics(
                                              S.of(context).socialNeeds, widget.pet.socialNeeds),
                                          const SizedBox(height: 12),
                                          _buildCharacteristics(
                                              S.of(context).energyLevel, widget.pet.energyLevel),
                                          const SizedBox(height: 12),
                                          _buildCharacteristics(
                                              S.of(context).intelligence, widget.pet.intelligence),
                                          const SizedBox(height: 12),
                                          _buildCharacteristics(S.of(context).childFriendly,
                                              widget.pet.childFriendly),
                                          const SizedBox(height: 12),
                                          _buildCharacteristics(
                                              S.of(context).healthIssues, widget.pet.healthIssues),
                                          const SizedBox(height: 12),
                                          _buildCharacteristics(
                                              S.of(context).dogFriendly, widget.pet.dogFriendly),
                                          const SizedBox(height: 12),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildCharacteristics(String title, int? amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title),
        const SizedBox(width: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(5, (index) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor:
                      index < (amount ?? 0) ? context.color.lavanderBg : context.color.grey300,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  void _onShare(int id) async {}
}
