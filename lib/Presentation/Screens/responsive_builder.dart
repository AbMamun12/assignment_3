import 'package:assignment/Presentation/utils/screens_utils.dart';
import 'package:flutter/widgets.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget pc;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.pc,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final DeviceType deviceType = ScreensUtils.getdevicetype(size);
    if (deviceType == DeviceType.MOBILE) {
      return mobile;
    } else if (deviceType == DeviceType.TABLET) {
      return tablet ?? mobile;
    }
    return pc;
  }
}
