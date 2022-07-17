import 'package:flutter/material.dart';

import '../components/shimmer_widget.dart';

class CoinShimmer {
  Widget buildCoinShimmer() => ListTile(
        leading: ShimmerWidget.circular(
          width: 40,
          heigth: 40,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        title: const ShimmerWidget.rectangular(heigth: 16),
        subtitle: const ShimmerWidget.rectangular(heigth: 14),
      );
}
