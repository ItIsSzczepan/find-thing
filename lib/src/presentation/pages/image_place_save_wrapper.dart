import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:find_thing/src/core/navigation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePlaceSavingWrapper extends StatefulWidget {
  final XFile file;
  final Function(bool) onSuccess;

  const ImagePlaceSavingWrapper({Key? key, required this.file, required this.onSuccess}) : super(key: key);

  @override
  State<ImagePlaceSavingWrapper> createState() => _ImagePlaceSavingWrapperState();
}

class _ImagePlaceSavingWrapperState extends State<ImagePlaceSavingWrapper> {
  Uint8List imageDataList = Uint8List(0);

  @override
  Widget build(BuildContext context) => AutoRouter.declarative(onNavigate: (matches){if(matches.last != SetNameRoute) imageDataList = Uint8List(0);},routes: (_){
    return [
      ImageCropRoute(file: widget.file, onCrop: (value){
        setState(() {
          imageDataList = value;
        });
      }),
      if (imageDataList.isNotEmpty) SetNameRoute(imageDataList: imageDataList, onSuccess: widget.onSuccess)
    ];
  });
}
