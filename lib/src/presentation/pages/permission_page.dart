import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatelessWidget {
  final Function onSuccess;

  const PermissionPage({Key? key, required this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PermissionCubit cubit = GetIt.I();
    return BlocListener<PermissionCubit, PermissionCubitState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is PermissionData &&
            state.permissions[Permissions.file] == PermissionStatus.granted) {
          onSuccess();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Icon(
                  Icons.folder,
                  size: 24.0,
                ),
                Text(AppLocalizations.of(context)!.permissionPageText),
                TextButton(
                    onPressed: () {
                      cubit.checkFile();
                    },
                    child: Text(AppLocalizations.of(context)!.permissionPageButton))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
