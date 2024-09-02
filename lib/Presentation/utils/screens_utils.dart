enum DeviceType { MOBILE, TABLET, PC }

class ScreensUtils {
  static const double mobileMaxSize = 540;
  static const double tabletMaxSize = 868;
  static const double pcMinSize = 869;

  static DeviceType getdevicetype(double width) {
    if (width <= mobileMaxSize) {
      return DeviceType.MOBILE;
    } else if (width <= tabletMaxSize) {
      return DeviceType.TABLET;
    }
    return DeviceType.PC;
  }
}
