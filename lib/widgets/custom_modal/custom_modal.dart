import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/navigator/navigator1_helper.dart';
import '../../core/theme/app_theme.dart';
import '../../data/vo/pet.dart';
import '../../home/domain/entity/home_entity.dart';
import '../../home/domain/services/pets_service.dart';
import '../../l10n/generated/l10n.dart';
import '../../pets/domain/entity/pets_enitity.dart';
import '../snackbar/snackbar.dart';
import '../text_fields/app_textfield/app_textfield.dart';

Future<dynamic> customModal(
  BuildContext context,
  AppTextfield nameField,
  AppTextfield lastNameFiled,
  AppTextfield phoneNumber,
  Pet pet,
) {
  final model = context.read<PetsService>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        title: Text(
          S.of(context).leaveAnApplication,
          style: context.text.s20w500,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameField,
              const SizedBox(height: 16),
              lastNameFiled,
              const SizedBox(height: 16),
              phoneNumber,
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: context.button.elevated1,
                      onPressed: () {
                        if (nameField.data.validate &&
                            lastNameFiled.data.validate &&
                            phoneNumber.data.validate) {
                          if (pet.favoriteId != null) {
                            for (var i in model.listPets) {
                              if (i.id == pet.id) {
                                model.removePetFavorites(pet);
                              }
                            }
                            BlocProvider.of<HomeEntity>(context)
                                .add(DeleteFavoriteHomeEvent(pet: pet));
                          }

                          context.router.pop();
                          showCustomSnackbar(
                            context,
                            S.of(context).successWeCallBack,
                            context.color.success,
                          );
                          BlocProvider.of<PetsEntity>(context).add(InitialPetsEvent());
                          BlocProvider.of<HomeEntity>(context).add(DataHomeEvent());
                        }
                      },
                      child: Text(S.of(context).submit),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).close),
          )
        ],
      );
    },
  );
}
