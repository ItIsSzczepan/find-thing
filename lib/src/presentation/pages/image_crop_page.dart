import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImageCropPage extends StatefulWidget {
  final XFile file;
  final Function(Uint8List) onCrop;

  const ImageCropPage({Key? key, required this.file, required this.onCrop}) : super(key: key);

  @override
  State<ImageCropPage> createState() => _ImageCropPageState();
}

class _ImageCropPageState extends State<ImageCropPage> {
  late Uint8List image = Uint8List(0);
  bool loading = false;

  final _cropController = CropController();

  @override
  void initState() {
    loadImage(widget.file);
    super.initState();
  }

  loadImage(XFile file) async {
    file.readAsBytes().then((value) => setState(() {
          image = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // ignore: unnecessary_null_comparison
                image.isNotEmpty
                    ? Expanded(
                      child: SizedBox(
                        child: Crop(
                          baseColor: Colors.white,
                            controller: _cropController,
                            image: image,
                            onCropped: (Uint8List value) {
                              setState((){
                                loading = false;
                              });
                              widget.onCrop(Uint8List(0));
                              widget.onCrop(value);
                            },
                          ),
                      ),
                    )
                    : const CircularProgressIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          context.router.pop();
                        },
                        icon: const Icon(Icons.close),
                        label: Text(AppLocalizations.of(context)!.cancel)),
                    TextButton.icon(
                        onPressed: () {
                          _cropController.crop();
                          setState((){
                            loading = true;
                          });
                        },
                        icon: const Icon(Icons.crop),
                        label: Text(AppLocalizations.of(context)!.crop))
                  ],
                )
              ],
            ),
            loading ? const Center(child: CircularProgressIndicator()) : Container(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: BackButton(
        onPressed: () => context.router.pop(),
      ),
      title: Text(AppLocalizations.of(context)!.cropImageTitle),
    );
  }
}
