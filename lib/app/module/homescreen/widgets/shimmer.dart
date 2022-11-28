// ignore: implementation_imports
import 'package:flutter/src/widgets/container.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobizy/app/util/colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const ShimmerWidget.rectangle(
      {this.height, this.width = double.infinity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: kGrey[500],
    );
  }
}
