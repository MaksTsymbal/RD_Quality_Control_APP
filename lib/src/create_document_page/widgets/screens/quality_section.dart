import 'dart:io';
import 'package:check_point/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhotoSectionQuality extends StatefulWidget {
  const PhotoSectionQuality({super.key});

  @override
  State<PhotoSectionQuality> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends State<PhotoSectionQuality> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      final provider =
          Provider.of<QualityControlDocumentProvider>(context, listen: false);
      provider.setPhotoQuality(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QualityControlDocumentProvider>(context);
    final File? photo = provider.photo_quality_control;
    final theme = AppTheme.themeOf(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: theme.colorScheme.primary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: photo != null
                ? Image.file(
                    photo,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.camera_alt,
                    size: 100,
                    color: Colors.black45,
                  ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: Text(AppLocalizations.of(context)!.add_photo_from_gallery, style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black)),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: Text(AppLocalizations.of(context)!.make_photo, style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
