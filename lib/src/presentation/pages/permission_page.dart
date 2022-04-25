import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatelessWidget {
  final Function onSuccess;

  const PermissionPage({Key? key, required this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionCubit, PermissionCubitState>(
      bloc: context.read<PermissionCubit>(),
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

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.folder,
                  size: 52.0,
                ),
                Text(AppLocalizations.of(context)!.permissionPageText, style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center,),
                ElevatedButton(
                    onPressed: () {
                      context.read<PermissionCubit>().checkFile();
                    },
                    child: Text(AppLocalizations.of(context)!.permissionPageButton)),
                ElevatedButton(
                    onPressed: () {
                      context.read<PermissionCubit>().openSettings();
                    },
                    child: Text(AppLocalizations.of(context)!.openSettings)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
