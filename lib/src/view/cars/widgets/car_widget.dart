import 'package:flutter/material.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/text.dart';

class CarViewContainer extends StatelessWidget {
  final String productText;
  final String productImage;
  final VoidCallback onPress;

  const CarViewContainer({
    super.key,
    required this.productText,
    required this.productImage,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Appheight / 3.5,
      width: Appwidth / 2,
      child: Padding(
        padding: EdgeInsets.only(bottom: Appheight / 90),
        child: GestureDetector(
          onTap: onPress,
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          height: Appheight / 7,
                          width: Appwidth / 2.5,
                          child: Image.network(
                            productImage,
                            //  fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      CustomText(
                        text: productText,
                        weight: FontWeight.bold,
                        size: 14,
                        alignment: Alignment.center,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
