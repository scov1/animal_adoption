import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/init/core_di.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/text_fields/app_textfield/app_textfield.dart';
import '../../home/domain/services/pets_service.dart';
import '../../widgets/custom_modal/custom_modal.dart';
import '../domain/entity/favorite_entity.dart';
import 'widgets/favorite_empty.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final AppTextfield nameField;
  late final AppTextfield lastNameFiled;
  late final AppTextfield phoneNumber;

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
        validator: AppTextfield.defaultValidator,
        hintText: S.current.lastName,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z-\s]')),
        ],
      ),
    );
    phoneNumber = AppTextfield(
      data: AppTextfieldData(
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
      appBar: CustomAppBar(
        canPop: false,
        titleChild: Text(
          S.of(context).favorites,
          style: context.text.h24w700,
        ),
      ),
      body: BlocBuilder<FavoriteEntity, FavoriteState>(
        bloc: CoreDi.getIt<FavoriteEntity>(),
        builder: (context, state) {
          return Consumer<PetsService>(
            builder: (context, petsModel, child) {
              return petsModel.listPets.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: context.color.paleMint.withOpacity(0.4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  color: Colors.amber,
                                  child: Image.network(
                                    petsModel.listPets[index].imageUrl ?? '',
                                    height: 100,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8),
                                            Text(
                                              petsModel.listPets[index].name ?? 'Kitty',
                                              style: context.text.h16w700,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              petsModel.listPets[index].origin ?? 'USA',
                                              style: context.text.s14w400
                                                  .copyWith(color: context.color.grey700),
                                            )
                                          ],
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(right: 12, top: 12),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: context.color.background),
                                            child: petsModel.listPets[index].natural == 0
                                                ? Icon(Icons.male)
                                                : Icon(Icons.female),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: context.button.outline1,
                                          onPressed: () {
                                            customModal(
                                              context,
                                              nameField,
                                              lastNameFiled,
                                              phoneNumber,
                                              petsModel.listPets[index],
                                            );
                                          },
                                          child: Text(
                                            S.of(context).adoptNow,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: petsModel.listPets.length,
                    )
                  : EmptyFavorite();
            },
          );
        },
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
