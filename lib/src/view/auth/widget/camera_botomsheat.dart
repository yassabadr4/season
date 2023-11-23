import 'package:flutter/material.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/text.dart';


class SucssBottomSheet extends StatelessWidget {
  const SucssBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: Appwidth,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: "Choose Profile Photo",
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
                onPressed: () {},
                label: const Text("camera"),
              ),
              SizedBox(
                width: 40,
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.image,
                ),
                onPressed: () {},
                label: const Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
