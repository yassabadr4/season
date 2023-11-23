import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefuletImageUser extends StatelessWidget {
  const DefuletImageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10000.0),
      child: CachedNetworkImage(
        imageUrl:
            "https://t3.ftcdn.net/jpg/05/60/26/08/360_F_560260869_mn1UoigbHqcaF0vxeOuBrcMY3FFfM1nh.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
