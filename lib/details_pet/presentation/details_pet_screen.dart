import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/init/core_di.dart';
import '../../../core/navigator/navigator1_helper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/snackbar/snackbar.dart';
import '../../core/utils/formatters.dart';
import '../../data/vo/pet.dart';
import '../../widgets/custom_modal/custom_modal.dart';
import '../../widgets/text_fields/app_textfield/app_textfield.dart';
import '../../widgets/text_fields/phone_textfield.dart';
import '../domain/entity/details_pet_entity.dart';
import 'widgets/details_characteristics.dart';
import 'widgets/details_main_section.dart';

class DetailsPetScreen extends StatefulWidget {
  DetailsPetScreen({required this.pet, Key? key}) : super(key: key);

  final Pet pet;

  @override
  _DetailsPetScreenState createState() => _DetailsPetScreenState();
}

class _DetailsPetScreenState extends State<DetailsPetScreen> {
  late final AppTextfield nameField;
  late final AppTextfield lastNameFiled;
  late final PhoneTextfield phoneNumber;

  @override
  void initState() {
    nameField = AppTextfield(
      data: AppTextfieldData(
        validator: AppTextfield.defaultValidator,
        hintText: S.current.firstName,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z-\s]')),
        ],
      ),
    );
    lastNameFiled = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.lastName,
        validator: AppTextfield.defaultValidator,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z-\s]')),
        ],
      ),
    );
    phoneNumber = PhoneTextfield(
      data: PhoneTextfieldData(
        hintText: S.current.phoneNumber,
        keyboardType: TextInputType.number,
        inputFormatters: [
          Formatters.phoneFormatter,
        ],
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocListener<DetailsPetEntity, DetailsPetState>(
          bloc: CoreDi.getIt<DetailsPetEntity>(),
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
                                              CoreDi.getIt<DetailsPetEntity>().add(
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
                                    DetailsMainSection(
                                      natural: widget.pet.natural,
                                      origin: widget.pet.origin,
                                      metric: widget.pet.weight?.metric,
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
                                                    margin:
                                                        const EdgeInsets.only(right: 8, bottom: 12),
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
                                        DetailsCharacteristics(
                                          title: S.of(context).adaptability,
                                          amount: widget.pet.adaptability,
                                        ),
                                        DetailsCharacteristics(
                                          title: S.of(context).socialNeeds,
                                          amount: widget.pet.socialNeeds,
                                        ),
                                        DetailsCharacteristics(
                                          title: S.of(context).energyLevel,
                                          amount: widget.pet.energyLevel,
                                        ),
                                        DetailsCharacteristics(
                                          title: S.of(context).intelligence,
                                          amount: widget.pet.intelligence,
                                        ),
                                        DetailsCharacteristics(
                                          title: S.of(context).childFriendly,
                                          amount: widget.pet.childFriendly,
                                        ),
                                        DetailsCharacteristics(
                                          title: S.of(context).healthIssues,
                                          amount: widget.pet.healthIssues,
                                        ),
                                        DetailsCharacteristics(
                                          title: S.of(context).dogFriendly,
                                          amount: widget.pet.dogFriendly,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 16,
                          right: 16,
                          child: ElevatedButton(
                            style: context.button.elevated1,
                            onPressed: () {
                              customModal(
                                context,
                                nameField,
                                lastNameFiled,
                                phoneNumber,
                                widget.pet,
                              );
                            },
                            child: Text(S.of(context).adoptNow),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameField.dispose();
    lastNameFiled.dispose();
    phoneNumber.dispose();
    super.dispose();
  }
}
