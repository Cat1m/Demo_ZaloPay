import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter/configs/color/color.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({super.key, this.size = 36.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(
                color: AppColors.darkPurplePink,
              )
            : const CircularProgressIndicator(
                strokeWidth: 2.0,
                color: AppColors.darkPurplePink,
              ),
      ),
    );
  }
}
