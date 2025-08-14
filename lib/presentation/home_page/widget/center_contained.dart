import 'package:flutter/material.dart';

class CenterContainedFabLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final fabSize = scaffoldGeometry.floatingActionButtonSize;
    final scaffoldWidth = scaffoldGeometry.scaffoldSize.width;

    final fabX = (scaffoldWidth - fabSize.width) / 2;

    final bottomBarHeight =
        scaffoldGeometry.scaffoldSize.height - scaffoldGeometry.contentBottom;

    final fabY =
        scaffoldGeometry.contentBottom -
        bottomBarHeight / 20 -
        fabSize.height / 7;

    return Offset(fabX, fabY);
  }
}
