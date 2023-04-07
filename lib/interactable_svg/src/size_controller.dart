import 'dart:ui';
import 'models/region_area.dart';

class SizeController {
  static SizeController? _instance;

  static SizeController get instance {
    _instance ??= SizeController._init();
    return _instance!;
  }

  SizeController._init();

  final RefionArea _regionArea = RefionArea();
  Size mapSize = Size.zero;

  void addBounds(Rect bound) {
    if (_regionArea.anyEmpty) {
      _regionArea
        ..minX = bound.left
        ..maxX = bound.right
        ..minY = bound.top
        ..maxY = bound.bottom;
    } else {
      if (bound.left < _regionArea.minX!) _regionArea.minX = bound.left;
      if (bound.right > _regionArea.maxX!) _regionArea.maxX = bound.right;
      if (bound.top < _regionArea.minY!) _regionArea.minY = bound.top;
      if (bound.bottom > _regionArea.maxY!) _regionArea.maxY = bound.bottom;
    }
    calculateArea();
  }

  void calculateArea() {
    if (_regionArea.anyEmpty) mapSize = Size.zero;

    double width = _regionArea.maxX! - _regionArea.minX!;
    double height = _regionArea.maxY! - _regionArea.minY!;

    mapSize = Size(width, height);
  }

  double calculateScale(Size? containerSize) {
    if (containerSize == null) {
      return 1.0;
    }

    // Aspect Ratio
    double newWidth = containerSize.width, newHeight = containerSize.height;
    if (containerSize.width > containerSize.height) {
      newHeight = 1 / (mapSize.aspectRatio / containerSize.width);
    } else {
      newHeight = containerSize.width / mapSize.aspectRatio;
    }
    containerSize = Size(newWidth, newHeight);

    // Scale for Responsive UI
    double scale1 = containerSize.width / mapSize.width;
    double scale2 = containerSize.height / mapSize.height;
    double mapScale = scale1 > scale2 ? scale1 : scale2;

    return mapScale;
  }

  double inverseOfScale(double scale) => 1.0 / scale;
}
