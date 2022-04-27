import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:find_thing/src/presentation/widgets/failure_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetNamePage extends StatelessWidget {
  final Uint8List imageDataList;
  final Function(bool) onSuccess;

  final TextEditingController _textController = TextEditingController();

  SetNamePage({Key? key, required this.imageDataList, required this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(controller: _textController),
          Expanded(child: Image.memory(imageDataList)),
          ElevatedButton.icon(onPressed: (){
            String name = _textController.text;
            context.read<ImageCubit>().savePlace(name: name, image: imageDataList).then((value) {
              if(value){
                onSuccess(true);
                context.router.popUntilRoot();
              }else{
                ImageCubitState state = context.read<ImageCubit>().state;
                if(state is ImageFailure){
                  failureSnackBar(failure: state.failure);
                }
              }
            });
          }, icon: const Icon(Icons.save), label: Text(AppLocalizations.of(context)!.save))
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.setName),
    );
  }

}
