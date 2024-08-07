import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:common_code/generated/l10n.dart';
import 'package:common_code/util/global_context.dart';
import 'package:dependencies/dependencies.dart';
import 'package:dependencies/image.dart' as img;
import 'package:flutter/material.dart';

Future<String?> pickAnImage([BuildContext? context]) async {
  ImagePicker imagePicker = ImagePicker();
  final imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
  if (imageFile == null) return null;

  final srcImageData = await imageFile.readAsBytes();
  final srcImageSize = srcImageData.lengthInBytes / 1024;

  Uint8List? imageData = srcImageData;
  String? mime = lookupMimeType(imageFile.path);

  if (srcImageSize >= 500) {
    GlobalContext().snackBar(S.current.processingImage);

    final cmd = await (img.Command()..decodeImageFile(imageFile.path))
            .executeThread(),
        image = await cmd.getImageThread(),
        // regex = RegExp(r"\..+$"),
        // ext = regex.firstMatch(imageFile.path),
        compressCmd = cmd
          ..copyResize(width: min(image?.width ?? 0, 1024))
          ..encodeJpg(quality: 85);
    // ..writeToFile(imageFile.path.replaceFirst(ext![0]!, '_compressed.jpg'));

    final cmdExec = await compressCmd.executeThread();

    GlobalContext().clearSnackbars();

    imageData = await cmdExec.getBytesThread();
    mime = 'image/jpeg';
  } else if (mime == null) {
    final cmd = img.Command()
          ..decodeImageFile(imageFile.path)
          ..encodeJpg(),
        encoded = await cmd.executeThread();

    imageData = await encoded.getBytesThread();
    mime = 'image/jpeg';
  }

  if (imageData == null) return null;

  return 'data:$mime;base64,${base64Encode(imageData)}';
}
