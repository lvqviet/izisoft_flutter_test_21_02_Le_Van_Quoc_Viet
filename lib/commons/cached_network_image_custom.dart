import 'package:shimmer/shimmer.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class CachedImageNetworkWidget extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? urlError;

  const CachedImageNetworkWidget(
      {super.key, required this.url, this.fit, this.height, this.width, this.urlError});

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _buildErrorWidget();
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => _buildPlaceHolder(),
      errorWidget: (context, url, error) => _buildErrorWidget(),
      fit: fit ?? BoxFit.cover,
    );
  }

  Widget _buildPlaceHolder() {
    return Shimmer.fromColors(
      baseColor: AppColors.color262626,
      highlightColor: AppColors.color434343,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: AppColors.color1F1F1F,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primaryLight,
      child: const Icon(Icons.image),
    );
  }
}
