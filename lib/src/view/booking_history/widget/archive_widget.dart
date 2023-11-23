import 'package:flutter/material.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/text.dart';

class ArchiveWidget extends StatelessWidget {
  const ArchiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Appheight / 10,
      width: Appwidth / 2,
      child: Padding(
        padding: EdgeInsets.only(bottom: Appheight / 90),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: Appheight / 20,
                    width: Appwidth / 9,
                    child: Icon(Icons.abc),
                  ),
                ),
                CustomText(
                  text: "text",
                  weight: FontWeight.bold,
                  size: 14,
                  alignment: Alignment.center,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
