import 'dart:io';
import 'package:check_point/common/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhotoSectionSecurity extends StatefulWidget {
  const PhotoSectionSecurity({super.key});

  @override
  State<PhotoSectionSecurity> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends State<PhotoSectionSecurity> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _webImageBytes;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        final provider =
            Provider.of<QualityControlDocumentProvider>(context, listen: false);

        if (kIsWeb) {
          final webImageBytes = await pickedFile.readAsBytes();
          setState(() {
            _webImageBytes = webImageBytes;
          });
        } else {
          provider.setPhotoSecurity(File(pickedFile.path));
        }
      }
    } catch (e) {
      _showErrorDialog(context,
          'Помилка отримання файлу. Спробуйте це зробити не на симуляторі');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Помилка',
            style: TextStyle(color: Colors.black),
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QualityControlDocumentProvider>(context);
    final File? photo = provider.photo_security_control;
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: kIsWeb
                  ? (_webImageBytes != null
                      ? Image.memory(
                          _webImageBytes!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.camera_alt,
                          size: 100,
                          color: Colors.black45,
                        ))
                  : (photo != null
                      ? Image.file(
                          photo,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.camera_alt,
                          size: 100,
                          color: Colors.black45,
                        )),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: Text(AppLocalizations.of(context)!.add_photo_from_gallery,
                style:
                    theme.textTheme.bodyMedium!.copyWith(color: Colors.black)),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: Text(AppLocalizations.of(context)!.make_photo,
                style:
                    theme.textTheme.bodyMedium!.copyWith(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
