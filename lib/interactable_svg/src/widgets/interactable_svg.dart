import 'package:flutter/material.dart';
import './region_painter.dart';
import '../models/region.dart';
import '../parser.dart';
import '../size_controller.dart';

class InteractableSvg extends StatefulWidget {
  final double? width;
  final double? height;
  final String svgAddress;
  final Function(Region? region) onChanged;
  final Color? strokeColor;
  final double? strokeWidth;
  final Color? selectedColor;
  final Color? dotColor;
  final bool? toggleEnable;
  final String? unSelectableId;
  final bool? centerDotEnable;
  final bool? centerTextEnable;
  final TextStyle? centerTextStyle;

  const InteractableSvg({Key? key,
    required this.svgAddress,
    required this.onChanged,
    this.width,
    this.height,
    this.strokeColor,
    this.strokeWidth,
    this.selectedColor,
    this.dotColor,
    this.unSelectableId,
    this.centerDotEnable,
    this.centerTextEnable,
    this.centerTextStyle,
    this.toggleEnable})
      : super(key: key);

  @override
  InteractableSvgState createState() => InteractableSvgState();
}

class InteractableSvgState extends State<InteractableSvg> {
  final List<Region> _regionList = [];
  Region? selectedRegion;

  final _sizeController = SizeController.instance;
  Size? mapSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRegionList();
    });
  }

  _loadRegionList() async {
    final list = await Parser.instance.svgToRegionList(widget.svgAddress);
    _regionList.clear();
    setState(() {
      _regionList.addAll(list);
      mapSize = _sizeController.mapSize;
    });
  }

  void clearSelect() {
    setState(() {
      selectedRegion = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var region in _regionList) _buildStackItem(region),
      ],
    );
  }

  Widget _buildStackItem(Region region) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () =>
      (widget.toggleEnable ?? false) ? _toggleButton(region) : _useButton(region),
      child: CustomPaint(
        isComplex: true,
        foregroundPainter: RegionPainter(
            region: region,
            selectedRegion: selectedRegion,
            dotColor: widget.dotColor,
            selectedColor: widget.selectedColor,
            strokeColor: widget.strokeColor,
            centerDotEnable: widget.centerDotEnable,
            centerTextEnable: widget.centerTextEnable,
            centerTextStyle: widget.centerTextStyle,
          strokeWidth: widget.strokeWidth,
          unSelectableId: widget.unSelectableId

        ),
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? double.infinity,
          constraints: BoxConstraints(
              maxWidth: mapSize?.width ?? 0, maxHeight: mapSize?.height ?? 0),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  void _toggleButton(Region region) {
    if(region.id != widget.unSelectableId){
    setState(() {
      if (selectedRegion == region) {
        selectedRegion = null;
      } else {
        selectedRegion = region;
      }
      widget.onChanged.call(selectedRegion);
    });
  }
  }

  void _useButton(Region region) {
    if (region.id != widget.unSelectableId) {
      setState(() {
        selectedRegion = region;
        widget.onChanged.call(selectedRegion);
      });
    }
  }
}
