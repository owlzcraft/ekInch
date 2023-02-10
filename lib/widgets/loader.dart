import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app/custom_widget/color.dart';

class LoadingIndicator extends StatelessWidget {
  final bool show;
  const LoadingIndicator({Key? key, this.show = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: SpinKitFadingCircle(color: KColors.orange));
  }
}
