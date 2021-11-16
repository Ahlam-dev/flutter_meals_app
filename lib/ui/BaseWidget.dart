import 'package:flutter/material.dart';
import 'package:flutter_meals_app/ui/SizingInfo.dart';
import 'package:flutter_meals_app/utils/ui_utils.dart';


class ResponsiveBuilder extends StatelessWidget {

 final Widget Function(BuildContext context, SizingInformation sizeinfo) builder;
const ResponsiveBuilder({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxSizing) {

      var sizingInformation = SizingInformation(
        deviceType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
      );

      return builder(context, sizingInformation);
    });
  }

}