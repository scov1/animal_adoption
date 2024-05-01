import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/error_handler/error_handler.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/main_search_field/main_search_field.dart';
import '../../../widgets/pagination_wrapper/pagination_wrapper.dart';
import '../../../widgets/snackbar/snackbar.dart';
import '../domain/entity/pets_enitity.dart';
import 'widgets/grid_pets.dart';

class PetsScreen extends StatefulWidget {
  PetsScreen({Key? key}) : super(key: key);

  @override
  _PetsScreenState createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  String? searchText;
  Timer? _debounce;
  @override
  void initState() {
    BlocProvider.of<PetsEntity>(context).add(InitialPetsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(canPop: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MainSearchField(
                    hintText: S.of(context).search,
                    onChanged: (String text) {
                      if (_debounce?.isActive ?? false) _debounce?.cancel();
                      _debounce = Timer(
                        const Duration(milliseconds: 500),
                        () {
                          if (text.isNotEmpty) {
                            context.read<PetsEntity>().add(SearchPetsEvent(searchText: searchText));
                          } else {
                            context.read<PetsEntity>().add(InitialPetsEvent());
                          }
                        },
                      );
                      searchText = text;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocConsumer<PetsEntity, PetsState>(
              bloc: BlocProvider.of<PetsEntity>(context),
              listener: (context, state) {
                if (state is ErrorPetsState) {
                  showCustomSnackbar(context, context.read<ErrorHandler>().handleError(state),
                      context.color.error);
                }
              },
              buildWhen: (p, c) =>
                  c is InitialPetsState ||
                  c is LoadingPetsState ||
                  c is ErrorPetsState ||
                  c is SearchPetsState,
              builder: (context, state) {
                if (state is LoadingPetsState) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is ErrorPetsState) {
                  return AppErrorWidget(
                    message: context.read<ErrorHandler>().handleError(state),
                    onRefresh: () {
                      context.read<PetsEntity>().add(InitialPetsEvent());
                    },
                  );
                }

                if (state is InitialPetsState) {
                  return Expanded(
                    child: PaginationWrapper<PetsEntity, PetsState, LoadingNextPageState>(
                      loadNextPageEvent: () {
                        context.read<PetsEntity>().add(NextPagePetsEvent());
                      },
                      onRefresh: () async {
                        context.read<PetsEntity>().add(InitialPetsEvent());
                      },
                      child: RefreshIndicator(
                        onRefresh: () async => context.read<PetsEntity>().add(InitialPetsEvent()),
                        child: GridPets(pets: state.pets),
                      ),
                    ),
                  );
                }
                if (state is SearchPetsState) {
                  return Expanded(child: GridPets(pets: state.pets));
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
