import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/text.dart';

class CameraBottomSheet extends StatelessWidget {
  const CameraBottomSheet({super.key, this.cameraOnpress, this.galleryOnpress});
  final VoidCallback? cameraOnpress;
  final VoidCallback? galleryOnpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: Appwidth,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: "Choose_Profile_Photo".trans,
            size: 18,
            weight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.camera,
                ),
                onPressed: cameraOnpress,
                label: Text("camera".trans),
              ),
              SizedBox(
                width: 40,
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.image,
                ),
                onPressed: galleryOnpress,
                label: Text("Gallery".trans),
              ),
            ],
          )
        ],
      ),
    );
  }
}
